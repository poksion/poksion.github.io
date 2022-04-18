---
layout: post
title: "vim fileformat 과 sln"
date: 2007-04-30 13:50:00 +0900
categories: blog
tags: 프로그래밍
---

간혹 CVS를 통해 얻은 오픈소스의 sln 파일이 unrecognized version 으로 나올경우가 있다. 이건 십중팔구 sln text의 fileformat 문제다.

vim에서는 dos 와 unix 그리고 mac 의 text 파일포맷 변경을 쉽게 할수 있는 명령이 존재한다. fullname으로는 fileformat 이고 줄여서 ff 이다.

unix fileformat 을 dos로 바꾸는것은 간단하다.
> :set fileformat=dos

:help fileformat 을 해보면 그밖에 자세한 사용법을 알 수 있다.

