---
description: "Insert a left-aligned image and paragraph block into the currently edited blog file"
name: "Insert Left Blog Image"
argument-hint: "이미지 URL을 입력하세요"
agent: "agent"
---

Insert a left-aligned image and paragraph HTML block into the file currently open in the editor. When the injected editor selection below is non-empty, run this command as if the user had invoked `/blog-img-left selected-text`; otherwise, use the argument provided after `/blog-img-left` as the image `src` value.

Rules:
- The current editor selection is:

${selection}

- If the injected selection is non-empty, use it as the URL argument and ignore any text after `/blog-img-left`.
- Otherwise, treat the full text after `/blog-img-left` as the URL argument, trimming leading and trailing whitespace.
- If the URL argument is empty, ask the user to provide a URL and do not edit the file.
- Insert this exact block at the current cursor position:

```html
<div class="large-12 columns">
    <img src="URL" style="float: left; margin-right: 15px; margin-bottom: 10px;" />
    <p style="word-break: break-all;">
    </p>
</div>
```

- Replace only `URL` with the trimmed argument. Do not alter, reformat, or overwrite surrounding content.
- Keep the existing indentation and add no explanatory text to the file.
- After insertion, briefly report that the left-aligned image block was inserted and mention the current file path.
- Do not run an additional validation step after insertion.

URL argument:
$ARGUMENTS
