---
layout: post
title: "Chocoratey - Node/Ruby/Python 개발환경"
date: 2025-11-05 17:15:00 +0900
author: poksion
categories: blog
tags: 컴퓨터 프로그래밍
---

이전 Rog Ally에는 Scoop으로 개발환경을 꾸몄었는데, 여러 개발툴들과 도구들을 설치하다보니, 대부분이 chocoratey 기준으로 설명이 되어 있어서, 다시 chocoratey로 복귀했다. chocoratey에서 scoop으로 전환할때

1. node나 ruby, python처럼 독자적으로 큰 개발환경들은 각각 홈페이지에서 다운받아 진행하려고 했다. 그런데 node는 자체적으로 chocoratey를 설치하는등, 설치과정이 매끄럽지 않았다. Ruby의 one click 인스톨러도 dev-kit 대신에 ridk를 이용해 관련 native 확장 컴파일 도구들을 설치했는데, 그때는 chocoratey의 msys2와 통합이 가능할꺼라 생각을 못하고 chocoratey용과 ruby용 msys2를 각각 가져갔고, 그럴바에는 간단한 scoop이 낳겠다는 생각을 했다.

2. 관심있는 프로젝트중에 Godot 엔진이 있는데, 여기서 scoop기반의 mingw 시스템을 사용하여 Scons를 활용하는 방법이 설명되어 있었고, 간편해보였다.

3. 대부분의 오픈소스 프로젝트들은 Portable binary를 제공하는데, 이러한것들은 chocoratey와 scoop 같은 패키지 관리툴을 사용하지 않고 직접 다운로드 받아 관리하는게 편리하다고 생각했다.

그러다가 다시 chocoratey로 돌아온 결정적 이유는 앞에서 말한것 처럼 많은 페이지에서 chocoratey 기준으로 개발환경을 설명한것이기 때문인데, 예를들면 react native 개발환경은 다음처럼 설명되어 있다.

<div align="center">
    <img src="/assets/img/post/react-native-choco.png" />
</div>
<br/>

뿐만아니라, PrismLaucher 같은 경우, 업데이트가 자주되는 편이고, 기존 버전이 동작을 안하는 경우들이 종종 있었는데, 직접 다운로드 해서 설치한 경우는 설치가 번거로웠다. 그래서 패키지 매니저를 이용하는것이 편리하다고 생각을 했고, 그렇다면 많은 프로그램을 지원하는 chocoratey가 scoop보다 나을것 같았다. 그리고 여러 개발환경들 - node / ruby / python 의 경우 chocoratey와 공존할수 있는 여러 방법들이 있었다.

chocoratey로 환경을 설정하면서 몇가지 원칙을 정했다.

1. choco 명령은 admin 계정으로 실행한다. 별다른 이유는 아니고, react native 설명에서 그렇게 되어 있던게 가장 컸고, 대부분 다른 사용자들도 choco는 admin으로 실행하는것 같다.

2. 주 c++ 컴파일러는 vsbuild tool 2022 버전으로 하고, ruby 빌드툴은 choco를 통해 설치한 msys2를 이용해 ridk가 설치한 MinGW (C:\tools\msys64\ucrt64\bin 쪽에 설치해 주더라)를 사용했다. cmake나 scons같은 대부분의 빌드툴들이 vsbuild tool을 잘 설정해줘서 vsbuild tools를 메인으로 쓰기에 큰 문제 없었다. (간단한 Code Run 같은 경우에는 msys2 빌드툴 사용)

3. Python은 choco로 global용 python도 설치하고, 역시 choco로 anaconda도 설치. Python은 pip이 wheel을 통해서 바이너리 패키지를 잘 설치해서 따로 빌드툴을 설정할 필요가 없었다.

4. npm, gem, pip은 choco와 다르게 유저 퍼미션으로 실행.

가장 놀랐던건, vsbuild tools를 cmake와 scons이 너무 잘 설정해준부분이다. Godot에서 scons을 이용해서, 현재 github의 master 브랜치를 오류 하나 없이 빌드할 수 있었고, vscode cmake 확장 또한 vsbuild tool 환경을 잘 읽어와서 아무런 문제없이 빌드 할 수 있었다. (물론, BOM이 없는 utf-8 지원을 위한 cmake 플래그설정과 윈도 콘솔에서 utf-8출력을 잘 하기 위한 설정등이 필요하긴 했다. 이건 나중에 한번 자세히 다뤄보려 한다)

참고로, react native는 내부적으로 안드로이드 sdk의 ninjan시스템을 사용하는데, 윈도우 시스템의 파일 이름 글자수 제한때문에 해줘야하 하는일들이 있다. 네이티브 빌드의 타겟이 arm이기 때문에 안드로이드 sdk는 네이티브 빌드시스템을 아예 포함하고 있는데, 개발 설정에 고민을 덜 해도 되어서 괜찮은 전략인것 같다.