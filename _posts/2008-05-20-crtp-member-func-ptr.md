---
layout: post
title: "CRTP와 멤버함수포인터"
date: 2008-05-20 21:13:00 +0900
categories: blog
tags: 프로그래밍  하드보일드
---

회사에서 네트워크 관련 라이브러리에서 CRTP를 활용할 수 있는 예가 있어서 만들어봤던 코드인데, 회사내의 정책이 바뀌어서 쓸모가 없어진 비운의 코드이다. 자랑할겸(-_-) 소스정리 해보았다. CRTP에 대해서는 예전글 참조

네트워크나 스크립트 엔진등에서 함수를 문자열을 통해 호출하는 경우가 많다. 예를들면

```cpp

CHelloPok aTestPok("Test pok on hello world 'key'...");
aTestPok.callFunc("key");
aTestPok.callFunc("id");

```

이런식으로 callFunc라는 메쏘드를 통해 "key"와 연결된 함수를 호출한다. 이렇게 하기 위해 일반적으로 두가지 방법을 사용한다. "key"에 연결된것이 static member 함수여서 map 자료형에 함수포인터를 담아놓거나 혹은 callFunc자체를 virtual로 두고 자식클래스 단에서 그것을 구현하는 경우다. 전자의 경우는 널리 사용되는 방법인데 멤버에 대한 접근성이 많이 부족하고 후자의 경우는 자식클래스단에서의 구현 알고리즘이 똑같은데 - 문자열에 대응하는 멤버함수를 연결 - 멤버함수마다 자료형이 달라서 어쩔수 없이 자식클래스 마다 따로 구현해야되는 문제때문에 많이 쓰이지는 않는다.

후자의 문제를 해결하기 위해 접근했던 방법이, 부모가 알고리즘을 가지고 자식의 자료형을 부모가 알고 있게 하면 어떻게 할수 있지 않을까 였고, 부모가 자식의 자료형을 알고 있게 하기 위해 CRTP를 사용하였다.

구현 소스를 보면 일단 호출 인터페이스가 있고

```cpp

class CrtpInterface
{
public:
    virtual ~CrtpInterface(){}
    virtual void callFunc(const char* _pSzFuncId) = 0;
};

```

그것을 상속받은 CRTP의 중간객체가 존재한다.

```cpp

template <typename T>
class CrtpImpl : public CrtpInterface
{
public:
    virtual void callFunc(const char* _pSzFuncKey)
    {
        FuncMap::iterator itr = funcMap_.find(_pSzFuncKey);
        if( itr == funcMap_.end() )
        {
            printf("Not Found '%s!'\n", _pSzFuncKey);
            return;
        }

        // call func
        (static_cast<T*>(this)->*(itr->second))();
    }

protected:
    typedef void (T::*Func)(void);
    void registerFunc(const char* _pSzFuncKey, Func _pFunc)
    {
        funcMap_[ _pSzFuncKey ] = _pFunc;
    }

private:
    typedef std::map< std::string, Func > FuncMap;
    FuncMap funcMap_;
};

```

몇가지 신기한 자료형이 나오는데, 메범함수 포인터 자료형은( (static_cast<T*>(this)->*(itr->second))(); ) C++의 재미있는 자료형중 하나이다. 뭐랄까.. 좀 심오한 자료형인데, 알렉산더레스쿠(-_- 맞나..)의 Modern C++ Design에 그에 대한 자세한 설명이 있다.(일반화된 Command Functor 설명부분에 있었던듯 하다.)

그리고 본격적으로 상속받아 기능을 구현하는 클래스들이 있고 그 클래스들을 활용하는 메인루프가 있을것이다.

```cpp

class CHelloWorld : public CrtpImpl< CHelloWorld >
{
public:
    CHelloWorld()
    {
        // key 라는 문자열에 CHelloWorld::helloWorld 멤버함수 연결
        registerFunc("key", &CHelloWorld::helloWorld );
    }

    void helloWorld()
    {
        printf("Hello World!\n");
    }
};

class CHelloPok : public CrtpImpl< CHelloPok >
{
public:
    CHelloPok(const char* _pSzContents) : strToSay_( _pSzContents )
    {
        // key 라는 문자열에 CHelloPok::helloPok 멤버함수 연결
        registerFunc("key", &CHelloPok::helloPok );

        // id 라는 문자열에 CHelloPok::whoAmI 멤버함수 연결
        registerFunc("id", &CHelloPok::whoAmI );
    }

    void helloPok()
    {
        printf("%s\n", strToSay_.c_str() );
    }

    void whoAmI()
    {
        printf("Hey, it's me. pok.\n\n");
    }

private:
    std::string strToSay_;
};

```

```cpp

int _tmain(int argc, _TCHAR* argv[])
{
    // 함수호출 테스트
    CHelloPok aTestPok("Test pok on hello world 'key'...");
    aTestPok.callFunc("key");
    aTestPok.callFunc("id");

    // 다형성 테스트
    CHelloWorld aHelloWorld;
    CHelloPok aHelloPok("Hello pok!");

    std::vector< CrtpInterface* > vecFunc;
    vecFunc.push_back(&aHelloWorld);
    vecFunc.push_back(&aHelloPok);

    for(std::vector< CrtpInterface* >::iterator itr = vecFunc.begin();
        itr != vecFunc.end(); ++itr )
    {
        (*itr)->callFunc("key");
    }
    return 0;
}

```

