---
layout: post
title: "thunar에서 zip으로 압축된 이미지 파일을 gwenview로 보기"
date: 2006-09-24 00:57:00 +0900
author: poksion
categories: blog
tags: 컴퓨터
---

사람이란게... 쓰던것을 쓰게 되나보다. gwenview 아니면 이미지가 잘 안보인다. -_-
gwenview와 컨커러 kio를 이용하면 thunar에서 gwenview로 zip파일등을 연결해서 볼 수 있다.

zip 파일을 다른프로그램으로 연결을 선택해서 Use a custom command 를 선택해서
> gwenview zip:%f

이렇게 바꿔주면 gwenview로 zip 으로 압축된 이미지 파일들을 볼 수 있다.

