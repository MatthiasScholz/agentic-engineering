# Skill Collection

## Tasks

- [ ] Consider writing a flake to easy integration and support skill updates

## Setup

### Workflows

``` sh
# Workflow: https://youtu.be/EJyuu6zlQCg?si=hpk_GTqm_si5sFVs
grill-me -> write-a-prd -> prd-to-issues -> tdd -> improve-codebase-architecture
```



``` sh
# https://www.aihero.dev/5-agent-skills-i-use-every-day
npx skills@latest add mattpocock/skills --skill grill-me --agent opencode --global
npx skills@latest add mattpocock/skills --skill write-a-skill --agent opencode --global
npx skills@latest add mattpocock/skills --skill ubiquitous-language --agent opencode --global
npx skills@latest add mattpocock/skills --skill edit-article --agent opencode --global

# Product Requirements Document (PRD)
npx skills@latest add mattpocock/skills --skill write-a-prd --agent opencode --global
npx skills@latest add mattpocock/skills --skill prd-to-plan --agent opencode --global
npx skills@latest add mattpocock/skills --skill prd-to-issues --agent opencode --global
npx skills@latest add mattpocock/skills --skill triage-issue --agent opencode --global

# Coding
npx skills@latest add mattpocock/skills --skill tdd --agent opencode --global
npx skills@latest add mattpocock/skills --skill improve-codebase-architecture --agent opencode --global
npx skills@latest add mattpocock/skills --skill request-refactor-plan --agent opencode --global
npx skills@latest add mattpocock/skills --skill design-an-interface --agent opencode --global
npx skills@latest add mattpocock/skills --skill qa --agent opencode --global
```


### Obsidian

``` sh
npx skills add https://github.com/kepano/obsidian-skills --skill obsidian-bases --agent opencode --global
npx skills add https://github.com/kepano/obsidian-skills --skill obsidian-markdown --agent opencode --global
npx skills add https://github.com/kepano/obsidian-skills --skill obsidian-cli --agent opencode --global
npx skills add https://github.com/kepano/obsidian-skills --skill json-canvas --agent opencode --global
# FIXME defuddle nix package currently broken 
# npx skills add https://github.com/kepano/obsidian-skills --skill defuddle --agent opencode --global
```

### Googl Workspaces CLI

``` sh
# Install all skill
npx skills add https://github.com/googleworkspace/cli --global --skill '*' --agent opencode
```


## References

- [Skills DB](https://skills.sh)
- [Skills Best Practices](https://platform.claude.com/docs/en/agents-and-tools/agent-skills/best-practices)
- [Google Workspaces CLI Skill Index](https://github.com/googleworkspace/cli/blob/main/docs/skills.md)
