---
layout: post
title: "PortableApp - Firefox Portable"
date: 2007-09-27 20:07:00 +0900
author: poksion
categories: blog
tags: 컴퓨터
---

내가 자주쓰는 확장으로 무장된 파이어폭스가 없으면 도저히 웹서핑을 못하는 정도에 이르러서 예전부터 생각해두었던 PortableApp - FirefoxPortable을 깔았는데, 이럴수가. 너무 좋다.

가장큰 장점은 확장을 설치하면 이동저장매체에 설치가 되어서 어디를 가든지 즐겨쓰는 확장을 가지고 파이어폭스를 이용할 수 있다는데 있다. 브라보.

사용방법은 무척 간단한데, http://portableapps.com/ 에서 Firefox Portable을 다운받은후에 적당한 곳에 설치한다음에 그 폴더를 이동저장매체에 카피하면 끝이다. 그후 firefox.exe가 아닌 최상위폴더의 FirefoxPortable.exe를 실행하면 되고 업데이트는 파이어폭스 메뉴에 있는 업데이트를 이용하면 된다.

이후, 파이어폭스가 영문인게 거슬리면 한글팩을 설치해주면 되는데 우선 Locale Switcher 를 설치해주고 김정균님의 파이어폭스 자료실에 가서 ko.xpi라는 한글팩을 설치하고 로케일을 한글로 바꾸면 된다.

몇가지 팁을 적어보면, 우선 sage를 사용하는 경우 custom css를 사용하기가 애매하다. 그래서 내 경우에는 아예 sage.jar에서 기본 css를 Sage Style 에서 제공해주는 mozilla 2단 css 로 바꾸어 사용한다. 바꾸는 방법은 간단한데, 일단 파이어폭스 포터블 하부 폴더에서 sage.jar를 찾아서 압축을 푼후에 content/res 에 있는 sage.css를 원하는 스타일시트로 변경해 주고 다시 jar로 압축한후에(jar는 zip과 동일한 압축 포멧이다. 따라서 zip으로 압축하고 jar로 파일명을 바꿔도 된다.) 기존 sage.jar에 덮어쓰면 된다.

또다른 팁으로 실행시마다 스플래시가 실행되는데, 그것이 보기 거슬린다면 firefoxportable.ini를 찾아서 FirefoxPortable.exe 파일이 있는 곳에 복사한후 DisableSplashScreen를 false에서 true로 변경해 주면 된다.

```(cf)``` 2014. 1. 14 현재 링크가 다 깨져서 링크는 모두 삭제. 웹에서 링크의 유효성 문제는 언제나 골치거리인듯.

