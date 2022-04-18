---
layout: post
title: "우분투 generic kernel"
date: 2007-02-18 18:08:00 +0900
categories: blog
tags: 컴퓨터
---

컴퓨터를 바꾸고 생각없이 살다가, 불현듯 듀얼코어가 아까워서 커널을 바꾸려고 했다.
리눅스는 smp 지원으로 듀얼코어를 지원한다.
그런데 글들을 읽다보니 이런! 엣지는 기본으로 smp를 지원한단다.
linux-686-smp는 이미 deprecated되었고 기본제공에 smp를 지원한다는것!
오오..

당장 cpuinfo를 cat 해보았다.

```shell
pok@pixub:~$ cat /proc/cpuinfo
processor : 0
vendor_id : GenuineIntel
cpu family : 6
model : 14
model name : Genuine Intel(R) CPU T2300 @ 1.66GHz
stepping : 8
cpu MHz : 1000.000
cache size : 2048 KB
physical id : 0
siblings : 1
core id : 255
cpu cores : 1
fdiv_bug : no
hlt_bug : no
f00f_bug : no
coma_bug : no
fpu : yes
fpu_exception : yes
cpuid level : 10
wp : yes
flags : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe nx constant_tsc pni monitor est tm2 xtpr
bogomips : 3334.50

processor : 1
vendor_id : GenuineIntel
cpu family : 6
model : 14
model name : Genuine Intel(R) CPU T2300 @ 1.66GHz
stepping : 8
cpu MHz : 1000.000
cache size : 2048 KB
physical id : 1
siblings : 1
core id : 255
cpu cores : 1
fdiv_bug : no
hlt_bug : no
f00f_bug : no
coma_bug : no
fpu : yes
fpu_exception : yes
cpuid level : 10
wp : yes
flags : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe nx constant_tsc pni monitor est tm2 xtpr
bogomips : 3329.24

```

오오.. cpu cores 가 0부터 시작하니 두개 맞네.. 그래서 자세히 max frequent 를 때려보았다.

```shell
pok@pixub:~$ cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
1667000
pok@pixub:~$ cat /sys/devices/system/cpu/cpu1/cpufreq/scaling_max_freq
1667000
pok@pixub:~$
```

오오.. 역시 잘 작동하는 구나.

이번에는 uname..

```shell
pok@pixub:~$ uname -a
Linux pixub 2.6.17-11-generic #2 SMP Thu Feb 1 19:52:28 UTC 2007 i686 GNU/Linux
pok@pixub:~$
```

대단하군. 이제까지 컴파일되 있는 커널은 i386이 기본인줄 알았는데, 알아서 686과 smp를 잡아준다. 헐...

