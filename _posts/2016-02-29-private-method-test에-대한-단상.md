---
layout: post
title: "Private method Test에 대한 단상"
date: 2016-02-29 10:14:00 +0900
author: poksion
categories: blog
tags: 프로그래밍
---

Private method 테스트에 대한 고민들을 찾아보면 크게 두가지 결론에 도달한다.

 * Private method는 테스트할 꺼리가 없어야한다.
 * Private method의 테스트가 필요하다고 생각되면 설계를 의심해보아라.

첫번째의 결론에 대해서는, 그만큼 private method는 작고 간결해야 한다는 의미이고 두번째 결론은 해당 메소드를 Private으로 할것인지 Public으로 할것인지에 대해서는 외부 객체에 어떻게 알려야되는지에 대한 내용인데 ``이것이 외부 객체가 알 필요가 있는지`` 여부 뿐만 아니라 ``테스트 할 만큼 중요한지`` 여부도 함께 고민해야 한다는 의미를 가진다.

따라서 테스트 할만큼 중요한 코드라면 다른 객체로 분리할 필요가 있어 보인다. (혹은 하위 클래스에서 결정을 바꿀수 있으므로 protected로 하는 가능성을 생각해 본다거나..)

