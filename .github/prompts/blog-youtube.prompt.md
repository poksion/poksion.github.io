---
description: "Insert a YouTube iframe embed block into the currently edited blog file"
name: "Insert Blog YouTube"
argument-hint: "YouTube embed URL을 입력하세요"
agent: "agent"
---

Insert a YouTube iframe embed block into the file currently open in the editor, using the argument provided after `/blog-youtube` as the iframe `src` value.

Rules:
- Treat the full text after `/blog-youtube` as the URL argument, trimming leading and trailing whitespace.
- If the URL argument is empty, ask the user to provide a URL and do not edit the file.
- Insert this exact block at the current cursor position:

```html
<div class="video-container">
  <iframe src="URL" frameborder="0" width="480" height="390"></iframe>
</div>
```

- Replace only `URL` with the trimmed argument. Do not alter, reformat, or overwrite surrounding content.
- Keep the existing indentation and add no explanatory text to the file.
- After insertion, briefly report that the block was inserted and mention the current file path.
- Do not run an additional validation step after insertion.

URL argument:
$ARGUMENTS
