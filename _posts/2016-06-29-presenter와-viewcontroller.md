---
layout: post
title: "Presenter와 ViewController"
date: 2016-06-29 14:05:00 +0900
categories: blog
tags: 안드로이드  프로그래밍
---

[테스트-주도-개발](/blog/2016/06/13/테스트-주도-개발.html)에서도 말한것처럼 이번 회사는 UI부분을 MVP패턴으로 최대한 잘 분리해서 프레젠터 위주로 유닛테스트를 알차게 잘 활용한다.

그럼에도 Activity가 [SRP상의 Kluge 클래스](/blog/2016/06/14/srp와-kludge-class.md#klugde-class)가 되는것은 막기 힘들고, 때로는 너무 많은것들이 한꺼번에 있어서 정신이 없을 정도다. 특히 뷰를 다루는데 (애니메이션이나 click control등등) 너무 많은 힘을 쏟아부어서 "여러 객체를 엮는" 원래의 역할이 잘 보이지 않게 되기도 한다.

따라서 이러한 뷰의 제어 역할을 따로 분리하는것을 많은 사람들이 고민하기 마련인데, 애플 iOS 프레임워크에서 사용하는 ``ViewController-Delegates`` 패턴이 꽤 적절해 보였다.

<div align="center"><img src="/assets/img/post/presenter-viewcontroller-in-android.png"/></div>

<br/>

버스는 별로다 <a name="bus-is-not-good"></a>
-----------

회사에서는 의존성 decoupling을 위해 Bus를 종종 사용한다. 나는 버스보다는 명시적인 Delegates나 View가 나은것 같다. 회사에서는 버스를 사용할테니 좀더 지켜봐야 겠지만, 어쨌든 당분간 내 프로젝트에서는 버스를 사용하지는 않을것 같다. (사용하더라도 data model의 변경 메시지 용도로 model과 presenter간 사용을 하겠지만... 되도록 사용을 안하는 방향으로 고민을 할것이다. 그건 차후에 application-context-model working in background 뭐 이런 주제로 고민을 해보자..)

