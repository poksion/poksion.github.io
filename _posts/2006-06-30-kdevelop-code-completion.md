---
layout: post
title: "KDevelop3 Code Completion DB 설정"
date: 2006-06-30 22:59:00 +0900
categories: blog
tags: 컴퓨터  프로그래밍
---

Anjuta를 써보니 내가 좋아하는 kdev보다 코드 자동완성이 더 낫더라. 그런데 그 외의 것은 kdev가 더 나은것 같다. 더욱이 Anjuta의 희안한 버그때문에 더이상 Anjuta를 사용할 수 없는 환경이다.(메뉴 도구모음을 떼어내니 프로그램 시작시에 죽는다.)

그래서 이래저래 찾아봤는데, ``Code Completion DB``를 만들어 줄 수 있더라. 다만, 이렇게 만들어놓으면 자동완성할것이 너무 많아지기 때문에 자동으로 완성하지 않고 단축키를 통해 완성한다. 내 경우에는 shift + space 를 완성 단축키로 설정해 놓았다.

그리고 개발환경 문서는 man 3 인데, 기본적으로 안깔려 있다. sudo apt-get install manpage-dev 로 개발환경 문서를 깔아주자. 그러면 kdev의 Document 의 Finder를 통해 살펴 볼 수 있다.

