---
layout: post
title: "Feature Envy"
date: 2014-03-17 11:39:00 +0900
categories: blog
tags: 프로그래밍  컴퓨터  하드보일드
---

정육면체 색깔 문제를 푸는중..
-----------------------

``` 왜 나는 Feature Envy에 빠졌나.. ```

순회문을 여러번 쓰는 반복을 하기 싫어서. 만일 루비였다면, array.uniq!.size 를 바로 했을꺼다. 나중에 알아보니 set<string> s(vec.begin(), vec.end()); s.size로 간단하게 할수 있었을듯..

``` NULL parameter를 넣으려고 했다면 feature envy가 있는 셈. ```

(이제까지 나의 feature envy를 보면, 코드반복 - 특히 loop문 - 을 피하기 위해서 하는 경우가 많았다)


feature envy가 나쁜 이유 중 하나.
------------------------------

기능이 꼭 필요한 기능이 아니라 뭔가 부족하여 Law of Demeter (LoD) or principle of least knowledge 를 어길 가능성이 높아진다.

관련글
-----

어디선가 찾아 메모해놨던 관련글들.. 어디서부터 발췌했는지는 까먹었다.

Number of lines is not a good metric. A better rule would be to follow the ``` Single Responsibility Principle. ```

ie. A class should only do one thing. Try to identify code smells. Does your class have ```feature envy``` or does it contain methods that have ```too many parameters```? Does your class violate the Law of Demeter? These are just some code smells to look for. When you encounter code smells, refactor and you'll find your classes often naturally shrink in size or get broken up into multiple smaller classes.

I find that ```LOCs is good measurement only at the method level```. That is, I generally like my methods to fit on a screen (no small fonts). Other metrics like Cyclomatic Complexity and Code Coverage (for you TDDers) in addition to your unit tests can give to a better feel for how healthy your codebase is.

 * Cohesion
 * Instability
 * Abstractness
 * Lack of Cohesion of Method

### Dependency
 * Branch
http://story.wisedog.net/sw-metric-cyclomatic-complexity-%EB%B3%B5%EC%9E%A1%EC%84%B1-%EC%A7%80%ED%91%9C/

### Response for Class (RFC)

The RFC is the "Number of Distinct Methods and Constructors invoked by a Class." The response set of a class is the set of all methods and constructors that can be invoked as a result of a message sent to an object of the class. This set includes the methods in the class, inheritance hierarchy, and methods that can be invoked on other objects.

The RFC for a class should usually not exceed 50 although it is acceptable to have a RFC up to 100. RefactorIT recommends a default threshold from 0 to 50 for a class. If the RFC for a class is large, it means that there is a high complexity. For example, if a method call on a class can result in a large number of different method calls on the target and other classes. It can be hard to test the behaviour of the class and to debug problems since comprehending class behaviour requires a deep understanding of the potential interactions that objects of the class can have with the rest of the system.

