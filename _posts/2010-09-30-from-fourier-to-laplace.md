---
layout: post
title: "From Fourier Series to Laplace Transform"
date: 2010-09-30 02:30:00 +0900
author: poksion
categories: blog
tags: 수학  흥미
---

회사에서 느긋하게 하고 있는 장-_-기 스터디 책 중 하나가 [Physically Based Rendering](http://www.amazon.com/Physically-Based-Rendering-Implementation-Interactive/dp/012553180X) 이다. C+ 맞은 [Signals and Systems](http://www.amazon.com/Signals-Systems-Analysis-Through-Linear/dp/0072930446/ref=sr_1_10?s=books&ie=UTF8&qid=1285780238&sr=1-10) 책을 뒤적여가며 Fourier Analaysis를 다시 살펴본 이유가 이책의 Chapter 7에서 Sampling 과 Reconstruction에 대해 다루고 있기 때문이다.

학교 텀프로젝트로 SSAO를 다루었을때 그냥 생각없이 노이즈 텍스쳐를 이용한 샘플링을 했었는데, 이책은 내가 생각한것 보다 샘플링을 중요하게 다루고 있었고, 많은 이론들을 설명해 놓고 있다.

같이 공부하는 분께 배우고 얻은게 많아 이쪽은 내가 한번 준비해보자라는 생각으로 시작했는데 끝날 기미가 보이지 않는다. 의외로 공부하고 준비하는데 시간도 걸려서 정리 안해두면 들인 노력 날릴꺼 같아 정리해보기로 했다.

일단 공부의 범위를 퓨리에 시리즈 ~ 라플라스 트랜스폼으로 하려고 생각하고 있고, 현재 Fourier Transform Pairs 까지 공부를 해논 상태다. 목차를 한번 짜보면,

<div class="panel"><pre>
1. Fourier Series(FS) : 직관(;;)으로부터 함수를 Harmonic series 꼴로 나타내기, x(t)↔X[k] 유도
2. Fourier Transform(FT) : FS와 직관(;;;;)을 써서 FS의 '주기'한계 극복(주기 T0 를 무한대로..)
   - X(f)의 정의와 x(t)와의 관계
3. Fourier Transform pairs : 특히 Dirac delta function, Shah function 을 이해하고 FT와의 관계

----기서부터는 앞으로 할것 
4. Convolution and FT Properties
5. Integral Transform / Kernel fuction (nucles of transform) / Laplace Transform
6. Convolution and Laplace transform / Laplace transform pairs
7. Solving ODE using Laplace transform
</pre></div>

적어놓고 보니 아직 반도 안했네... Chapter 7을 기웃거린것도 벌써 한달이 넘은거 같은데.. (물론 중간에 다른 스터디도 했었고 클베도 있었고 바뻤고.. 그랬었다.)

처음에 시작했을때 의욕적-_-으로 제작했던 프레젠테이션 자료. 사실 LaTeX을 배운답시고 삽질해서 내용이 그렇게 풍부하지는 않지만, FS로부터 차근히 접근하면 알수있어요~ 라는 메시지를 전달하기에 충분했다고 자평하고 있다.

시간이 날때마다 차근차근 정리해야겠다.

