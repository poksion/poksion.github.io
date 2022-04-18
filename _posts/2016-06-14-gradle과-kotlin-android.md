---
layout: post
title: "gradle과 kotlin-android"
date: 2016-06-14 17:36:00 +0900
categories: blog
tags: 안드로이드  프로그래밍
---

메이븐과 그래들의 가장 큰 차이점은, 프로젝트를 계층적으로 가져갈 수 있는지 여부이다. 나는 계층적인 프로젝트가 좋은지는 모르겠지만, 어쨌든 안드로이드 스튜디오가 선택한 그래들은 계층적 프로젝트 구조를 가질 수 있으며, 안드로이드 스튜디오는 기본적으로 root 프로젝트와 한개의 하위 프로젝트 (app 프로젝트)를 가지는 gradle 설정으로 프로젝트를 만는다.

```
안드로이드 gradle은,

1. 외부 플러그인을 사용하는
2. Multi-project Builds gralde 로 프로젝트를 구성하여 빌드
```

 * http://tools.android.com/tech-docs/new-build-system/user-guide
 * http://tools.android.com/tech-docs/new-build-system/build-workflow
 * https://docs.gradle.org/current/userguide/multi_project_builds.html

```
water/ (루트 프로젝트)
  build.gradle -- (1)
  settings.gradle -- (2)
  bluewhale/ (서브 프로젝트1)
  krill/ (서브 프로젝트2)
```

```
(2) settings.gradle

include 'bluewhale', 'krill'
```

<br/>

kotlin-android
---------------

kotlin을 안드로이드에서 설정하기 위해서는, ``A. 코틀린 그래들 플러그인``을 사용한다고 root 프로젝트에 설정해야하고, ``B. 각 하위 프로젝트별``로

 1. ``plug-in 적용``
 2. ``sourceSets에 추가``
 3. ``compile/testCompile`` 디펜던시에 추가 (jar reference)

과정을 거친다.

### root 프로젝트에 코틀린 그래들 플러그인 classpath 설정하기

```groovy
buildscript {
    // https://kotlinlang.org/docs/reference/using-gradle.html
    ext.kotlin_version = '1.0.2'

    repositories {
        jcenter()
    }

    dependencies {
        classpath 'com.android.tools.build:gradle:2.1.2'

        // 요거이가 추가된 부분
        classpath "org.jetbrains.kotlin:kotlin-gradle-plugin:$kotlin_version"
    }
}
```

### app 프로젝트에 사용 설정 적용하기

```groovy
apply plugin: 'com.android.application'

// 요거이 추가
apply plugin: 'kotlin-android'

android {
    //...

    // 요거이 추가
    sourceSets {
        main.java.srcDirs += 'src/main/kotlin'
        test.java.srcDirs += 'src/test/kotlin'
    }
}

dependencies {
    //...

    // 요거이 추가
    compile "org.jetbrains.kotlin:kotlin-stdlib:$kotlin_version"
    testCompile "org.jetbrains.kotlin:kotlin-stdlib:$kotlin_version"
}
```

