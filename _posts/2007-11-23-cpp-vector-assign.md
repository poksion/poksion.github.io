---
layout: post
title: "C++ : vector / assign"
date: 2007-11-23 12:46:00 +0900
author: poksion
categories: blog
tags: 프로그래밍  하드보일드
---

Effective STL에서 봤던건데, 구간 insert나 assign이 더 좋게 구현이 가능하기 때문에 그걸 즐겨쓴다.

vector에서 assign은 STL 튜토리얼/레퍼런스 가이드에서 나와있듯이 { clear(); insert(begin(), first, last);}와 같다. (Visual Studio 2005에서는 {erase(begin(), end()); insert(begin(), first, last);} 형태로 구현되어 있다.)

쉽게 말해 ```assign``` 할때는 ```clear가 필요 없다```.

한가지더. vector는 operator= 가 재정의 되어있다. 즉, a = b (a와 b는 벡터) 라고 해도 된다. ```다만```, Visual Studio에서의 operator=는 메모리크기 재조정이 들어가서 약간의 오버헤드가 들어간다.

