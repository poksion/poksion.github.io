---
layout: post
title: "poklog version 3"
date: 2014-01-06 13:42:00 +0900
author: poksion
categories: blog
tags: DigitalNomad 일상이야기 컴퓨터
---
웹을 통해 생각을 정리하고 공유해야겠다는 계획은 꽤나 오래전(그러니까.. 거의 7년전이구먼)에 만들어 실천에 옮겼었다. 그때는 위키라는 형식으로 작업물을 기록했었는데, [모니위키](http://kldp.net/projects/moniwiki)를 사용했었다. 현재는 그때의 자료들이 거의 남아있지 않지만, 이것을 poklog version1이라고 불러도 괜찮을것 같다.

2010년 느즈막에 [태터툴즈](http://ko.wikipedia.org/wiki/%ED%83%9C%ED%84%B0%ED%88%B4%EC%A6%88)를 이용한 [블로그](http://poksion.cafe24.com/poklog/)를 시작했다. poklog라는 명칭을 최초로 사용한 이 블로그는 태터툴즈의 편리함때문에 큰 문제없이 2년 가까이 사용을 하였고 발행한 글도 꽤나 많았다. 그런데, 이직한 회사에서 블로그를 정리할 만한 여유가 없었고 설상가상으로 그림 자료를 보관했던 플리커가 야후와 함께 한국시장에서 철수하는 바람에 엉망으로 방치되었다.

poklog version3은 [Digital Nomad](/projects#DigitalNomad)라는, 문서자료를 체계적으로 정리하고자 하는 욕구에 맞춰 새로 개발된 블로그 환경이다. 작성한 글들은 md 파일포맷으로 저장되고 이미지도 모두 클라우드(드롭박스)에 저장된다. 이 파일들과 의미있는 URI를 라우팅하기 편리한 [sinatra](http://www.sinatrarb.com/), 그리고 깔끔하고 반응성있는 웹을 만들수 있는 템플릿인  [Foundation](http://foundation.zurb.com/)을 이용해 렌더링한다 (github상에 ~~[mdblog](https://github.com/poksion/mdblog)~~라는 ~~프로젝트로 공개되어 있다.~~ 하드 코딩된 내용이 많아서 bitbucket의 private으로 변경했다.)

해야할일들이 많은데 그냥 미구현상태로 공개결정!(-_-;;)
해야할 목록은 다음과 같다.

 * ~~blog title을 통해 한페이지 보여주기~~
 * blog에 댓글달기 - twitter 기능 활용
 * ~~blog 하단에 태그 달기~~
 * ~~태그 페이지~~
 * ~~글 보관함 페이지~~
 * ~~생각의 조각 페이지~~
     * 사이드 패널을 구글 사이트 분석도구로 활용하기
 * ~~블로그 내 syntax highlighting (GFM 호환)~~

	```ruby
	require 'rails'
	puts 'helloworld'
	```
	
	<p/>
	
	```cpp
	#include <stdio.h>
	int main(){
		printf("hello_world");
		return 0;
	}
	```

 * ~~구글 사이트분석 추가~~ 및 활용하기

미구현 사항 말고도 version2 이전도 해야해서 할일들은 많지만 오랜만에 재개된 블로그 포스팅에 기분이 좋다. 더욱이 [Foundation](http://foundation.zurb.com/)을 사용해서 그런지 모바일상에서도 잘 보여줘 더 기쁘다. 야호!

