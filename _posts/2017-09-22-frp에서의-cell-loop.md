---
layout: post
title: "FRP에서의 Cell Loop"
date: 2017-09-22 16:49:00 +0900
categories: blog
tags: 프로그래밍
---

함수형 프로그래밍은 많은 깨달음을 주는데, 특히 FRP의 인기와 함께 발간된 [함수형 반응형 프로그래밍](http://www.yes24.com/24/goods/44020344?scode=032&OzSrank=1) 책은 OOP의 패러다임에서 어떻게 함수형 프로그래밍을 잘 쓸 수 있는지 좋은 가이드들을 많이 제공한다.

특히 누적기를 통해 Cell Loop를 설명하는 장은, 프로그램의 상태를 함수형 프로그래밍적인 사고로 바라보는데 많은 도움을 준다.

## 모든것은 스트림이다.

사실, 마법사책이라고 불리우는 SICP에서 상태를 스트림으로 대체한다고 했을때 너무 추상적으로만 이해를 했었는데, 이 책의 예제들이 어떤것을 의미하는건지 잘 보여주는것 같다.

이렇게 스트림을 분류하는게 너무 단편적인것 같지만, 나는 스트림을 크게 아래의 세가지로 나눈다.

 * Source Stream
 * Process Stream
 * Result Stream

Source stream은 Mouse Event등으로부터 만들어 질 수도 있고, 함수의 인자로부터 Cell화 될수도 있다.

Process Stream에서는 여러 Process Stream들이 합쳐지기도 하고, map을 통해 변형 되기도 한다. 물론 때로는 Process Stream이 다른 문맥에서는 Source stream으로 동작할 수도 있을것이다.

Result Stream은 Process Stream을 hold혹은 snapshot하여 결과값을 가져오기 쉬운 스트림이다.

Process Stream이 다른 Stream의 Source Stream이 될 수 있듯, Process Stream이 바로 Result Stream이 될수도 있다.

<div align="center"><img src="/assets/img/post/frp-stream.png"/></div>

## Cell Loop

이때, Process stream이 Result stream의 결과값을 가지고 다시 작업을 하는 경우를 생각해 볼 수 있다. 일종의 상태의 변경인데, 스트림 세상에서는 예전 값을 가져와서 새로운 값을 만들어내는 개념을 취한다.

예전값을 연결하기 위해 자바와 같은 OOP 체계에서는 "전방참조"등이 필요한데, Sodium에서는 이러한것을 Cell Loop를 통해 다룬다. Process stream에서 Result stream으로 전환하기 위한 snapshot에 Cell Loop가 전달되면, loop를 통해 연결된 Cell의 값이 snapshot의 transformer에 전달된다. (말로하면 겁나 복잡한데, 위의 그림에서 value cell loop가 두개의 value cell과 연관되어 있는것이 좀더 직관적일것 같다)

만일 예전상태를 확인해야할 필요가 없는 기능이라면 당연히 Cell Loop는 필요없을 것이다. 이때에는 아마도 Process Stream을 바로 Result Stream으로 사용할 것이다.

## TL;DR

아마도 내가 "순수" FRP를 하는 경우는 없을것 같다. 그럼에도 함수형 프로그래밍적인 사고는 배울부분이 많기 때문에 개념을 조금씩 익혀가는것이 즐겁다.

