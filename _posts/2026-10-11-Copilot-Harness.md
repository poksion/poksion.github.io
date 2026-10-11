---
layout: post
title: "Copilot Harness"
date: 2026-10-11 17:36:13 +0900
author: poksion
categories: blog
thumb:
tags: 컴퓨터, 프로그래밍
---

Visual Studio Code 가 업데이트 된 후에 스킬도 잘 안먹는것 같고, 수정한 파일을 확인하고 싶은데 그것도 바뀌고.. 뭔가 이전하고 많이 바뀐것 같아서 별로 였다. Copilot에 물어보니, Session Target을 Local 로 설정하면, Local workspace 기준으로 작업을 진행해서 예전과 동일하게 작업을 할것이라 했다.

어떻게 하는지 물었봤더니, 설정에서 Copilot Harness를 끄라고 알려준다
```json
{
    "chat.defaultToCopilotHarness": false,
    "chat.editor.preferCopilotHarness": false
}
```
<br/>
알려준대로 Copilot Harness를 끄니, 예전 환경으로 잘 돌아왔다. 그러다가 Copilot Harness가 뭔지 궁금해졌다.

* [https://microsoft.github.io/mwkorea/copilot/CopilotStudioGitHubCopilotHarness/](https://microsoft.github.io/mwkorea/copilot/CopilotStudioGitHubCopilotHarness/)
* [https://116116.tistory.com/entry/github-copilot-harness-comparison](https://116116.tistory.com/entry/github-copilot-harness-comparison)

보아하니, Long term 작업을 좀더 잘 진행시키기 위해 여러 도구들 (SDK, agent, ...)과 Context를 공유할수 있도록 만든 Github 제공 Harness 인것 같다.

긴 작업을 AI에 맡기는것을 아직은 선호하지 않는 나에게는 필요하지 않는 도구인것 같다. 그런데, 나중에는 dev-env를 팀이나 프로젝트 별로 공유하듯이 harness를 이러식으로 공유하는게 당연히 될것 같다는 생각이 든다.

AI가 좋아지면서 기존 Skill이나 harness들이 쓸모 없어진다는 느낌을 많이 받고 있는데, '이건 다르다'라는것 느낌이, Opus4.6에서 온것처럼, 여러가지 AI 개발 방법론들도 정리되고 안정화되는 시점이 올것이다. 그때까지는, 각자가 각자의 방법으로 AI dev환경을 꾸미게 될것 같다.

