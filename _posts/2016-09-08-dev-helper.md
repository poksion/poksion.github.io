---
layout: post
title: "dev-helper"
date: 2016-09-08 11:41:00 +0900
author: poksion
categories: blog
tags: Digital Nomad  프로그래밍
---
명령어가 길어서 다 치기 귀찮거나 여러가지 유틸을 조합해서 알음알음 만들었던 스크립트들이 꽤 많아졌다. 어떤 스크립트들이 있는지 매번 까먹는다는게 문제라서, 스크립트의 활용방안을 적어놓은 단순 echo 모음 스크립트를 만들면서, 관련 내용을 정리해본다.

<div class="panel">
<pre>

-------------------------------------------------
Source quality checker
-------------------------------------------------
nsiq DIR_NAME
    - execute nsiqcollector on DIR_NAME
checkstyle-metric FILE_NAME
    - check metric on FILE_NAME
-------------------------------------------------
File grep tools
-------------------------------------------------
dev-grep FILE_EXT WANTED_WORD
    - find WANTED_WORD in FILE_EXT on current dir
eng grep WANTED_WORD
    - find WANTED_WORD in englis script dir
dn
    - shell for digital-nomad
-------------------------------------------------
ANDROID and Java
-------------------------------------------------
android-manifest-dump XXX.apk
    - show manifest information from apk
dex2jar XXX.apk
    - make jar from apk
gradle-java-7
    - gradle 2.14.1 with java 7
jar-sign-verify XXX.apk
    - verify apk signing
jd-gui
    - execute JD-GUI
log-filter
    - execute ADB Log Filter
-------------------------------------------------
Application Executor helper / ETC
-------------------------------------------------
change2utf8.sh DIR_NAME
    - CHANGE to utf8 on DIR_NAME
dev-helper
    - this application
dropbox-restorer
    - restore dropbox folder
gen-ctags
    - generate ctags and cscope file
git-short-log
    - show pretty git log on current dir
mysqld-start
    - start mysqld
mysqld-stop
    - stop mysqld
mvim
    - execute mvim from terminal
photo-resizer-2048 FILE_LIST
    - photo resizing to 2048 on FILE_LIST files
pyhttpd-here
    - execute simpleHTTP on 8080 from current dir
svnx
    - execute svnx

</pre>
</div>

