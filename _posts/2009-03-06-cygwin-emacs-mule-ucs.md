---
layout: post
title: "Cygwin emacs용 mule-ucs 설치"
date: 2009-03-06 19:41:00 +0900
author: poksion
categories: blog
tags: 프로그래밍
---

cygwin용 emacs에서 utf-8로 저장된 파일의 한글을 보기에 제일 쉬운방법이 mule-ucs 패키지를 설치하는 방법이다. cygwin 패키지로 제공해주면 좋으련만 그렇지 않기 때문에 직접 컴파일해서 설치해야한다.

http://tats.haun.org/mule-ucs/ 에서 최신 mule-ucs 를 다운받는다. 당당하게 unofficial이라고 써있다.

다운받은 mule-ucs 파일을 적당한 곳에 풀면 mucs-comp.el 이 있는 디렉토리 밑이 doc/ 디렉토리와 lisp/ 디렉토리가 있을것이다. 그 디렉토리에서 mule-ucs를 바이트코드 컴파일 한다

> emacs -q --no-site-file -batch -l mucs-comp.el

컴파일이 다되면 emacs/site-lisp 디렉토리 밑으로 lisp/ 디렉토리를 mule-ucs 이름으로 바꿔 옮겨준다. 내 cygwin system은 다음과 같은데

```shell
$ uname -srv
CYGWIN_NT-6.0 1.5.25(0.156/4/2) 2008-06-12 19:34
```

다음과 같이 옮겼다

```shell
mv lisp/ /usr/share/emacs/site-lisp/mule-ucs
```

마지막으로 .emacs 파일을 설정한다.

> (require 'un-define)

참고로 시그윈 이맥스에서 한글을 쓰는 방법이 여러가지 있지만 나는 다음과 같은 방법을 사용한다

> (set-keyboard-coding-system 'korean-iso-8bit) ; using IME

> (set-selection-coding-system 'korean-iso-8bit) ; copy/paste


