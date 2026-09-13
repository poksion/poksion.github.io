---
description: "Insert a left-aligned book image block using the selected image URL"
name: "Insert Blog Book Image"
argument-hint: "이미지 URL을 선택하거나 입력하세요"
agent: "agent"
---

Insert a left-aligned book image block into the file currently open in the editor. When the injected editor selection below is non-empty, use it as the image URL; otherwise, use the argument provided after `/blog-book`.

Rules:
- The current editor selection is:

${selection}

- If the injected selection is non-empty, use it as the URL argument and ignore any text after `/blog-book`.
- Otherwise, treat the full text after `/blog-book` as the URL argument, trimming leading and trailing whitespace.
- If the URL argument is empty, ask the user to select or provide an image URL and do not edit the file.
- Insert this exact block at the current cursor position:

```html
<div class="imageblock left" style="float: left; margin-right: 10px;"><img src="URL" style="height: 200px;"></div>
```

- Replace only `URL` with the trimmed argument. Do not alter, reformat, or overwrite surrounding content.
- Keep the existing indentation and add no explanatory text to the file.
- After insertion, briefly report that the book image block was inserted and mention the current file path.
- Do not run an additional validation step after insertion.

URL argument:
$ARGUMENTS
