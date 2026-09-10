---
description: "Create a new Jekyll blog post draft in _draft from a title"
name: "Create Blog Draft"
argument-hint: "제목을 입력하세요"
agent: "agent"
---

Create a new Jekyll blog post draft in this workspace from the title provided after `/blog-draft`.

Rules:
- Before creating the file, use this PowerShell command as the default time check: `[TimeZoneInfo]::ConvertTimeBySystemTimeZoneId([DateTimeOffset]::UtcNow, 'Korea Standard Time').ToString('yyyy-MM-dd HH:mm:ss zzz')`.
- Use the resulting current date and time in the `Asia/Seoul` timezone for the frontmatter `date`, formatted as `YYYY-MM-DD HH:MM:SS +0900`.
- Create the file at `_draft/YYYY-MM-DD-slug.md`.
- Build `slug` from the title by trimming whitespace, converting spaces to hyphens, and removing characters that are unsafe in a filename. Preserve Korean letters, English letters, numbers, and hyphens.
- If a file with the same path already exists, overwrite it.
- Use the title exactly as provided, trimmed, in the frontmatter title value and quote it.
- Create exactly this frontmatter, leaving optional fields empty:

```yaml
---
layout: post
title: "<title>"
date: YYYY-MM-DD HH:MM:SS +0900
author: poksion
categories: blog
thumb:
tags:
---
```

- Leave one blank line after the closing `---` and no other body content.
- After creating the file, report its workspace-relative path without running an additional validation step.

Title argument:
$ARGUMENTS
