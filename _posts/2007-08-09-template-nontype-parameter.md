---
layout: post
title: "Template Non-Type Parameter"
date: 2007-08-09 00:10:00 +0900
categories: blog
tags: 프로그래밍  하드보일드
---

템플렛의 인자에는 3가지 형태가 있다.

  * type
  * non-type
  * template

type은 흔히 typename T (혹은 class T)로 쓰는것이고, non-type은 컴파일타임시에 알수있는 상수형 값을, 그리고 template은 바로 밑에 포스팅한 [TTP](/blog/2007/07/29/템플릿템플릿-인자.html)를 의미한다.

아래의 예를 보면 non-type형의 템플렛 인자가 어떤것인지 명확히 알수 있다. 

```cpp

#include "stdafx.h"
#include <iostream>

template< int nArg > // non-type template argument
struct TemplateWithNonTypeArgument
{
    static int nIndex;
};
template<int nArg > int TemplateWithNonTypeArgument< nArg >::nIndex = nArg;

int _tmain(int argc, _TCHAR* argv[])
{
    // a100과 a50은 서로 다른 형이다.
    TemplateWithNonTypeArgument<100> a100;
    TemplateWithNonTypeArgument<50> a50;

    std::cout << "a100 index is " << a100.nIndex << std::endl;
    std::cout << "a50 index is " << a50.nIndex << std::endl;

    system("pause");

    return 0;
}

```

비 형식 템플릿 인자는 정수형인 int 와 long을 인자로 할수 있으며, float이나 double은 인자로 사용할수 없다.

이 template non-type argument를 이용한 재미있는 예가 kldp에 있다. 

```cpp

#include <iostream>
int main() { return 0; }

template<int i>
struct C : C<i-1> {
    C() { std::cout << "I will not throw paper airplanes in class\n"; }
};
template<> struct C<0> {};
C<500> c;

```

  * [IBM 문서](http://publib.boulder.ibm.com/infocenter/macxhelp/v6v81/index.jsp?topic=/com.ibm.vacpp6m.doc/language/ref/clrc16template_argument_deduction.htm)
  * [kldp의 언어별 반성문](http://kldp.org/node/27158?page=1)

