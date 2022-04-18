---
layout: post
title: "vim tips : 두개의 file을 diff 하는 방법"
date: 2008-11-13 22:20:00 +0900
categories: blog
tags: 프로그래밍  컴퓨터
---

비교하고 싶은 두 파일이 있을때 vim을 이용하면 편리하다.

간단히 두 파일을 하나의 vim으로 열면 vim 하나에 두개의 버퍼가 있을것이다. 현재 vim에 어떤파일들이 열려있어서 어떤 버퍼들이 있는지를 보려면

>:buffers

라는 명령을 치면 된다.

그러면 불친절한(?) 리스트가 뜨는데, 리스트에 나타난 기호와 알파벳의 정체는 이렇다.

```

% current window
# alternate buffer (switch using :e# or :b#)
a active (loaded and visible)
+ modified

```

그 리스트 중에서 현재 편집중인 것과 diff하려는 버퍼를 split 하여 열면 된다.

> :sb N

여기서 N은 리스트에 나타난 버퍼번호이다. 나는 diff를 할때 비교하려는 파일을 수직으로 나누어 보는것을 좋아하므로 버퍼를 항상 수직으로 연다.

> :vert sb N

ctrl+W, W를 누르면 분할된 창끼리 넘나드는데 넘나들면서 각각의 버퍼에 diffthis명령을 준다.

> :diffthis

그러면 두개의 창이 diff 모드가 된다. 만일 diff모드를 해제하고 싶다면 diffoff( 7.0이상이던가.. 그렇다)를 준다.

> :diffoff

* reference link
   - [:buffers 명령시에 나타난 불친절한 메시지를 친절히 설명해 놓은 사이트](http://blog.interlinked.org/tutorials/vim_tutorial.html)
   - [vimdiff의 더 많은 활용 from kldp](http://kldp.org/node/1155)

