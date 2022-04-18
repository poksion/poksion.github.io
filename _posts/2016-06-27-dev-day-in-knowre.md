---
layout: post
title: "Dev-day in Knowre"
date: 2016-06-27 02:06:00 +0900
categories: blog
tags: 컴퓨터  일상이야기
---

지난 수요일 새로 옮긴 회사에서 Dev-day를 했다. 하루 날 잡아서 오후부터 거의 자정까지 개발(혹은 개발자)과 관련된 코딩(혹은 활동)을 하는 행사이다.

이번주제는 Ultimate tic-tac-toe를 만드는거였는데 내게 꽤 많은 생각거리를 던져 주었다

발려서 슬펐다
-----------

마구 발렸다. 발린 이유는 전략이 아주 구렸다기 보다는 내가 만든 봇의 오류로 잘못된 동작을 해서 발린 경우가 매우 많았다. 초기에 기본으로 주어지는 random이랑 한다 하더라도 구현을 잘못하여 동작을 잘못하면 발려도 할말이 없다.

코드 구현의 단단함
---------------

새로운 회사 동료분들께 놀란점이, 짧은 시간안에 구현을 단단히 잘한다! 테스트 코드를 작성하는것도 아니고 걍 대충 만드는것 같은데, 확실의 구현의 단단함이 있다. 역시 저런류의 알고리즘 대결 상황에서는 대단한 알고리즘을 생각해내는 것보다는 시간안에 ``구현을 제대로 잘하는것``이 훨씬 중요하다. 그렇지 않으면 어떤것이 잘못 되었는지 나중에 확신이 서지 않고 그에 따라 디버깅 시간이 기하 급수적으로 늘어난다. 단단하게 구현하는 스킬이 꽤 늘었다고 생각했는데, 이후 알고리즘 공부는 코드의 단단한 구현에 좀더 신경써서 진행해야 겠다.

ultimate tic-tac-toe
---------------------

회사에서 ultimate-tic-tac-toe 봇 대결을 진행한 사이트는 riddles.io에서 운영하는 [the-ai-games](http://theaigames.com/competitions/ultimate-tic-tac-toe/getting-started)라는 곳이다. ultimate tic-tac-toe 룰은 작은 tic-tac-toe 9판이 tic-tac-toe 룰대로 같은 라인을 차지하면 이기는데, 작은 tic-tac-toe판에서 둔 위치의 큰 판 위치에는 둘 수 없다. (에잇. 무슨말인지 모르겠다. 이 게임의 [원조](https://mathwithbaddrawings.com/2013/06/16/ultimate-tic-tac-toe/)처럼 보이는 곳에서 직접 룰을 살펴보는게 좋을것 같다)

일단 초기에 생각했던,

 * 안 막으면 지는곳을 막아라
 * 차지하면 이기는 곳을 차지하라

룰을 제대로 구현한 C++버전 봇을 [github](https://github.com/poksion/human-learning/tree/master/AlgoStudy/just-do-it/ttt-ultimate)에 올려두었으니 관심 있으신 분들은 도전해보시길!


