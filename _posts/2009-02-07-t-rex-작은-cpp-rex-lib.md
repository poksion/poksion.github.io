---
layout: post
title: "T-Rex : 작은 C++ 정규표현식 라이브러리"
date: 2009-02-07 21:25:00 +0900
author: poksion
categories: blog
tags: 프로그래밍
---

C++에서 C# 형태의 스트링 포메팅을 지원하는 로거를 만들다보니 정규표현식을 지원하는 라이브러리가 필요하게 되었다. 유명한 boost 에 정규표현식 지원 라이브러리가 있었지만 여러프로젝트의 기반이 되는 프로젝트에 포함시킬 생각이어서 코드상태로 프로젝트에 포함될정도 작아야했다.

sf에서 뒤지다가 딱 필요한 정도의 기능만 구현되어 있는 [t-rex](http://sourceforge.net/projects/tiny-rex/)라는 라이브러리를 발견했다. zlib 라이센스에 파일도 헤더파일, cpp파일 2개만 있으면 쓸수 있을정도로 작았고 사용방법도 아주 간단했다.

세미콜론에 비교적 안정적인 path splitter(앞뒤로 세미콜론이 있을수 있고, 세미콜론사이에 여러개의 세미콜론이 들어가도 분리가능하고 맨 끝은 세미콜론이 없어도 나누어줄수 있는) 를 요 라이브러리로 구현하면 다음과 같다.

```cpp

std::vector< std::string > vecSplittedPath;

const char* pSzContents = ";;/usr;;/opt/lib;/sbin;;/etc";
const char* pSzError = 0;
const char* pSzPattern = "[^;]+";
TRex* pRex = trex_compile(pSzPattern, &pSzError);
if(pRex)
{
    const char *pSzBegin,*pSzEnd;
    while(trex_search(pRex, pSzContents, &pSzBegin, &pSzEnd) )
    {
        TRexMatch match;
        trex_getsubexp(pRex,0,&match);
        vecSplittedPath.push_back( std::string(match.begin, match.len) );

        pSzContents = pSzEnd;
    }
}
trex_free(pRex);

```

