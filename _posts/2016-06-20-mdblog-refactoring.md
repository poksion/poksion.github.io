---
layout: post
title: "mdblog(poklog) refactoring"
date: 2016-06-20 00:08:00 +0900
author: poksion
categories: blog
tags: 프로그래밍
---

보이는 시각이 달라지고 내실을 다질수 있는 여유가 생기다보니 기존에 만들어쓰던 여러 프로젝트들을 리팩토링하고 있다. 이번 주말에는 (애보라는것을 징징거리며) 약간의 시간을 내어 mdblog - poklog 엔진 - 를 리팩토링 하였다.

관련된 도메인을 알아간다는 것
----------------------

초반에 블로그에 대한 도메인 지식이 "대충 사용수준"으로 빈약했음에도 나름 고민한 덕분에 괜찮은 구조가 나온것 같다. 블로그를 직접 만들어 운영하면서 블로그에 대한 도메인을 좀더 알아가다보니 여러가지 것들이 다시 보여서 정리에 많은 도움이 되었다.

 * 블로그의 주된 목적은 내 생각의 공유인데, 이 생각이라는것이 대체로 시간 순서대로인것이 많지만, 간혹 "목표"스러운 생각 - 시간의 흐름이라는것을 상대적으로 덜 타는 - 을 공유하고 싶을때도 있다. 내게 있어서는 내가 진행중인 project들이 그러한 것들이었다.
 * 블로그라고는 하지만 보여지는 방식이 다양하다. 여러 블로그 글을을 페이지 단위로 보여주는것이 기본이겠지만, 연도별로 묶어 보여 줄 수도 있고 연관된 태그별로 보여줄 수도 있다.

content-composer-processor
--------------------------

매우 다른 포멧을 다루기 위한 개념적 객체가 content이다. poklog는 그래서 project content와 blog content가 있다. project content에는 진행중인 프로젝트들이 나열되어 있고 blog content에는 쓴 글들이 페이지별/연도별/태그별로 볼수 있다.

각 content는 내부적으로 보여주는 방식을 구성하기 위해 composer라는 객체를 가지고 있다. 보여주는 방식이 하나뿐인 project content는 composer가 없고 blog content는 page composer, tag composer, archives composer를 가지고 있다.

cloud에 저장되어 있는 markdown 파일을 읽고 가공하는 역할은 processor가 맡는다. 현재는 PegDown을 사용하여 랜더링 하고 있다.

<div align="center"><img src="/assets/img/post/poksion-net-modules.png" /></div>

<br/> 

poklog 운영과 관련된 글들
-------------------

블로그(poklog)를 운영하며 블로그 자체에 대한 글들이 몇개 있다. 아래의 글들이 블로그와 관련된 글들.

 * [start-app-engine](/blog/2013/07/09/start-app-engine.html)
 * [poklog-version3](/blog/2014/01/06/poklog-version3.html)
 * [spring-mvc-와-app-engine](/blog/2014/05/08/spring-mvc-와-app-engine.html)

