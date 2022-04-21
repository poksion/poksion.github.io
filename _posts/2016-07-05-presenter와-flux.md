---
layout: post
title: "Presenter와 Flux"
date: 2016-07-05 22:07:00 +0900
author: poksion
categories: blog
tags: 프로그래밍  안드로이드  하드보일드
---

Presenter를 쓰면서 많은 경우에 쭉쟁이 처럼 하는일이 없는 클래스라는 느낌을 가진다. 특히나 모델이 callback을 주는 경우라면, ``presenter의 주요 작업``이 1. model의 결과를 view의 결과로 변환하는일, 2. 모델과 뷰를 잘 호출해주는일 로 일이 단순해진다.

UI를 다루는 facebook의 다른사람들도 그렇게 느꼈는지, 과감하게 Presenter를 사용하지 않고 "단방향의 데이터흐름"으로 그 역할을 대신하는 방법을 공유했는데, 그것이 [Flux](https://facebook.github.io/flux/)이다. 내가 [별로](/blog/2016/06/29/presenter와-viewcontroller.html#bus-is-not-good)라고 했던 이벤트 디스패쳐 (혹은 구현체로써 Event bus)방식을 사용하여 단방향 데이터 흐름을 구현했고, 뷰와 모델이 디스패쳐를 통한 데이타 주고 받음을 직접하도록 구현함으로써 중간 Presenter를 생략했다.

<div align="center"><img src="https://facebook.github.io/flux/img/flux-simple-f8-diagram-explained-1300w.png"/></div>

<br/>

사실 저 다이어그램은 조금 속임수(?)가 있는데, 데이타의 단방향을 강조하다보니 Store에서 View로 전달을, 단순한 Event 형식으로 ``Dispatcher``를 사용한다는것을 명확히 드러내고 있지 않고 있다. 따라서 실질적으로 구현을 하려면,

 * view
 * store
 * dispatcher
 * action
 * event

정도의 주요 component가 있어야 할것이고, view와 store는 dispatcher를 통한 action으로 전달, store에서 view (controller-view)로는 역시 dispatcher를 통한 event 전달로 구현될것이다.

테스트는 대체로 model에 이벤트 수신을 직접 호출한후, store가 콜백을 받았을때 event를 잘 수신하는지, event의 key를 가지고 store의 모델을 잘 가져오는지로 테스트할것이다.

다음 프로젝트에서는 고민하여 적용해봐야겠다.

