---
layout: post
title: "Visual Studio Express 한글판.."
date: 2007-05-06 22:46:00 +0900
author: poksion
categories: blog
tags: 프로그래밍
---

윈도우에서 C++ 프로젝트를 하려면 역시 비주얼 스튜디오가 제일 무난하다. 더욱이 express 는 공짜 아니던가!

그런데 한글판 익스프레스에서, 영문판에서 잘되던 win32 위자드가 안되더라. 영문판 1033 대신에 1042 에서 영문판에서 하라는데로 했는데도(삐리리.disable 을 주석처리 하는거) 안되러라. 뿔딱지가 나서 AppSettings.htm을 보고 있는데...이건 정말 완전 개판 html 이었다. 도큐먼트 선언이 없는것은 물론이고, 처음 주석부터가 틀려 먹었다.

근데, FireFox에서는 html 파일이 열렸고, Validator Check에서도 심각한 오류는 없었다. 물론 IE에서는 열리지 않았고.. 보니까, 한글문제 세팅이 잘못되서 열리지 않았던 거였다.

```xml
<meta http-equiv="Content-Type" content="text/html; charset=ks_c_5601-1987">
```

를

```xml
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
```

로 바꿔주니 잘된다.
아.. 정말 이런 사소한걸로 골치아프기 싫다.

