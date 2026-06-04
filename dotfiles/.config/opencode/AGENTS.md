# AGENTS.md — Global OpenCode Rules

Personal rules applied across all projects. Project-specific AGENTS.md files
in individual repos take precedence for their specific conventions.

## Communication

- Be concise. Prefer short answers (3-4 lines max) unless detail is requested.
- Focus on the specific task — no preamble, postamble, or explanatory summaries
  unless asked.
- When making changes, follow the existing code style and conventions of the
  project (refer to EditorConfig and project AGENTS.md).

## Verification

Before completing any task, run the project's verification commands if they
exist (check AGENTS.md or package.json for build/lint/test). If none are
defined, at minimum ensure the code is syntactically valid.

## Security

- Never commit secrets, keys, or credentials.
- Never log or expose sensitive information.

## Git

- Only commit when explicitly requested.
- Before committing, review git status and diff to stage only intended files.
- Write concise commit messages matching the repo's style.
- Do not force push, use interactive rebase, or skip hooks unless asked.

## Code Style

- Match the project's existing patterns, libraries, and frameworks.
- Do not add comments unless the code is non-obvious or the user asks for them.
- Prefer editing existing files over creating new ones unless the task
  explicitly requires new files.
