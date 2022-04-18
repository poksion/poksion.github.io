---
layout: post
title: "AppCompat 삽질기"
date: 2016-06-25 11:35:00 +0900
categories: blog
tags: 하드보일드  안드로이드  프로그래밍
---

많은 회사가 그렇듯이 지금 회사에서도 기존에 프레임워크에서 제공했던 기능들이 빈약해서 커스터마이징 해서 썼던 기능들을 빵빵하게 다시 지원하는 신기능들로 바꾸는 작업들이 몇몇있다. 대표적인것이 ActionBar - Toolbar 전환이고 그 기능을 구현하면서 꽤 많은 삽질들을 겪었다.

스타일 상속 기능
-------------

Theme.NoTitleBar.Fullscreen의 스타일은 아래처럼 설정되어 있다.

```xml
<style name="Theme.NoTitleBar.Fullscreen">
    <item name="windowFullscreen">true</item>
    <item name="windowContentOverlay">@null</item>
</style>
```

<br/>

그리고 AppCompat의 스타일 설정은 다음과 같다

```xml
<style name="Theme.AppCompat.Light.NoActionBar">
    <item name="windowActionBar">false</item>
    <item name="android:windowNoTitle">true</item>
</style>
```

<br/>

스타일은 parent를 명시하여 직접적으로 상속할 수도 있지만, 스타일 이름을 가지고 상속이 구현되기도 한다. 정말 상상도 못했다. 그래서 명시적으로 상속받고 있지 않는 두 스타일의 차이가 매우 적을것이라고 생각했고 [구글 개발자블로그 - AppCompat 라이브러리](http://googledevkr.blogspot.kr/2014/10/appcompat-v21-material-design-for-pre.html)에서 ``반드시 Theme.AppCompat를 상속 받아야한다``라는 경고를 완전히 무시했다. 결과는 개삽질.

정말 정말 상상도 못하게 스타일은 이름 스페이스 개념으로 상속을 구현하고 있다. 물론 구글에서는 [테마문서 - 상속](https://developer.android.com/guide/topics/ui/themes.html#Inheritance
)에서 잘 설명하고 있다.


디렉토리 이름으로 리소스 Overriding
------------------------------

만일 values-v11에 value와 동일한 값이 있다면 API 11이상 버전에서는 value의 값이 무시되고 values-v11 값이 사용된다. 이런것 처럼 설정이 리소스 제공에 영향을 미치는 것에 대해 구글은 [Providing Resources](https://developer.android.com/guide/topics/resources/providing-resources.html)에서 잘 설명하고 있다. 문제는 내가 values-v11에 style관련 내용이 있는지 모르고 values의 style만 변경해보고 왜 적용이 안되는지 삽질에 찾기를 반복한거에 있지만..

나는 이것이 좋은 CoC인지 모르겠다
--------------------------

명시적인 상속이 있음에도 이름으로 상속이 적용되고, 기본 리소스 이름 뒤에 suffix를 붙이는것으로 완전히 다른 리소스 설정을 따르는, 안드로이드의 리소스상의 CoC가 좋은지 정말 모르겠다. 커다란 프레임워크를 다루고 그 프레임워크가 그냥 대부분이 잘 알것 같은 컨벤션을 사용하는것이 아니라면, 이런류의 CoC는 삽질을 피하기 어려울것이라는 생각이 든다.


문서 잘 읽어보기
-------------

프레임워크에 히스토리를 꽤고 있는것이 어떤 장점이 될 수 있을까? 요새 드는 생각은 "YES"이다. 어떤 프로젝트에서는 신규로 작업이 진행되지만 많은 프로젝트들이 기존 프로젝트를 개선하는 작업들이다. 따라서 그 프로젝트가 사용하는 프레임워크의 work-arround코드나 변경된 내용들을 잘 알고 있다면 꽤 많은 문제 해결과 시간 단축을 할수 있을것이고 어느정도 경쟁력이 될수 있을것이라는 생각을 하게 된다.

