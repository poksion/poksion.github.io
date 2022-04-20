---
layout: post
title: "Visual Studio 헤더 및 라이브러리 설정"
date: 2006-06-28 15:49:00 +0900
author: poksion
categories: blog
tags: 프로그래밍
---

gcc cpp0 의 -I 옵션과 ld 의 -L 과 같은 기능을 하는것을 비주얼 스튜디오에서는 ``옵션``의 ``VC++ 디렉토리``에서 설정할 수 있다.

gcc ld 의 -l 과 같은 옵션은 ``#pragma comment(lib, "파일이름")`` 을 사용하거나 솔루션 하위의 ``프로젝트 프로퍼티``에서 ``링커 인풋``을 통해 설정할 수 있다.

