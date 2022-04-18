---
layout: post
title: "Octave in Vista"
date: 2009-10-09 22:48:00 +0900
categories: blog
tags: 컴퓨터
---

Octave(이하 옥타브)는 Matlab에 대응하는 오픈소스 프로그램이다.

최근 학교에서 Matlab을 이용한 수치해석이나 확률과정 개론을 배운다. 그런데 Matlab은 고가의 소프트웨어라서 집에서는 오픈소스 프로그램인 옥타브를 사용한다.

이 글은 3.2 버전에 맞춰 작성되었다. 옥타브 3.0버전에서 고민하던 문제들이 3.2버전에서 단박에 풀려서 3.2버전을 사용하기를 강력히 추천한다.

먼저 옥타브는 커맨드라인 프로그램이다. 그래서 옥타브가 아쉽다기보다는 윈도용 커맨드라인 환경이 아쉬운 경우가 종종있다. 가장 아쉬웠던것은 글꼴이었고, 옥타브 3.0버전에서는 '삐'거리던 스피커음도 불만이었다.

먼저 커맨드라인 글꼴바꾸기
> http://smallvoid.com/article/winnt-cmd-add-font.html

내경우에는 HKEY_LOCAL_MACHINE \SOFTWARE \Microsoft \Windows NT \CurrentVersion \Console \TrueTypeFont 에서 나눔코딩고딕을 콘솔 폰트로 설정해서 사용하고 있다.

그리고 커맨드라인에서 PC스피커 (bell service) 끄는 방법.
> http://superuser.com/questions/10575/turning-off-the-cmd-window-beep-sound

커맨드라인에서 벨을 끄는 방법은 여러가지 있는데 내가 사용했던 방법은 아래와 같다.
> net start beep

그런데 이것은 재부팅때마다 재설정을 해야했고, 다음은 재부팅마다 재설정을 할 필요가 없게 만드는 커맨드다.
> sc config beep start= disabled

이 방법 말고도 '장치관리자'를 통해 beep 을 제거하는 방법이 있다. 제어판의 장치관리자를 실행한후에 보기 - 숨김 장치 표시 를 해서 beep 장치를 '사용안함'으로 설정하는 방식이다.

다행히도 옥타브 3.2버전의 less는 '삐'거리는 소리 대신에 윈도 효과음을 사용하고 그것도 똑똑히 사용해서 더이상 저 설정이 필요없게 되었다.

나는 cygwin의 bin 디렉토리에 path가 걸려있어서 자주사용하는 프로그램들은 그곳에 배치스크립트를 작성해 넣어둔다. 옥타브의 경우는 cygwin/bin/octave.bat 파일로 넣어두어사용하며 그 내용은 다음과 같다.

```
cd C:\Users\pok\Documents\workspace\Octave
"C:\Octave\3.2.2_gcc-4.3.0\bin\octave-3.2.2.exe"
rem start C:\Users\pok\Documents\Utils\Console2\Console.exe -c C:\Users\pok\Documents\Utils\Console2\console_octave.xml
```

저렇게 하면 내 'workspace'가 pwd(present working directory, current working directory라 하여 cwd라고도 한다)로 설정되어 .m 파일등을 작성할때 편리하다.

아래 주석(rem) 되어 있는것은 cosole2라는 꽤 훌륭한 cmd 대체 프로그램을 이용할때인데, 이놈이 한글입력이 되지 않아 현재는 사용하지 않는다.

3.0버전에서는 사용자 디렉토리 밑에 무조건 'octave'라는 폴더를 만들어버려서 프로그램실행 창에서 'octave'라고 치면 그 디렉토리가 열렸다. 3.2버전에서는 그런만행을 하지 않아 꼭 octave.bat이라고 칠 필요없이 octave라고만 쳐도 되서 편리하다.

다음은 내 local home directory에 있는 .octaverc 파일의 내용.

```
addpath('C:\Users\pok\Documents\workspace\Octave');
edit("EDITOR", "C:\\Users\\pok\\Documents\\Utils\\Vim\\vim72\\gvim.exe %s -c cd C:\\Users\\pok\\Documents\\workspace\\Octave -c \"30vs .\" -c \"wincmd w\"");
edit("HOME", "C:\\Users\\pok\\Documents\\workspace\\Octave");
edit("LICENSE", "BSD");
#set(0,'defaulttextfontname', 'Malgun Gothic');
```

path에 내가 '.m'파일들을 모아놓고 있는 C:\Users\pok\Documents\workspace\Octave 를 추가했고 "EDITOR"에는 주로 사용하는 에디터인 vim 을 .m 파일들을 나열하여 열리게 설정하였다. "LICENSE"는 새로 만드는 .m 함수의 라이센스를 어떤걸로 할건지 여부를 정하는것은 기본은 GPL이고 나는 BSD로 라이센스를 변경했다.

3.0 버전에 plot의 기본글꼴 설정이 구리구리하여 set을 이용하여 기본글꼴을 설정했는데, 3.2버전에서는 wgnuplot에서 설정하고 저장할수 있게 바뀌었다.

