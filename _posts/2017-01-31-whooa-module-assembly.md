---
layout: post
title: "WHOOA! Module Assembly"
date: 2017-01-31 15:42:00 +0900
author: poksion
categories: blog
tags: 프로그래밍
---

최근에 열심히 고민했던 내용중에, '안드로이드는 Activity나 Service등이 훌륭히 모듈을 assemble해주므로 복잡한 DI 프레임워크 툴이 불필요하지 않는가' 였다. 여기서 모듈은, Dagger에서 쓰는 모듈 개념을 차용한것이였고 assemble은 gradle task의 assembleXXX 개념을 차용한 것이었다.

최근 이러한 고민과 거의 동일한 주제를 다룬 [마틴 파울러 아저씨의 글](https://www.martinfowler.com/ieeeSoftware/moduleAssembly.pdf)을 발견하였다.

Whooa!

(내가 마틴 파울러 아저씨와 조금이나마 비슷한 생각을 했다는것에 무심결에 나온 감탄사 ㅋㅋ)

Seperating Configuration from Usage
------------------------------------

저 문서를 한줄로 요약하자면,

<div class="panel">
사용과 설정은 나누어야 한다
</div>

라고 할 수 있겠다.

즉, 모듈의 사용이 모듈 본연의 책임이고 어떤 모듈이 실제로 어떠한 구체적인 객체를 사용할지를 선택하는것은 `assembler`의 책임으로 나누도록 한 것이다. 아마도 스프링에서는 assembler 자체를 Spring DI툴이 깔끔하게 제공할것이고, Dagger의 경우에는 Activity/Fragment등에서 Dagger Component (as an Injector / Dagger2)를 호출하는 방식으로 조금은 덜 깔끔하게 assembling이 될것이다.

안드로이드에서 어셈블러
-----------------

이 문서는, 원래 나의 고민이었던 Activity같은 assembler가 명확히 있는 안드로이드에서 복잡한 DI툴이 필요한가를 어느정도 해소해주었다. 결론은 사용에 있어서 복잡한 DI툴이라면, 차라리 Activity 자체에서 Module assemlby를 하는것이 나을 수도 있겠다는것.

모듈 자체의 의존성은, 의존하는것이 명확히 들어나는 Constructor DI를 선호하는 사람이 많다는것도 알게 되었다. 더불어 마틴 아저씨가 IoC에는 Cost가 드니 명백한 이유 없이는 straightforward 방식의 의존성을 선호한다는것도 오래된 [마틴 파울러의 DI](https://martinfowler.com/articles/injection.html) 글에서 찾아볼 수 있었다. - 역시 마틴 아저씨는, 여러 상황을 심도있게 고민하고 솔직하게 표현하는것 같다.

