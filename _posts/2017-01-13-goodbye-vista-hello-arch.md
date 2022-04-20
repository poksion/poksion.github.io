---
layout: post
title: "Goodbye Vista, Hello Arch"
date: 2017-01-13 10:48:00 +0900
author: poksion
categories: blog
tags: 컴퓨터  일상이야기
---

비스타에서도 이제 OS지원 종료 팝업이 뜬다. 업데이트 하기도 넘나 힘들었고, 오래된 노트북이라 CPU쿨링이 잘 안되는데 쿨러조절하기도 힘들어 오랜 고민 끝에 Arch linux - Xfce로 넘어갔다. 넘어가면서 겪었던 삽질기

네트워크 매니저
------------

결국 네트워크 작업은 커널과 관련된 ip라는 명령으로 할것이다. 이 명령을 잘 활용할수 있는 서비스레벨의 관리툴이 필요한데, arch에서 가장 일반적으로 사용하는 툴이 netctl이고 그 다음이 NetworkManager이다.

netctl이 systemd와 잘 어울리기는 하나, 나는 단지 내가 선호하는 wifi에 잘 연결해주는 툴이 필요했을 뿐이라 나에게는 NetworkManager가 더 잘 맞는것 같다. NetworkManager의 nmcli를 통해

`nmcli dev wifi connect <name> password <password>`

로 연결을 하면, 알아서 /etc/NetworkManager/system-connections/ 에 잘 저장해주며, Xfce의 애플릿과도 잘 연동된다.

yaourt
-------

arch 리눅스의 AUR 패키징 도우미 앱인 yaourt는 정말 굉장하다. AUR이 굉장하기 때문에 매우 편리하게 사용하느것도 있겠지만, apt나 여타의 다른 패키지 관리툴보다 더 편한것 같다.

덕분에 나눔 글꼴이라든가, 구글 크롬등을 매우 쉽고 편리하게 설치할 수 있었다. 마법의 명령어 `yaourt -Syu 패키지_이름`

(-Syu 옵션을 -Sy대신에 사용하라고 [Arch위키](https://wiki.archlinux.org/index.php/Pacman)에 친절히 써있다. 걍 설치할땐 고민없이 -Syu)

컴퓨터 시간
---------

결론은.. 바이오스 시간이 잘못 설정되어 있었다. 인데 몇가지 삽질을 하면서 정리한 지식들.

 * https://wiki.archlinux.org/index.php?title=Time&redirect=no#Time_zone
 * timezone 설정은 `#ln -sf /usr/share/zoneinfo/Zone/SubZone /etc/localtime` 형태가 최종모양이다.
 * 사용자의 실수를 막기 위해(?) arch에서는 `timedatectl`을 제공한다.
 * `#timedatectl set-timezone Canada/Eastern`
 * 참고로, ln의 `-f` 옵션은, 이미 링크가 있다면 없애고 다시 만들어라 옵션.


테마 / 아이콘 팩
-------------

테마와 아이콘등의 리소스에 있어서도 그간 리눅스에 엄청난 발전이 있었다. 고를수 있는 선택지도 많아졌을뿐만 아니라 각각의 품질또한 매우 높다!

현재 설치해서 사용중인건은 Numix테마에 elementary 아이콘팩. 그외 한번쯤 설치하고 시도해볼만한 리소스들 -

 * faenza-icon-theme
 * gnome-icon-theme-xfce
 * vibrancy-colors

조용한 grub
----------

부팅이 매우 빠른데, grub에서 많은 시간을 잡아먹는다. 그동안 grub도 많이 바뀌어서 아래 두개만 `/etc/default/grub`에서 수정하며 된다.

 * GRUB_TIMEOUT="0"
 * GRUB_TIMEOUT_STYLE=hidden

참고로 Arch에는 update-grub이 없어서 `grub-mkconfig -o /boot/grub/grub.cfg`를 통해 직접 grub을 업데이트 해줘야한다.

