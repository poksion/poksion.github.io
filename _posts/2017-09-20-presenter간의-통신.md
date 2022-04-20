---
layout: post
title: "Presenter간의 통신"
date: 2017-09-20 17:47:00 +0900
author: poksion
categories: blog
tags: 프로그래밍
---

Presenter는 말 그대로 "표현"이 주 임무이며, 따라서 보통 Presenter와 View는 1:1을 이루는 경우가 많다. (이 이유 때문에 [이 글처럼](https://medium.com/@cervonefrancesco/model-view-presenter-android-guidelines-94970b430ddf) Presenter와 View를 묶어서 Contract라는 형태로 모으는 경우도 많다. 그렇게 되면 Presenter는 자연스레 interface가 된다.)

그런데 개발을 하다보면, A라는 action이 두가지 이상의 View에 영향을 미치는 경우가 많다. "Widget"으로써의 View라면, 이럴때는 [ViewController를 중간에 두어 관련 View들을 다루는 패턴](/blog/2016/06/29/presenter와-viewcontroller.html)을 사용하겠지만, Presenter 레벨에서 영향을 미치는 action이라면 어떻게 하는게 적절할까?

## 1. Presenter간의 직접적인 통신

생각해볼수 있는 첫번째 방법은 Presenter가 영향을 미치는 다른 Presenter를 직접 알고 있는 방법이다. 물론, 다들 고민하는것처럼 의존관계가 복잡해질 뿐만 아니라 action을 전파하는(triggering하는) 주체가 다는 Presenter가 되어 action을 수신하고 View를 갱신하는 일반적인 Presenter 구조가 깨지게 된다. 별로!

## 2. 이벤트 핸들링

다른 방법으로는, 중간에 이벤트 버스를 두어 Presenter가 Event를 생성하고 핸들링 하는 방법이 있을 수 있겠다. 이러한 형태의 통신을 좋아하지는 않지만, Presenter가 다른 Presenter를 알고 있는것 보다는 나아보인다.

그런데, 한가지 고민해봐야 할 부분이 있는데 Presenter가 콜백이나 혹은 이벤트를 핸들링 하는게 적당한지에 대한 부분이다.

## 3. Callback을 받는 Presenter

생각해보면, Repository 혹은 Api로 부터 받는 콜백 핸들러가 Presenter에 있는것에는 큰 거부감이 없었던거 같다. [chorong-sample-persistence](https://github.com/poksion/chorong-android/blob/master/samples/src/main/java/net/poksion/chorong/android/samples/presenter/SampleForPersistencePresenter.java)에 있는 Presenter도 자연스럽게 Repository를 "관찰"하고 있으며, 이러한 필요 때문에 "ObservingTask"라는 모듈로 따로 만들었었다.

## 4. Domain Model as Mediator

비슷한 고민을 하는글들에 대한 다른 해법중에 Mediator로써 [도메인 모델을 두는방식](https://softwareengineering.stackexchange.com/questions/262372/communication-between-multiple-presenters-in-mvp)을 제안하는 답변들이 꽤 있다. 나는 이것이 상당히 설득력이 있다고 생각한다. 물론, Presenter와 Domain model이 통신하는 방법은 Callback을 통한 "관찰"일 것이다.

## 5. 결론

결론적으로, 다시 이러한 문제를 만난다면 나는 아래의 방향으로 해결할 것 같다.

 * Presenter는 View와 1:1로 매칭되게 설계한다.
 * Presenter는 Domain Model을 관찰할 수 있다.
 * 하나의 Action이 여러 Presenter(View)에 영향을 미치는 경우라면, 그 Action을 다루는 Domain model을 고려해 본다.

