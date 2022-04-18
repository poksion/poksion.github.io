---
layout: post
title: "Sealed Macro"
date: 2009-07-05 06:50:00 +0900
categories: blog
tags: 프로그래밍
---

모던 C++ 디자인이라는 책은 봐도봐도 새로운 내용이 나온다.

그책에서 건진내용중에 하나인데, 클래스가 상속을 받을때 virtual table이 그냥 생기는것이 아니라 virtual 함수가 있을때만 생긴다는것 - '단위전략'은 [CRTP](/blog/2007/08/19/crtp.html)를 쓰기위해 다중상속을 활용하는데, 부모클래스에 virtual 함수가 있으면 부모마다 vtable이 생겨 오버헤드라는 이야기 - 이다.

나는 소멸자를 virtual로 만들지 않고 상속받을때의 무시무시함을 겪은적이 있다. 그래서 소멸자는 항상 virtual - 이것이 상속받을이유가 없는 클래스라도 - 로 하곤 했었는데, 그럴때마다 vtable을 만들거라 생각하니 찝찝했다. 그렇다고 상속을 허용하면서 소멸자를 virtual로 안하는것은 정말 귀신피하려다 호랑이 만나는꼴 당할수 있는일이라, 상속을 못받게 하는방법을 찾아보았다.

몇가지 좋은정보들을 찾았는데, 전부 [비얀할아버지가 작성한것](http://www.research.att.com/~bs/bs_faq2.html#no-derivation)을 기반으로 하고 있고 응용버전으로 [birdkr님의 템플렛버전](http://mypage.sarang.net/tt/entry/c%BF%A1%BC%AD-Java%C0%C7-final-%B5%FB%B6%F3%C7%CF%B1%E2)이 있었다. 그런데 gcc에서는 friend T는 안된다. - 사실, friend T는 표준 C++  문법이 아니다.

좀더 찾아보니 Boost Mailing List 에도 [비슷한 주제](http://lists.boost.org/Archives/boost/2006/04/102840.php)가 올라왔었고 [friend T 문제를 어느정도 해결한 방법](http://www.ddj.com/cpp/184403883)을사용한 [최종버전](http://lists.boost.org/Archives/boost/2006/04/102862.php)도 있더라 - 저것이 표준 Boost Library로 승인되었는지는 잘 모르겠다.

하늘은 뒤지는자의 편이라 했던가. (음?)

써먹기에는 영 마음에 들지 않아서 더 뒤져보니 [그럭저럭 마음에 드는 버전](http://www.experts-exchange.com/articles/Programming/Languages/CPP/Sealing-a-C-Class.html)을 찾을수 있었다. 옮겨보면,

```cpp

#define SEALED(className) \
    className ## Sealer \
        { \
            private: className ## Sealer(){}; \
            friend class className; \
        }; \
        class className : virtual private className ## Sealer \

class SEALED(MyClass) {};

```

무엇보다 비록 매크로지만 - 아니, 매크로라서 - 사용에 있어서 훨씬 직관적인 장점이 있다.

