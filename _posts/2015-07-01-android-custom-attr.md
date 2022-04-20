---
layout: post
title: "Android custom-attr"
date: 2015-07-01 17:13:00 +0900
author: poksion
categories: blog
tags: 안드로이드  컴퓨터  프로그래밍  하드보일드
---
안드로이드의 custom attribute는 일반적으로 2가지 용도로 쓰인다.

 * xml상에서 ``custom_namespace:custom_attr`` 형태로 ``값을 지정받고`` 지정된 값을 UI Component상에서 obtainStyledAttributes로 획득하여 값을 적용하는 용도
 * ``?attr/custom_attr`` 형태의 ``값으로 지정되고`` style - item상에서 name="custom_attr" 형태로 값을 지정받아 style이 적용되게 하는 용도

즉, 지정받은 값을 확인하는 key의 형태로도 쓰이지만, style의 값을 refenece하는 reference 이름의 형태로도 쓰이기 때문에 개념상 어렵다.

또한 지정도 top resources에 지정도 가능하고 declare-styleable 안의 자식노드로도 지정이 가능하며, declare-styleable에 name으로 구분이 가능하다 하더라도 attr name이 global한 namespace를 가지는 정말 복잡하고 독특한 특징을 가진다.

<div align="center"><img src="/assets/img/post/custom-attr-key.png" /></div>

``1. attr name은 unique 해야한다``에 대해서는 [불만이 많은 모양](https://code.google.com/p/android/issues/detail?id=22576)이다. 특히 declare-styleable로 namespace 구분이 가능한데 왜 이렇게 구현되었는지에 대한 불만이다. 물론 reuse를 하는 방법에 대해 ``To reuse an attribute, first declare it on its own (top level node), with its format.
Then use it inside declare-styleable by just putting its name (<attr name="foo" />)`` 라고 설명되어 있고 ActionBarSherlock의 abs_attr을 보면 그러한 형태로 구현되어 있지만(top-level과 declare-styleable-level에는 동일한 이름을 가지는 attr이 나오고 declare-styleable-level에서 동일한 attr을 format없이 지정) 외부 라이브러리 개발자 입장에서는 이미 지정되어 있는 attr을 재사용하기 위해 위와 같은 절차는 불합리해 보이는것도 사실인것 같다.

위에 나타나있는 ``5. style``은 attribute 설정값 모음으로 이해하면 편한데, custom_attr의 두번째 용도 - style을 refenece 한다 - 와 함께 사용되어 custom_attr을 더욱 어렵게 만든다.

<div align="center"><img src="/assets/img/post/custom-attr-reference.png" /></div>

custom_attr은 attr이라는 key 형태 뿐만 아니라 refenence를 가르키는 value로도 사용이 가능하다. 해당 refenece는 attr로 name과 format이 지정되며 style의 item의 내용으로 값이 지정되어 style이 적용될때 함께 적용된다.

요약을 하자면,

 1. custom_attr은 resources top-level 혹은 declare-styleable 안에서 만들어지며, 이름은 global namespace이지만 reuse가 가능하다.
 2. custom_attr은 UI component를 xml레벨에서 제어가 가능하게 해준다.
 3. custom_attr은 xml attr의 refenece value로서 지정이 가능하며, 실제 값은 style의 item에 지정된다.

