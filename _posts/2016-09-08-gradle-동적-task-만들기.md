---
layout: post
title: "Gradle 동적 task 만들기"
date: 2016-09-08 09:20:00 +0900
categories: blog
tags: 프로그래밍  하드보일드
---

안드로이드에서 flavor를 많이 만들다보면, 그에 따라 여러가지 기계적으로 추가해야 되는 task 들이 있다. 이러한 task들은 추가된 flavor (variant)에 대응되게 동적으로 만들 수 있다.

<pre>panel-hide-start</pre>

```gradle
...

findbugs {
    sourceSets = []
    ignoreFailures = true
}

android.applicationVariants.all { variant ->
    def flavorNameWithFirstUpper = variant.name.take(1).toUpperCase() + variant.name.substring(1)
    def assembleTask = ":app:assemble$flavorNameWithFirstUpper"

    task "findbugs$flavorNameWithFirstUpper" (type: FindBugs, dependsOn: assembleTask) {
        description "Run FindBugs for $flavorNameWithFirstUpper"
        group 'analysis'

        classes = fileTree("build/intermediates/classes/${variant.productFlavors[0].name}")
        source = fileTree('src/main/java')
        classpath = files()

        effort = 'max'

        excludeFilter = file('./config/findbugs/exclude.xml')

        reports {
            xml.enabled = true
            html.enabled = false
        }
    }
    ...
}
...
```

<pre>panel-hide-end</pre>

<script src="https://gist.github.com/poksion/b642370682d2f3a7d6e99d4d58dbb115.js"></script>

위 예제는 assemble하기전에 findbug reporting을 product flavor 별로 동적으로 만들어주는 gradle 스크립트이다. 이렇게 동적으로 task를 만들면 중복코드가 많이 줄어든다.


