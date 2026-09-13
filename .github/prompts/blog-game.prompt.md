---
description: "Add a game link or game card for the selected text"
name: "Link Blog Game"
argument-hint: "게임 URL 또는 게임 URL img=이미지 경로를 입력하세요"
agent: "agent"
---

Add a game link or game card for the currently selected text in the file open in the editor.

Rules:
- The current editor selection is:

${selection}

- Treat the text after `/blog-game` as arguments in this form:

```text
URL
```

or:

```text
URL img=IMAGE_URL_OR_PATH
```

- Trim leading and trailing whitespace from the URL and image values.
- If the URL argument is empty, ask the user to provide a URL and do not edit the file.
- If `img=` is present, use the text after `img=` as the image value. Do not include the `img=` prefix in the value.
- If the injected selection is empty, ask the user to select the game title or text that should become the link label and do not edit the file.
- When `img=` is absent, replace only the selected text with this Jekyll game-card include, leaving the `image` value empty:

```liquid
{% include game_card.html url="URL" image = "" title = "selected text" %}
```

- When `img=` is present, replace only the selected text with this Jekyll game-card include:

```liquid
{% include game_card.html url="URL" image = "IMAGE_URL_OR_PATH" title = "selected text" %}
```

- Preserve the selected text exactly, including spacing and punctuation.
- In the game-card form, use the selected text exactly as the `title` value.
- If the selected text is already inside a Markdown link, HTML anchor, or Jekyll game-card include, do not create nested or duplicate markup. Report that no edit was made.
- Use `apply_patch` for the edit and preserve all surrounding content and formatting.
- After editing, briefly report that a game card was inserted and mention the current file path.
- Do not run an additional validation step after insertion.

URL argument:
$ARGUMENTS
