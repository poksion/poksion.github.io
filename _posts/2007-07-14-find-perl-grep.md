---
layout: post
title: "find / perl / grep"
date: 2007-07-14 10:27:00 +0900
author: poksion
categories: blog
tags: 컴퓨터  프로그래밍
---

perl
----
> perl -pi -e 's/index\.html/main\.html/g' *

전체 파일에 대해 index.html 이라는 문자열을 main.html 이라는 문자열로 바꾸기

find
----
 * atime(access time) / ctime(change time)
 * type : 파일 타입 옵션 (f : file / d : directory)
 * -exec 명령어 {} \; : 지정한 명령 적용. {} \; 에 주의할 것
 
 > ex. find . -name '*.txt' -exec perl -pi -e 's/바뀌기이전/바뀐이후/g' {} \;

grep
----
현재폴더 이하에서 alc를 포함한 것을 번호를 나타내어 출력
> grep "alc" * -R -n

