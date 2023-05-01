---
layout: post
title: "Enforce HTTPS"
date: 2023-05-02 08:17:00 +0900
author: poksion
categories: blog
tags: 컴퓨터
---

안드로이드 App은 https를 강제하고 있으며 대부분의 웹페이지가 https 기반으로 바뀐지는 꽤 되었다. HTTP/2의 경우도 빠른 속도를 무기도 대중화되었으며 현세대의 대부분의 웹브라우져는 HTTP/3를 지원한다 (HTTP/2와 HTTP/3에 대한 소개글 - [HTTP/3는 왜 UDP를 선택한 것일까?](https://evan-moon.github.io/2019/10/08/what-is-http3/))

왜인지는 모르겠지만, poksion.net을 웹브라우져에 입력하니 기본으로 http://poksion.net 으로 접속된다. (어쩌면 예전부터 http로 접속되었기 때문에 그랬을 수도 있다) CNAME도 잘 설정했고 DNS의 IP 주소도 github 페이지 주소로 작 작성했음에도 말이다

<div align="center"><img src="/assets/img/post/blueweb-cname-ip.png" /></div>
<br/>

http로 접속한 사용자를 https로 유도하기 위한 github pages 옵션이 있는데 그 옵션이 이름이 `Enforce HTTPS` 이다

<div align="center"><img src="/assets/img/post/enforce-https.png" /></div>
<br/>

기존에는 github pages가 http만 제공했었던것 같다. https로 변경할때 필요한 절차들이 [Github Pages 개인 도메인도 무료로 HTTPS 지원 시작!](https://blog.gaerae.com/2018/05/github-pages-custom-domains-https.html)에 잘 소개되어 있다.