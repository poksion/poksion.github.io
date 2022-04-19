---
layout: post
title: "VMPlayer에 RedHat9.0 설치"
date: 2007-09-16 21:11:00 +0900
categories: blog
tags: 컴퓨터
---

학교에서 진행하는 시스템소프트웨어 설계 및 실습에서 사용하는 운영체제는 무려 레드햇 9이다. 새로 파티션만들기 뭐해서 예전에 등록받았던 VMPlayer를 통해 사용하려고 여기저기 알아봤는데, 생각보다 쉽다.

우선 VMPlayer는 2개의 파일을 필요로하는데, 하드드라이브에 해당하는 vmdk와 가상머신 설정에 해당하는 vmx이다. vmdk는 qemu를 통해 생성이 가능하고 vmx에 대해서는 쉽게 자료를 찾아볼수 있어서 긁어와 붙였다.

vmdk 생성

> qemu-img.exe create -f vmdk redhat.vmdk 4G

vmx 파일 내용
<div class="panel">
<pre>
config.version = "8"
virtualHW.version = "3"
ide0:0.present = "TRUE"
ide0:0.filename = "redhat.vmdk"
memsize = "384"
MemAllowAutoScaleDown = "FALSE"
ide1:0.present = "TRUE"

#ide1:0.fileName = "auto detect"
#ide1:0.deviceType = "cdrom-raw"
#설치후에 위에설정으로 vmx를 변경

ide1:0.fileName = "redhat-install-9-1-i386.iso"
ide1:0.deviceType = "cdrom-image"

ide1:0.autodetect = "TRUE"
floppy0.present = "FALSE"
ethernet0.present = "TRUE"
usb.present = "TRUE"
sound.present = "TRUE"
sound.virtualDev = "es1371"
displayName = "redhat"
guestOS = "redhat"
nvram = "redhat.nvram"
MemTrimRate = "-1"

ide0:0.redo = ""
ethernet0.addressType = "generated"
uuid.location = "56 4d 80 3e f2 32 56 75-44 a6 45 89 2b 4a 03 4b"
uuid.bios = "56 4d 80 3e f2 32 56 75-44 a6 45 89 2b 4a 03 4b"
ethernet0.generatedAddress = "00:0c:29:4a:03:4b"
ethernet0.generatedAddressOffset = "0"

tools.syncTime = "TRUE"
ide1:0.startConnected = "TRUE"
uuid.action = "create"
checkpoint.vmState = ""
tools.remindInstall = "TRUE"

#gui.fullScreenAtPowerOn = "TRUE"

</pre>
</div>

특이한게 레드햇9는 여러장의 cd로 구성되어 있는데, cd교체를 단순히 vmx에서 cd-rom으로 잡았던 ide 이미지 파일 이름과 같게 다음 이미지 파일의 이름을 바꾸는것으로 해결할 수 있었다.

