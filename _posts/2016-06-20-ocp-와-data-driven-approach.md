---
layout: post
title: "OCP와 Data Driven Approach"
date: 2016-06-20 15:28:00 +0900
categories: blog
tags: 하드보일드  프로그래밍
---

OCP(the Open-Closed Principle)에 대해 밥 아저씨가 정리하셨던 문서를 나름대로 정리한 글이다.

문서의 구조
---------

 * 소개
     * 프로그래밍의 여러 격언들 : private이어야하고, global은 피하며, RTTI는 위험하다.
     * 변하는 소프트웨어와 깨지지 쉬운 프로그래밍
     * 요구사항이 추가되었을때(바뀌었을때) 코드를 수정하는 방향이 아니라 새 코드를 추가하는 방향
 * 설명 : OCP의 두가지 속성
     * Open For Extension
     * Closed for Modification
 * Abstraction is the key
     * Client - Server 예제
 * The Shape Abstraction
     * Circle과 Square를 그리는 예제
 * Close를 시키는 전략들 (Strategic Closure)
     * Using Abstraction to Gain Explicit Closure
     * Using a "Data Driven" Approach to Archieve closure
     * Extending Closure Even Further
 * 다시, 여러 경험적 격언들
     * Make all Member Variables Private
     * No Global Variables -- Ever
     * RTTI is Dangerous
 * 결론 : OCP는 object oriented technology의 중요한 이점(reusability와 maintainability)을 얻을수 있는 중요한 원칙

Circle과 Square
---------------

Circle과 Squre 예제는 "Abstraction"을 통해 OCP를 보여주는 아주 좋은 예제이다. 그리기라는 동작에 대해 다른 도형이 추가 되었을때, 도형이 abstraction 되어 있지 않다면 "그리기"함수에 수정사항이 발생했을 것이다. 그러나 만일 도형이 abstraction 되어있고 새로 추가된 도형이 추상 도형을 상속받아 추가 구현한다면, 그 도형을 그리기 위해 "그리기"함수는 수정되지 않아도 된다. 말그대로 수정에는 "closed"되어 있고 확장에는 "open"되어 있다. ([다형성-마법상자](/blog/2006/07/11/다형성-마법상자.html)에서의 마법이 사실은 OCP의 마법이었다)


## Using a "Data Driven" Approach to Archieve 

밥 아저씨의 문서 혹은 글들이 진국이라고 느낄때가 여럿있는데, 이 글에서는 이부분이 "진국"이라고 느꼈다.

이 섹션과 비슷한 예를(그러면서 내게 더욱 잘 와닿은 예를) Parking-lot 문제에서 살펴볼 수 있다.

문제 요약

 * 여러 자동차들이 있는 Parking lot을 설계하는것이 목표
 * 자동차들은 Parking lot에 자신에게 정해진 타입에 따라 주차할 수 있음
 * 자동차들의 주차타입은, "오토바이", "경차 우대", "일반", "대형"

이 문제가 생각보다 어려운것은 주차타입의 확장에 있는데, 이것이 일단 현재는 ``자동차의 물리적인 타입과 거의 동일``하고 조금만 주의깊게 생각해보면 "여성 우대"라든가 "장기 주차 우대"등의 자동차와 상관없는 주차타입이 추가될 경우가 많다라는데 있다.

사실 근본적인 문제는 주차장의 로직을 구현하기 위해서는 ``주차장이 자동차를 좀더 구체적으로 알아야한다``는것이고, 따라서 자동차가 확장될때마다 주차장도 변경해야한다는 문제를 쉽게 해결하기 힘들다. (나는 이런류의 문제를 ``repository``가 ``entity``를 ``조금은 구체적으로 알아야하는 문제``라고 정의하고 있다)

이러한 문제에 대해 밥아저씨는 "Data Driven" 방법을 적용할것을 말하고 있는것인데, 내 문제정의에 맞춰 이야기 하자면, "확장 가능한 entity"에 대해 repository가 좀더 알아야 하는 내용을 ``data(일종의 매핑 테이블)``로 추상화서 그 데이터를 repository에 노출하자.. 쯤으로 말할수 있겠다.

내가 생각하기에도 이 방법이 꽤 적절한 방법으로 보인다.

