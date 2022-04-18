---
layout: post
title: "quodlibet"
date: 2006-07-10 23:19:00 +0900
categories: blog
tags: 컴퓨터
---

리듬박스를 대체할만한 강력한 음악연주 프로그램. 정말 강력하다.

파이썬을 써서 무거울줄 알았는데, 왠걸.. 리듬박스보다 조금 무거운 수준..

내게는 조금 민간함사항인(...) 시작시 감추기! 가 우분투 대퍼버전용에서는 적용이 안되어 있다.http://www.sacredchao.net/quodlibet/changeset/3489 를 보면서 패치를 해봤다. 내 경우 /usr/share/quodlibet/qltk/trayicon.py에서

```python
...
150 watcher.connect('paused', self.__set_paused, player)
151 watcher.connect('unpaused', self.__set_paused, player)
152
153 #edit by pok
154 def intercept_show():
155 window.show = gtk.Window.show
156 try:
157 window.show = intercept_show
158 except config.error: pass
159 #end edit
160
161 icon.show_all()
...
```

.quodlibet 의 config에서 id3tag 설정이 가능하며, cp949로 해주면 한글 태그도 잘 읽어온다.

