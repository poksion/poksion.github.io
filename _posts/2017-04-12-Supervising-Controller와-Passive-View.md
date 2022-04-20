---
layout: post
title: "Supervising Controller와 Passive View"
date: 2017-04-12 14:06:00 +0900
author: poksion
categories: blog
tags: 프로그래밍
---

자주보는 Presenter 사용패턴중의 하나는, Presenter가 View의 Lifecycle에 따라 호출되는 코드를 제공하는 것이다. Presenter에 로직만이 있기를 기대했다가 이런 코드를 만나면, 라이프사이클의 콜백 역할도 머릿속에 넣어야하기 때문에, "straightforward" 하지 않는 로직 객체가 된다. 그러면서 생긴 의문점이

> Presenter가 View의 LifeCycle을 아는것이 좋은가?

 * View의 로직을 Presenter가 대신처리한다면, LifeCycle 처리도 대신 해주어야하는것이 아닌가?
 * 그런데, Presenter가 알고있는 View가 Widget이 아닌 Observer Synchronization 라면?

## Widget vs Observer Synchronization

[마틴 파울러의 MVP](/blog/2017/01/03/마틴파울러-mvp.html)에 대한 글에서도 말했지만, 마틴파울러는 View를 Widget과 Observer Synchronization의 두가지 측면으로 바라보고 나는 그것이 매우 훌륭한 관점이라고 생각한다. 그리고 뷰를 어떻게 바라보고 뷰를 어떻게 대하느냐에 따라서 [Supervising Controller](https://martinfowler.com/eaaDev/SupervisingPresenter.html)와 [Passive View](https://martinfowler.com/eaaDev/PassiveScreen.html)라는 패턴으로 프레젠터를 구분하는것 같다.

## Supervising Controller

Supervising Controller는 뷰를 Observer Synchronization 측면에서 바라보는 경우이다. 이때 Supervising Controller로써 프레젠터는 크게 두가지의 역할과 책임을 갖는다.

 * input response (뷰에게서 input을 받아 로직을 처리)
 * partial view/model synchronization (뷰 업데이트)

## Passive View

Passive View 패턴을 구성하는 프레젠터는 Supervising Controller의 역할을 넘어서 뷰의 동작하나하나를 관리한다. (그래서 뷰는 매우 수동적인 객체가 된다)

 * 모든 View 로직이 Controller안에 들어감
 * View의 거의 모든 행동들이 테스트 가능해짐
 * Presenter가 너무 많은것을 알아야함

## 내 경험상의 Best practice

[Presenter와 ViewController](/blog/2016/06/29/presenter와-viewcontroller.html)에서 말했지만, 나에게 있어서 일반적인 Presenter는 Supervising Controller 역할을 한다 - 이때 Activity나 Fragment가 구현하고 있는 View는 Observer Synchronization 역할을 한다.

만일 Widget 단위에서의 Presenter를 구성하여 Passive View 패턴을 구현한다고 하면, 그때는 Presenter를 ViewController라는 이름으로 짓는다.

이렇게 하는 나름의 타당한 이유가 있는데,

> 일반적으로 Presenter는 데이터 소스로부터 데이터를 얻어오는 비지니스 로직을 수행하는데, IO와 관련되어 있을 경우가 많아 Async하게 작업을 수행하는 경우가 많다.

 * View와 Presenter의 생명주기가 달라질수 있어서 Presenter는 적절하게 해당 사항에 대한 처리도 해주어야 한다.
 * 비지니스 로직과 생명주기 관리 이외에, View 로직 수행을 위해 View의 세부사항을 너무 많이 알게되면 Presenter가 비대해질 수 있다.
 * 따라서 이러한 경우는 Supervising Controller의 역할을 수행하는게 적절하다.

> 때때로는 Widget에 들어가는 로직이 복잡하여 테스트를 수행하고 싶을때가 있다.

 * 다른말로, Widget을 Passive View로 만들고 싶을때가 있다.
 * 이때는 Widget와 로직을 분리한 Presenter의 생명주기가 같다.
 * 만일 이때도 동일하게 Presenter라고 이름짓는다면 혼란스러울 것이기 때문에 다른이름(나의 경우는 ViewController)을 짓는것이 낫다.

