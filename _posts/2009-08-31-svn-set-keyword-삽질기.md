---
layout: post
title: "svn set:keyword 삽질기"
date: 2009-08-31 01:08:00 +0900
author: poksion
categories: blog
tags: 컴퓨터
---

svn에는 property라는것이 있다. 그중에서 set:keyword property가 있는데 이것을 이용하면 커밋에 대한 정보를 소스파일에 심을 수 있다. 이에 대한 정보들은 상당히 많다.

 * [http://dreamstorm.cafe24.com/cgi-bin/moin.cgi/Subversion](http://dreamstorm.cafe24.com/cgi-bin/moin.cgi/Subversion)
 * [http://my.oops.org/128](http://my.oops.org/128)
 * [TortoiseSVN에서 set:keyword property 설정](http://2bits.com/articles/making-subversionsvn-recognize-cvs-id-and-revision-tags.html)
 * [TortoiseSVN에서 auto property 설정](http://tortoisesvn.net/docs/release/TortoiseSVN_en/tsvn-dug-propertypage.html#tsvn-dug-propertypage-props)
 * [치환 키워드인 $Id$, $Rev$에 대해 자세한 설명이 나와있는 사이트](http://durak.org/sean/pubs/software/version-control-with-subversion-1.6/svn.advanced.props.special.keywords.html)

간단하게 Id keyword만 설정해놓고 $Id$라고 치면, 왠만한 정보는 다 실리는데... 문제는 여기에 나오는 날짜가 Z(Zulu Time - UTC zero time을 기준, 위키페디아참조)라서... 영 못읽어 먹겠더라.

그런데 특이하게도 $LastChangedDate$는 또 local zone을 기준으로 시간을 기록해준다. 여기에 대한 분분한 의견들이 있는데, 어쨌든, $Id$ 시간과 $LastChagnedDate$가 다른 시간을 기록해준다는것은 사실이다.

그래서 그냥 $Id$ 안쓰고 다음과 같이 쪼개 쓰기로 했다.

```cpp
// $LastChangedBy$
// $LastChangedDate$
// $Rev$
```

이것때문에 svn 커밋을 10번가까이 반복했다는...-_-

