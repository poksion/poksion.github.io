---
layout: post
title: "vim modeline 삽질기"
date: 2009-08-31 01:23:00 +0900
author: poksion
categories: blog
tags: 프로그래밍
---

코딩컨벤션 삽질기 2탄은 vim의 modeline 삽질기다.

제일 삽질했던것이 ```// vim``` 과 ```/* vim */``` 의 설정 포멧이 다르다는것을 모르고 안된다고 이것저것해봤던것.
그것에 대한 차이점을 자세히 설명해놓은곳이 이곳이다.

두번째 삽질은, ```// vim``` 위치의 문제. 이 mode line 주석이 있을곳은 소스의 맨 처음이거나 맨 마지막이어야한다!
이걸 몰라서 우엉삽질을 했다.

참고로, modeline을 사용하려면 set modeline(혹은 set ml)이 설정되어 있어야한다. 일반적인 배포판에서 이것이 설정되어있는지는 모르겠으나, win32 gvim은 기본으로 설정되어 있더라.

결론적으로, 나는 소스의 맨 마지막줄에

> // vim: ts=4:sw=4:nowrap

같은 modeline을 설정한다.

