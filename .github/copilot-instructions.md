# Local Prompt Commands

When a user invokes a slash command such as `/name`, first read the matching local prompt file at `.github/prompts/name.prompt.md` before taking any other action. Follow that prompt's instructions for the request. If no matching prompt file exists, continue with the user's request normally.

For `/blog-img`, when the user has selected text before invoking the command, treat the selected text as the image URL, read `.github/prompts/blog-img.prompt.md`, and apply its insertion rules. This behavior must also be followed when the command is invoked from inline chat.

For every `blog-*` slash command, follow the matching prompt and do not run post-execution validation, builds, linters, or tests unless the user explicitly requests validation.