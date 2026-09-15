---
layout: post
title: "XBOX Remote Play와 Lossless Scaling"
date: 2026-09-14 23:23:36 +0900
author: poksion
categories: blog
thumb: /assets/img/post/shortcuts-toggles.png
tags: 게임
---

스팀덱은 여러모로 현세대 게임을 돌리기에는 파워가 많이 부족하다. 그래서 프레임에 많이 부족하게 느껴지면 Lossless Scaling 프로그램(lsfg-vk)을 이용한다. 데쓰 스트랜딩같이 고스팅이 너무 느껴져 사용하지 않는게 더 나은 경우도 있지만, Satisfactory나 Stray등에서는 매우 만족할만한 성능을 뽑아준다.

한동안 Lossless Scaling을 윈도우에서보다는 스팀덱에서 사용했다 - 사실, 윈도우에서 사용을 거의 안했다 - 그 이유는 프로그램 매칭이 잘 안되서 Lossless Scaling을 적용하기가 키보드를 안쓰는 게임 실행환경에서는 어려웠기 때문이다.

(반면에, 스팀덱의 경우에는 lsfg만 실행인자에 넣어주면 될 뿐만 아니라 데키로더 플러그인을 통해 편리하게 설정도 가능하다)

그러다가 문득, 로그엘라이 신형 게임바에도 비슷한 확장이 있지 않을까? 라는 생각이 들어서 찾아보다가. `LS Shortcut Toggle`이라는 확장을 발견했다. 가격도 2000원밖에 안해서 적용을 해보기로 했다.

적용 대상은, 예전부터 해보고 싶었던 XBOX Remote Play. Lossless Scaling (이하 LS)는 적용가능한 범위가 꽤나 넓은데, 그중에서도 동영상에 적용이라는 희한한 기능이 있다. 내 XBOX는 시리즈S라서 30프레임만 지원하는 게임들이 꽤 되는데, 이걸 리모트 플레이로 로그 엘라이에서 하면 동영상으로 인식이 될꺼고, 그러면 LS도 지원이 되지 않을까 하는 생각이었다.

(사실, LS의 활용중에 클라우드 게임에 활용하는 것은 널리 알려진 방법이었다)

준비를 마치고 게임바 확장에서 LS Shortcut Toggle을 실행했는데.. 오..! 의외로 잘 작동한다. 기존에 30프레임으로 차라리 UMPC에 설치해서 플레이 하는게 낫겠다는 생각이 들었던 호그와트 레거시 (그러나 막상 UMPC에서 돌리면 렉이 너무 걸려 플레이 하기 힘들었다)가 꽤나 부드럽게 돌아가고, no performance모드에 90% flow로 고스팅도 마블 미드나잇 선즈의 인라인 FG정도 밖에 안되 보였다.

<div align="center"><img src="/assets/img/post/ls-setting.png"/></div>
<br/>
그런데, 이 LS Shortcut Toggle이 프로파일링이라 그런게 아니라, 그냥 냅다 Ctrl + Alt + S 단축키를 뿌려주는 확장이었다. 그래서 그러면, 차라리 키보드 단축키를 뿌려주는 확장을 설치하는게 낫지 않을까 하고 찾아보니.. 같은 AGMStudio의 `Shortcuts Toggles`이라는 확장이 존재했다. 중복구매 같아서 약간 빡쳤지만... 그래도 가격이 2000원대라 이 제품을 추가 구매하고 다른 단축키도 등록해서 사용하고 있다.

<div align="center"><img src="/assets/img/post/shortcuts-toggles.png"/></div>
<br/>
어쨌든, LS와 Gamebar Extension 그리고 XBOX Remote Play를 연동해서 XBOX Series S의 30프레임 게임들을 60 프레임처럼 돌릴수 있게 되었다.

참고로, XBOX Remote Play 같은 경우는 Better xCloud를 통해 엣지 웹브라우져로 실행을 하고 있는데, 이게 사용해본 방법중에 화질이 가장 마음에 들었다. 콘솔 아이디를 포함한 URL을 엣지 웹앱으로 만들면 바로 실행이 가능하고, 엣지 웹앱의 경우에는 로그 엘라이가 다른 프로그램으로 인지를 해서 게임 프로파일을 따로 부과할 수 있다. 즉, 엣지는 데스크탑 프로파일을 쓰지만, XBOX Remote Play 웹앱은 게임 프르파일을 등록할 수 있다.
