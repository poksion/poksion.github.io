---
layout: post
title: "github-pages 마이그레이션"
date: 2025-11-03 11:07:00 +0900
author: poksion
categories: blog
tags: 일상이야기 프로그래밍
---

메인 PC로 사용하고 있는 Rog Ally의 SSD를 2TB로 업그레이드 했다. SSD가격이 2년전에 비해 전혀 떨어지지 않고 (오히려 올랐다) 2~3년간 더 사용할 생각을 하니 가능하면 빠르게 2TB로 업그레이드 하는게 좋을것 같아서 귀찮음을 무릅쓰고 추석 연휴 후에 진행을 했다.

SSD 업그레이드를 진행하면서 기존 개발환경을 리뉴얼했다. (SCOOP을 사용했었는데 다시 Chocoratey로 돌아왔다. 자세한 내용은 따로 블로그 포스팅을 해보려고 한다.) Chocoratey도 2년간 많이 성숙되어서 기존에 복잡하게 꼬여있던 Node GYP과 Ruby development kit등이 잘 정리가 되어있었다.

그런데 막상 github page에 jekyll을 실행하려고 하니 현재의 jekyll 버전과 github page 배포를 위해 설정해두었던 github-pages가 설치하는 라이브러리들 사이에 충돌이 발생해서 나를 힘들게 했다. 문득, github-pages와 jekyll의 차이가 뭔지 궁금해졌다.

웹에서 내용을 좀 찾아보니, github page에 deoply하는 방식을 Github Action으로 바꾸면 더이상 github-pages가 필요없다는 도큐먼트를 발견했다. 그래서 github pages gem을 삭제하고 배포를 Github Actions를 하도록 수정중이다.

<div align="center">
    <img src="/assets/img/post/github-pages-to-github-actions.png" width="600px"/>
    <img src="/assets/img/post/github-pages-to-github-actions-settings.png" width="600px"/> 
</div>
<br/>

내용은 굉장히 간단하다.
 - Gemfile에서 github-pages를 지우고 표준 jekyll 페이지로 의존성을 구성하고, 로컬에서 테스트해본다.
 - Github repository 설정에서 기존의 github-pages를 Github Actions로 바꾼다. 그러면 자동으로 Jekyll을 탐지한다.

2023년에 블로그를 쓴지 거의 2년만에 새로 포스팅하는 블로그이다. 사실 <a href="https://th-family.tistory.com/">가족블로그</a>를 만들어서 그곳에 블로그를 올리느라 신경을 못쓴것도 있는데, 아무래도 markdown 형식으로 정리하는 블로그가 더 간편하고 오래지속되는 면이 있어서 두개의 블로그를 같이 운영하려고 한다. 그래서.. 다시금 블로그를 열심히 써보는것을 다짐해본다.