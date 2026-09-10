---
description: "Insert a centered blog image into the currently edited blog file"
name: "Insert Blog Image"
argument-hint: "이미지 URL을 입력하세요"
agent: "agent"
---

Insert a centered image HTML block into the file currently open in the editor. When the injected editor selection below is non-empty, run this command as if the user had invoked `/blog-img selected-text`; otherwise, use the argument provided after `/blog-img` as the image `src` value.

Rules:
- The current editor selection is:

${selection}

- If the injected selection is non-empty, use it as the URL argument and ignore any text after `/blog-img`.
- Otherwise, treat the full text after `/blog-img` as the URL argument, trimming leading and trailing whitespace.
- If the URL argument is empty, ask the user to provide a URL and do not edit the file.
- Insert this exact block at the current cursor position:

```html
<div align="center"><img src="URL"/></div>
<br/>
```

- Replace only `URL` with the trimmed argument. Do not alter, reformat, or overwrite surrounding content.
- Keep the existing indentation and add no explanatory text to the file.
- After insertion, briefly report that the image block was inserted and mention the current file path.
- Do not run an additional validation step after insertion.

URL argument:
$ARGUMENTS
