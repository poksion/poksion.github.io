---
layout: post
title: "글(gle) 프로젝트"
date: 2015-07-10 16:13:00 +0900
categories: blog
tags: 프로그래밍
---
컴퓨터 과학 공부 장기 프로젝트 중에 인공지능과 자연어처리 공부를 목표로 하고 있다. 그래서 조금씩 알아보고 공부하고 있는데, 의미있는 소프트웨어 결과물로 남기고자 시작한 프로젝트가 [gle(글) 프로젝트](https://github.com/poksion/gle)이다.

<img src="https://raw.githubusercontent.com/poksion/gle/master/section.png" />

구조를 document - section - morpheme 으로 잡은 후 처음 시작한 일감이 "블로그 내 단어 세기" 프로젝트였다. 주로 구조적 해석을 맡는 section 부분에서 작업을 진행했고, "단어"라고 할수 있는 내용을 만들수 있도록 WordFilter에 몇몇가지 filtering을 걸어봤지만 역시 형태소 분석없이는 단어 횟수가 의미를 가지는데 큰 벽이 있는것 같다.

```
있다 : 206
있는 : 128
잘 : 128
내가 : 105
같다 : 93
한다 : 93
프로그래밍 : 92
다른 : 88
그 : 82
에서 : 81
일상이야기 : 75
내 : 72
라는 : 68
컴퓨터 : 66
회사 : 66
그리고 : 65
대한 : 64
하고 : 64
이러한 : 62
그래서 : 61
나는 : 61
대해 : 54
좋은 : 54
정말 : 53
...
힘들지 : 1
힘들지라도 : 1
힘에 : 1
힘이 : 1
힙에만 : 1
힙이든 : 1
힙합의 : 1
Total word count : 26929

형태소 분석기 없이 분석한 결과 : 이만건 중에 절반 이상이 count 1이다..
```

얼렁 형태소 분석기쪽을 작업해야겠다.

<img src="https://raw.githubusercontent.com/poksion/gle/master/morpheme.png" />

