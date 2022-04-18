---
layout: post
title: "Actor-Reactor"
date: 2015-07-10 16:14:00 +0900
categories: blog
tags: 프로그래밍  하드보일드
---

소프트웨어 개발 세계에서 아주 익숙한 용어들이지만, 본질과 우유를 잘 구분하지 못했었는데 후배 개발자에게 설명을 해주면서 좀더 차분히 정리해보았다.

Actor
------

actor는 일종의 ``모델``로 보는것이 옳을듯. object와 비슷한데, 외부로부터 요청 받은 메시지를 queue에 쌓아놨다가 queue에서 꺼내서 작업을 처리. 액터가 object와 다른 가장 큰 차이는 요청에 대한 응답을 실시간으로 받는지 여부이다. 즉, 요청시점에서 실시간으로 결과를 응답받지 않으면 일단 actor model로 볼 수 있다. (바로바로 일을 처리하는 object보다 요청을 쌓아놓고 처리하는 액터 모델이 Client가 아닌 자신의 관점에서 좀더 자율적이고 active하다고 생각하면 됨)

Reactor
---------
reactor는 일종의 actor 모델로 보면 되는데, 일 시작(dispatching)과 이벤트 핸들링 관리를 하는 주체로 보면 맞을듯. 이벤트를 등록(multiplexing)하는 것으로 initiation (혹은 객체로 만든다면 reactive initiator - register)하고 변경여부를 select로 확인하여(demultiplexing) 이벤트 헨들러를 통해 변경 여부를 알려준다. 이벤트 완료 관리를 reactor에서 한다.

reactor 기능을 수행하나 asynchronous한 부분이 명시적으로 노출되면, ```proactor```라고 볼수 있다.

참고링크
-------

 * [JoinC reactor 패턴](http://www.joinc.co.kr/modules/moniwiki/wiki.php/Site/SoftWare_engineering/pattern/reactor)
 * [Reactor pattern with C#](http://www.robertsindall.co.uk/blog/the-reactor-pattern-using-c-sharp/)
 * [위키페디아 Proactor pattern](https://en.wikipedia.org/wiki/Proactor_pattern)
 * [Proactor design pattern](http://jeremyko.blogspot.kr/2012/05/proactor-design-pattern.html)


