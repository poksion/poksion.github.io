---
layout: post
title: "Robot, OpenCV and Sensor Networking"
date: 2007-11-22 01:59:00 +0900
categories: blog
tags: 일상이야기  컴퓨터
---

교수님께서 학교를 어떻게 구워삶으셨는지는 모르겠지만, 진행중인 지능로봇의 입문이라는 과목에서 레고 마인드스톰 NXT / 블루투스 동글 / 무선 카메라 일체를 실습교재로 제공해주고 그와 관련된 수업을 진행한다. 그중에서 인상깊은것들이 OpenCV를 이용한 vision 처리(쉽게 말해, 로봇의 눈) 과 블루투스를 이용한 Sensor Networking(이것도 쉽게 말해, 로봇을 제어하기 위한 네트워크) 이다.

수업시간시간에 제공해준 VisionNXT라는 프레임워크가 블루투스와 NXT를 연결해주는 작업이라든가, 입력 비디오 화면이나 Vision 함수 화면을 프로그램상에 출력해준다든가의 작업들을 다 해주기 때문에, 실제로 구현해야될 사항은 상황에 맞는 Vision처리 쓰레드를 OpenCV를 활용하여 만들고, 센서 객체를 이용해 NXT에게 명령을 내리는 쓰레드를 작성하는 것뿐이다. 물론, VisionNXT 프레임워크의 풀소스가 제공되어서 블루투스와 COM 시리얼 포트를 어떻게 C 프로그램에 엮는지, 비디오 디바이스를 어떻게 OpenCV에 엮는지등도 공부할수 있다.
(사실 프레임워크가 잘 만들어져서 꽤나 감탄하고 있었는데, 부분부분 일본어가 섞여 있는걸 보면 자체제작한건 아닌가보다. 어쨌든, 이런 좋은 프레임워크를 소개해준것만으로 고마운 일이다.)

-_- 블로그질 러시로 대충 짐작했겠지만, 내일 - 아니, 오늘이군... - 시험에 따른 '뻘짓뻘짓 능력'이 발휘되어, 숙제로 제출했던 로봇의 동작 동영상을 다음에 올리고 이렇게 블로그에도 자취를 남겨본다. (2차 중간고사가 왠말이냐! 네트워크 수업 교수님은 각성하라! 각성하라! ....잇힝~)

아래의 동영상은 비디오 디바이스로부터 입력받은 이미지를 OpenCV를 이용해 편집하여 빨간색 공만을 유효물체로 판단하게한 장면. 노트북에서 실행중인 VisionNXT의 오른쪽 상당화면이 로봇의 입력이 될 '처리된 Vision' 영상인데, 다른것은 다 까맣고 빨간공에만 해당하는 부분이 하얗게 나오고 그것의 중심이 빨간커서로 타겟팅 되어있다. 그리고 빨간공을 움직여서, Vision 함수가 제대로 동작하고 있는것을 확인하고 있다.

<object type='application/x-shockwave-flash' width="402" height="324" align='middle' classid='clsid:d27cdb6e-ae6d-11cf-96b8-444553540000' codebase='http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0'><param name='movie' value='http://flvs.daum.net/flvPlayer.swf?vid=e1NTNkHS9Os$' /><param name='allowScriptAccess' value='never' /><param name='allowFullScreen' value='false' /><embed src='http://flvs.daum.net/flvPlayer.swf?vid=e1NTNkHS9Os$' width="402" height="324" allowScriptAccess='never' type='application/x-shockwave-flash' allowFullScreen='false'></embed></object> <br /><br />
 

다음이 실제로 NXT Control Thread를 동작시켜서 로봇을 움직이는 장면.

<object codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0" type="application/x-shockwave-flash" classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" align="middle" height="324" width="402"><param name="_cx" value="10636"><param name="_cy" value="8573"><param name="FlashVars" value=""><param name="Movie" value="http://flvs.daum.net/flvPlayer.swf?vid=QyY_CvLm_K0$"><param name="Src" value="http://flvs.daum.net/flvPlayer.swf?vid=QyY_CvLm_K0$"><param name="WMode" value="Window"><param name="Play" value="-1"><param name="Loop" value="-1"><param name="Quality" value="High"><param name="SAlign" value=""><param name="Menu" value="-1"><param name="Base" value=""><param name="AllowScriptAccess" value="always"><param name="Scale" value="ShowAll"><param name="DeviceFont" value="0"><param name="EmbedMovie" value="0"><param name="BGColor" value=""><param name="SWRemote" value=""><param name="MovieData" value=""><param name="SeamlessTabbing" value="1"><param name="Profile" value="0"><param name="ProfileAddress" value=""><param name="ProfilePort" value="0"><param name="AllowNetworking" value="all"><param name="AllowFullScreen" value="true">
<embed loop="true" menu="false" quality="high"  width="402" height="324"  type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" src="http://flvs.daum.net/flvPlayer.swf?vid=QyY_CvLm_K0$"></embed></object><br />
(동영상내 뻘짓 음성은 무시해주세요~ -_-)

뭐.. 전체적인 감상을 해보자면,

 1. VisionNXT. 잘만들어졌다.
 2. 블루투스도 꽤나 잘만들어졌고, 시리얼포트를 타고 올라가는게 참으로 마음에 든다. 그것때문에 프로그래밍하기 쉬었다. 이러한 장점때문에, 센서네트워킹에서 블루투스가 대세가 될수 있겠다는 생각을 했다.
 3. OpenCV. 요거 진짜 물건이다.

로봇제어는 재미있다. 여유가 되면, 요런 장난감하나 장만하고 싶다.(-_-워이~ 지름신)

그나저나.. 오늘 시험 어쩐다냐... 아직도 뻘짓이 성에 안차는데.... 흠냐..

