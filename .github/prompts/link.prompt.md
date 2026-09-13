---
description: "Link the selected text to the most appropriate URL"
name: "Link Selected Text"
argument-hint: "링크 대상을 보충 설명할 수 있습니다"
agent: "agent"
---

Add the most appropriate Markdown link to the currently selected text in the file open in the editor.

Rules:
- The current editor selection is:

${selection}

- If the injected selection is empty, do not edit the file. Ask the user to select the text that should become the link label.
- Treat the selected text as the link label. Preserve its exact text, including spacing and punctuation.
- Use the current file, nearby prose, and the workspace as the primary context for determining what the selected text refers to.
- Search the workspace for an existing link to the same subject before choosing a URL. Prefer an existing canonical internal link or an explicitly established external URL over guessing.
- If the selected text refers to a local post or page, prefer the site's existing relative-link convention. If it refers to an external site, use its canonical URL.
- If several URLs are plausible, choose the one with the strongest contextual match. Do not add multiple links or invent a URL without evidence.
- Replace only the selected text with this Markdown form:

```markdown
[selected text](chosen URL)
```

- If the selected text is already inside a Markdown link or HTML anchor, do not create nested markup. Report that no edit was made.
- Use `apply_patch` for the edit and preserve all surrounding content and formatting.
- After editing, briefly report the chosen URL and the current file path. Do not run an additional validation step after insertion.

Additional context supplied after `/link`:
$ARGUMENTS
