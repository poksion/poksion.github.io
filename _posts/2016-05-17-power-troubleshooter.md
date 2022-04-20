---
layout: post
title: "Power-Troubleshooter"
date: 2016-05-17 23:57:00 +0900
author: poksion
categories: blog
tags: 컴퓨터
---

내가 쓰는 세컨피씨는 기가바이트의 T1125M이라는 상당히 독특한 모델이다. (퍼스트피씨는 회사에서 주는 개발자 노트북 -_-)

나름 매우 매력적인 모델이라 꽤 오랜기간동안 사용하고 있는데, 이게 윈도10으로 업그레이드 하면서 가끔 Smart turbo라는 기가바이트 자체 오버클럭 유틸을 사용 못하는 현상이 발견되었다. - 희한하게 재부팅하면 정상적으로 작동한다.

그래서 최근에 시간이 있을때 함 집착(-_-)을 가지고 고쳐보기로 했다. 윈도는 나름 로그 시스템도 잘 갖춰진 운영체제이므로 노가다 디버깅(껐다켰다로 현상재현 + 로그분석)을 하기로 했다.

그런데 생각보다 현상을 유발하는 종속변인을 빠르게 발견하였다.

```
정보	2016-05-16 오후 10:52:38	Power-Troubleshooter	1	없음
...
시스템이 저전원 상태에서 복귀되었습니다.

절전 모드 시간: ‎2016‎-‎05‎-‎16T13:36:34.553269900Z
절전 모드 해제 시간: ‎2016‎-‎05‎-‎16T13:52:36.552182700Z

절전 모드 해제 원본: 알 수 없음
```

요 로그만 있으면 Smart turbo를 사용하지 못한다.

이제는 그것을 가지고 구글링을 해봤는데, 빙고! [MS answer 사이트](http://answers.microsoft.com/en-us/windows/forum/windows_10-performance/windows-10-randomly-wakes-up-from-hibernate-with/429629ca-d154-4199-8d4f-7b03532a9c72)에서 단서를 발견!

```
Start/control panel/ power options
click "choose what the power button does" on left menu
then click "change settings that are currently unavailable" at top of page
uncheck " turn on fast startup" in the menu at bottom of page
reboot
```

결론 : 어려운 문제에 대해 현상의 발생 - 재현 - 이 있다면, 꼼꼼한 기록 - 로그 - 를 통해 문제를 해결할 수 있다.

