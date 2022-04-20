---
layout: post
title: "pkg-config"
date: 2006-06-26 23:24:00 +0900
author: poksion
categories: blog
tags: 컴퓨터  프로그래밍  하드보일드
---

gcc는 기본적으로 명령행으로 인자를 전달하는 방식이다. 무슨말인고 하니, 설정파일을 읽어들여서 거기에 맞게 include 를 잡거나 lib을 잡는게 아니라는 소리이다. 이렇게 되면 컴파일 설정이 무척 힘들어 질 수 도 있을텐데, pkg-config 라는 엄청난 - 사실은 매우 단순한 - 프로그램이 있다.

이 프로그램은 몇가지 옵션을 읽어서 그것에 맞는 명령행 인자를 리턴해주는 역할 밖에 하지 않는다. 단지 그 역할 뿐이다! 그런데, 이것이 gcc와 연계되면 정말 편리한 컴파일 환경이 만들어 진다.

예를들면 오우거의 헤더파일들은 /usr/local/include 에 있고 lib 파일들은 /usr/local/lib에 있다. 이것을 만일 gcc로 컴파일 하려면

> -I/usr/local/include/OGRE -L/usr/local/lib -lOgreMain

을 처주어야 한다.
사실 이런것을 모두 기억하는 개발자는 없다. 그래서 만들어진것이 pkg-config 인것이다.

pkg-config를 실행시켜보자.

```shell

pok@localhost:~$ pkg-config --cflags OGRE --libs OGRE
-I/usr/local/include -I/usr/local/include/OGRE -L/usr/local/lib -lOgreMain

```

그래서 gcc를 이용할때는

> gcc `pkg-config --cflags OGRE --libs OGRE` 어쩌고...

식으로 작성해주면 된다.

pkg-config 가 이용하는 파일은 .pc 파일이다. 어디에 위치하는 pc 파일인고 하니 PKG_CONFIG_PATH에 지정된 파일이고 이것이 없다면 기본값으로 /usr/lib/pkgconfig를 찾는다고 한다. (http://kldp.org/node/71409)
그런데, 링크된 글에서도 적었듯이 /usr/loca/lib/pkgconfig/ 에 있는 pc파일도 잡는다. 여전히 미스테리다.

.pc 파일은 autoconf가 이용하는 configure.in (혹은 configure.ac //KDevelop은 기본적으로 configure.in 파일을 이용한다) 에서 PKG_CHECK_MODULES 매크로에서도 이용된다. 예를들어 ogre 파일을 컴파일하기 위한 KDevelop의 configure.in파일을 보면

```bash

AC_INIT(configure.in)

AM_CONFIG_HEADER(config.h)
AM_INIT_AUTOMAKE(ogretest, 0.1)

AC_LANG_CPLUSPLUS
AC_PROG_CXX
AM_PROG_LIBTOOL

PKG_CHECK_MODULES(OGRE, [OGRE >= 0.15.0])
AM_CXXFLAGS="$AM_CXXFLAGS $OGRE_CFLAGS"
AM_LDFLAGS="$AM_LDFLAGS $OGRE_LIBS"
AC_SUBST(AM_CXXFLAGS, "$AM_CXXFLAGS")
AC_SUBST(AM_LDFLAGS, "$AM_LDFLAGS")

AC_OUTPUT(Makefile src/Makefile)

```

이다.

작은것은 아름답다. .pc 파일을 가지고 부리는 pkg-config 마법에서 다시한번 느끼게 된 진리이다.

``cf. 2006/07/02 16:31``, 디토 :

> pkg-config --cflags --libs OGRE로 줄여서 쓸 수 있습니다. :)

