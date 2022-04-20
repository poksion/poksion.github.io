---
layout: post
title: "Epsilon-delta definition of limits"
date: 2014-09-28 21:23:00 +0900
author: poksion
categories: blog
tags: 수학
---

[옛날 블로그 lim\(x->a\)-f\(x\)-equals-L-의-증명](/blog/2008/03/04/lim.html)를 정리하다가 또다시.. 이게 뭔소리인지 가슴이 먹먹해졌다. 대부분 그런 이유는 그때 당시에 아주 살짝만 알고 핵심적인 내용을 파악하지 못해서이다.

이번 기회에 다시한번 정확히 알아보려고 오랫만에 대학 교재들을 둘둘꺼내서 보고, 인터넷 자료들도 찾아 보고 애좀 썼다.

엄밀하지 않은 극한정의는, ```x가 a로 한없이 근접하여 갈때 f(x)가 L로 한없이 근접해 간다``` 이다. 반면에 엄밀한 극한정의란, ```모든 엡실론에 대해 | x - a | < (델타) -> | f(x) - L | < (엡실론)를 만족하는 델타가 있다.```이다.

여기서 아리까리한것이, 왜 모든 엡실론에 대해 델타가 존재하는지를 확인하는 방식으로 증명을 하는지 여부인데, 이것이 전설의 대학 미적분 교재 -지금은 절판되어 구할 수 없는, 학교에서 직접 만든- 에 꽤 그럴듯 하게 설명되어 있다.

<blockquote>
... 극한의 개념에서 중요한것은 f(x)의 값이 L로 한없이 가까워진다는 사실이 아니라 f(x)의 값이 L로부터 그리 멀리 떨어질 수 없다는 것이다. ... 그것은 f(x)의 값이 결국에는 임의로 주어진 작은 범위안에서 머물러야 한다는 것이다. ... 더욱더 작은 범위가 주어진다면, x를 더욱 더 a에 가깝게 할 필요가 있을 것이다. ... 따라서 다음과 같은 극한에 대한 정의에 도달하게 된다.
</blockquote>

즉, 중요한것은 f(x)가 범위안에 존재해야 하고(엡실론) 그것을 만족하는 값(델타)이 존재해야 하므로, 증명 방식이 임의의 (함수값 범위인)엡실론에 대해 델타를 찾는 방식으로 이루어지게 되는 것이다.

<img src="/assets/img/post/legend-univ-textbook.jpg" style="width: 600px;display: block;margin-left: auto;margin-right: auto" />

(사진의 왼쪽이 전설의 대학 교재. 오른쪽이 재수강-_-때 들었던 토마스 아저씨의 Calculus)

덧붙여.. 자료를 찾다보니 칸 아카데미의 극한 수업이 꽤나 괜찮더라. 다음에 생각이 나면 칸 아카데미 수업을 열심히 들어 보아야 겠다.

<div style="width:100%;text-align:center;overflow-x:auto;overflow-y:hidden;white-space: nowrap;display: block;margin-left: auto;margin-right: auto">
<iframe src="http://notisfy-me.appspot.com/arank/content-web?doc=7" height="700" width="100%" onload="autoResize(this)" scrolling="no" frameborder="0" > </iframe>
</div>


