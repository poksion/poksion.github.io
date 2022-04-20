---
layout: post
title: "#pragma warning( disable / default : 4312 )"
date: 2007-11-23 15:46:00 +0900
author: poksion
categories: blog
tags: 프로그래밍
---

```cpp

HINSTANCE hInstance = (HINSTANCE)GetWindowLongPtr(m_hWnd, GWLP_HINSTANCE);

```

이런종류에서 나타나는 warning을 어떻게 없앨까?

상당히 고민했었는데, Debugging Applications Windows라는 책에서는 #pragma를 사용해서 해결했더라.

```cpp

#pragma warning( disable : 4312 )
HINSTANCE hInstance = (HINSTANCE)GetWindowLongPtr(m_hWnd, GWLP_HINSTANCE);
#pragma warning( default : 4312 )

```

