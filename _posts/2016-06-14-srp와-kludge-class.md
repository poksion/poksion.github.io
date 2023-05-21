---
layout: post
title: "SRP와 kludge class"
date: 2016-06-14 11:57:00 +0900
author: poksion
categories: blog
tags: 하드보일드  프로그래밍
thumb: /assets/img/post/srp-one.png
---
<div class="large-12 columns">
    <img src="/assets/img/post/srp-one.png" style="float: left; width: 201px; height: 200px; margin-right: 15px; margin-bottom: 10px;" />
    <p style="word-break: break-all;">
SRP는 The Single Responsibility Principle을 말하며, 그 컨셉을 잘 정리해서 엉클 밥아저씨가 제공하고 있는 문서 제목이기도 하다. 현재 원본 링크는 없는것 같고 <a href="https://web.archive.org/web/20150202200348/http://www.objectmentor.com/resources/articles/srp.pdf">web archive</a>에서 pdf를 다운 받아 볼 수 있다. (<a href="https://www.amazon.com/Agile-Principles-Patterns-Practices-C/dp/0131857258/ref=tmm_hrd_swatch_0?_encoding=UTF8&qid=&sr=">Agile Principles, Patterns, and Practices in C#</a> Charter8 에도 소개되어 있다.)
    </p>
</div>

{% include box_note.html %}

### 문서의 구조

 * 소개
     * 개념 주창자 및 유사 개념 : cohesion
     * 한개를 넘는 responsibility를 가진 Game class의 단점
     * 예제 : Rectangle class
 * 책임이란 무엇인가
     * modem 예제
     * rigidity와 needless complexity
 * 중복된 책임을 분리하기
     * 인터페이스로 책임을 분리하는것은 개념적 중복을 "decouple"하는것
     * 어쩔수 없는 ``kludge class``의 발생
 * Persistence
     * business rules와 persistence control이 함께 있을때
 * 결론

{% include box_note.html %}

### 책임이란 무엇인가

문서에서는 ``변경``과 책임을 강한 상관관계로 본다. 심지어

> ... we define a responsibility to be "a reason for change". ...

라고 할 정도. 덧붙여 하나의 책임을 개념적인 하나의 책임이라고만 "rigidity"하게 결정하면 "needless complexity"문제에 봉착할 수 있다고 주의를 당부한다.

따라서, 일종의 change-set(코드 형상관리의 change-set와 유사한 역할의 개념)을 함께 고민하는 것이 SRP를 준수하는 설계에 도움이 될것이다. (이때의 change-set은 ``정책적인 요소`` 뿐만 아니라 ``소프트웨어의 구조적인 의존성``까지 포함한 개념이다.)

{% include box_note.html %}

### Klugde class

> We may view the ModemImplementation class as a ``kludge class``, or a wart; however, notice that all dependencies flow away from it. ``Nobody need depend upon this class``. Nobody except main needs to know that it exists. Thus, we've put the ugly bit behind a fence. It's ugliness need not leak out and pollute the rest of the application

문서에서 제일 재미있었던 부분. 개념적인 요소들을 인터페이스로 decouple 시켰다 하더라도 구현은 필요하다. 이러한 구현은 구체적이고 재활용이 어려울수 밖에 없는데, 문서에서도 이러한 구현상의 문제를 인지하고 있고 이렇게 작성된 클래스를 ``kludge class``라고 한다.

아마, 안드로이드에서는 최 말단의 Activity가 kludge class가 될 가능성이 높은데, 안드로이드에서 재활용성을 높인다는것은 최대한 Activity가 하는 일이 단순하고 수동적인 일을 하도록 만드는것과 거의 같은 말이다.

문서에서도 kludge class에 의존하는 다른 클래스가 없는것을 전제하고 이야기 한다. 그리고 그러한 ugliness가 다른 곳으로 전파되지 않도록 주의를 당부한다. (실제 많은 안드로이드 구현에서는 Acitivty에 의존하는 클래스가 많지만서도...)

