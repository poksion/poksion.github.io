---
layout: post
title: "Android Instrumented Unit Tests"
date: 2016-09-08 15:44:00 +0900
author: poksion
categories: blog
tags: 프로그래밍  하드보일드
---

API 버전 24부터, 실제 디바이스에서 테스트하는 "Instrumentation" 가 쓸만하게 바뀌었다. 사실 UI의 테스트가 과연 "Unit" Test인지/의미가 있는지 등의 이견들이 많기는하지만, TDD의 다른 중요한 측면 - 무엇을 할것인지 내부에서 고민하지 않고 외부의 바라봄으로 접근한다 - 을 만족시키기 위해서 이러한 테스트가 필요하다고 생각한다.

기존에 정말 병맛이었던 [ActivityInstrumentationTestCase2](https://developer.android.com/reference/android/test/ActivityInstrumentationTestCase2.html)나 기타의 병맛 친구들이 모두 deprecated 되었다! 그리고 새로운 AndroidJUnitRnner라는 Test Runner와 함께 돌아왔다.

[효과적인 인스트러먼트 테스트를 위한 문서](https://developer.android.com/training/testing/unit-testing/instrumented-unit-tests.html)에서 필요한 내용들이 잘 설명되어 있다. 중요한것을 나열해보자면,

 * Instrumented Test는 기존처럼 androidTest에서 작성한다.
 * dependenceis에 (현재 최신 버전이 0.4인) support.test를 추가해준다.
 * defaultConfig에 testInstrumentationRunner를 명시해준다.


<!--

```
dependencies {
  androidTestCompile 'com.android.support:support-annotations:23.0.1'
  androidTestCompile 'com.android.support.test:runner:0.4'
  androidTestCompile 'com.android.support.test:rules:0.4'
  ...
}

...

android {
    defaultConfig {
        testInstrumentationRunner "android.support.test.runner.AndroidJUnitRunner"
    }
}
```

-->


<script src="https://gist.github.com/poksion/7d69692e62b40d13b6bb20e10f9acd63.js"></script>

<br/>

## ActivityTestRule

Instrument Test에서 Acitivty를 실행하는 방법도 깔끔해졌다. ActivityTestRule을 public final로 선언한후 launch해주면 끝.


<!--

```java
@RunWith(AndroidJUnit4.class)
public class MainActivityTest {

    @org.junit.Rule
    public final ActivityTestRule<MainActivity> activityRule = new ActivityTestRule<>(MainActivity.class, true, false);

    @Test
    public void testLaunchMainActivity() {
        MainActivity activity = activityRule.launchActivity(null);
        assertThat(activity).isNotNull();
        ...
    }
    ...
}
```

-->


<script src="https://gist.github.com/poksion/49226a145e3fa67825d71f06724b7899.js"></script>

참고로, AssertJ core 버전이 높으면 컴파일이 안된다. 현재 사용하는 버전은 1.7.1버전.

