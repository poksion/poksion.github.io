---
layout: post
title: "vim 윈도 위치설정 / acroread 설정 / 사운드 mute toggle"
date: 2006-07-29 10:14:00 +0900
categories: blog
tags: 컴퓨터
---

1. vim 윈도위치 설정
------------------
devilspie 로 위치설정이 안된다. 대신 vim 옵션중에 winpos 라는 옵션이 있다.
기존 vimrc 설정에

> winpos 80 40

식으로 추가해준다.

```shell
ex. sudo vi /etc/vim/gvimrc
set guifont=DejaVu\ Sans\ Mono\ 11
set lines=32 columns=120
winpos 80 40
colors darkblue
set nu
```

2. acroread 설정
----------------
alien으로 어도비리더 rpm을 deb으로 바꾸어 깔아준후, 비어있는 /usr/bin/acroread에

```shell
#!/bin/sh
GTK_IM_MODULE=xim
exec /usr/local/Adobe/Acrobat7.0/bin/acroread "$1"
```

를 작성해준다.

3. 사운드 mute toggle
--------------------

> amixer sset PCM toggle

