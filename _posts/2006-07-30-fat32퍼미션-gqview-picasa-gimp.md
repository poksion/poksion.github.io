---
layout: post
title: "fat32 퍼미션 문제 / gqview 및 picasa linux / gimp 확대 및 축소"
date: 2006-07-30 21:12:00 +0900
author: poksion
categories: blog
tags: 컴퓨터
---

1. fat32 퍼미션
--------------
사실 fat32 를 마운팅해서 쓸수 있는것만으로도 행복한것이나, fat32를 마치 로그인한 사람에게 마운팅된 리눅스파일시스템 - 퍼미션관리가 되고 소유자가 있는 - 으로 착각하여 사용하면 희한한 결과를 얻을수 있다. 한 예로 kldp.net에 scp로 그림을 하나 복사했는데 fat32상에서 퍼미션을 전혀 고려않고 복사를 했더니 퍼미션 에러때문에 보여줄 수 없단다. 그러나 윈도우와의 공유를 위해서는 fat32가 좋은 선택이 될 수 있으며 따라서 사용함에 있어서 약간의 주의가 필요하다.

fat32 파일을 kldp에 scp로 복사할때는 home디렉토리로 복사한후에 chmod 0 // chmod +r을 주어 퍼미션을 확인해 준다. 또한 백업을 바로 복사하지 말고 설정파일의 경우에는 열어서 설정을 복사해주거나 퍼미션 확인을 반드시 해주도록 한다.

2. gqview / picasa linux
-------------------------
gqview는 빠르다. 윈도우 위치나 크기를 프로그램내에서 관리를 하는데, Edit - preferences - windows - state 에 Remember window positions 에 체크를 해주면 크기나 위치가 기억된다.

picasa 는 조금 무거우나 훌륭한 앨범관리 프로그램이다. Tools - Option - Autometicaly detect media 체크를 해지해주면 트레이에 뜨는것 없이 종료시에 바로 종료된다.

3. gimp 확대/축소
----------------
shift + = 키를 통해 확대가 가능하고 -키를 통해 축소가 가능하다. <br/>
뿐만 아니라 shift + 마우스 휠 을 통해서도 확대 / 축소가 가능하다.

