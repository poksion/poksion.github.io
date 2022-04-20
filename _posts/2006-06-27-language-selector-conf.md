---
layout: post
title: "language-selector.conf"
date: 2006-06-27 03:11:00 +0900
author: poksion
categories: blog
tags: 컴퓨터
---

우분투 대퍼는 한글화가 무척 잘된 배포판이다.

우분투 한국팀의 노력임에 틀림없지만, 우분투 배포판 자체가 이러한 설정을 쉽게 할수 있는 구조가 아니었다면 어려웠을 것이다.

한글화를 잘 느낄수 있는 부분이 글꼴설정 부분이다. 한창 gtk1에서 gtk2로 넘오는 시절에 폰트서버도 격동의 시절이었다. xfs이나 xtt 등등.. 이것이 현재는 fontconfig 로 안정화된 느낌이다. 또한 그놈의 경우는 이러한 흐름을 아주 잘 따르고 있다 - 오히려 주도하고 있다고 할 수 있다.

fontconfig 파일은 글꼴 정보를 fc-cache 를 통해 저장하고 글꼴 설정파일은 xml 포맷 형태로 설정한다. 예전과 비교하면, fonts.dir 파일과 fonts.alias 와 비슷하다고 할수 있지만, xml 로 된 설정파일은 설정하기 훨씬 편리하다.

우분투 대퍼의 경우 /etc/fonts/language-selector.conf 파일에 xml 포맷의 설정파일이 존재한다. 그리고 이 파일은 /usr/share/language-selector/fontconfig 밑에있는 여러 설정파일들로 심볼릭 링크되어있다.

이 파일중 ko_KR 파일을 language-selector.conf 파일로 연결해주면 우분투 한글팀이 미리 설정해둔 fontconfig 파일을 사용할 수 있다.

> sudo ln -s /usr/share/language-selector/fontconfig/ko_KR language-selector.conf

참고 심볼릭 링크 사용법은 다음과 같다.

> ln -s 타겟 심볼릭_링크_이름

