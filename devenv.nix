{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

{
  # https://devenv.sh/packages/
  packages = [ pkgs.nodejs ];

  # Main install script
  scripts.install-skills.exec = ''
    install-skills-skills
    install-skills-obsidian
    install-skills-mattpocock
    install-skills-mitsuhiko
  '';

  scripts.install-skills-skills.exec = ''
    export REPO="charon-fan/agent-playbook"

    helper-skills $REPO self-improving-agent
  '';

  scripts.install-skills-gwp.exec = ''
    install-skills googleworkspace/cli "*"
  '';

  scripts.install-skills-obsidian.exec = ''
    export REPO="kepano/obsidian-skills"

    helper-skills $REPO obsidian-bases
    helper-skills $REPO obsidian-markdown
    helper-skills $REPO obsidian-cli
    helper-skills $REPO json-canvas

    helper-skills $REPO defuddle
  '';

  # FIXME skills have been refactored
  # https://github.com/mattpocock/skills/commit/71542f9d1cc45dc9c84c99e43d6c6bcc4fc523d7
  # https://www.aihero.dev/5-agent-skills-i-use-every-day
  scripts.install-skills-mattpocock.exec = ''
    export REPO="mattpocock/skills"

    # General
    helper-skills $REPO grill-me
    helper-skills $REPO grill-with-docs
    helper-skills $REPO write-a-skill
    # deprecated helper-skills $REPO ubiquitous-language
    helper-skills $REPO edit-article
    helper-skills $REPO teach
    helper-skills $REPO caveman

    # Planing Work
    # Product Requirements Document (PRD)
    helper-skills $REPO write-a-prd
    helper-skills $REPO prd-to-plan
    helper-skills $REPO prd-to-issues
    # deprecated helper-skills $REPO triage-issue
    helper-skills $REPO to-prd
    helper-skills $REPO to-issues
    helper-skills $REPO diagnose
    helper-skills $REPO triage

    # Coding
    helper-skills $REPO tdd
    helper-skills $REPO improve-codebase-architecture
    # deprecated helper-skills $REPO request-refactor-plan
    helper-skills $REPO design-an-interface
    # deprecated helper-skills $REPO qa
    helper-skills $REPO handoff
    helper-skills $REPO prototype
    helper-skills $REPO zoom-out
  '';

  # NOTE WIP untested
  scripts.install-skills-understand.exec = ''
    export REPO="lum1104/understand-anything"

    helper-skills $REPO understand
    helper-skills $REPO understand-chat
    helper-skills $REPO understand-onboard
    helper-skills $REPO understand-diff
    helper-skills $REPO understand-dashboard
    helper-skills $REPO understand-explain
  '';

  scripts.install-skills-gitai.exec = ''
    export REPO="git-ai-project/git-ai"

    helper-skills $REPO prompt-analysis
    helper-skills $REPO git-ai-search
  '';

  scripts.install-skills-mitsuhiko.exec = ''
    export REPO="mitsuhiko/agent-stuff"

    helper-skills $REPO commit
    helper-skills $REPO github
    # NOTE naming collision with pi-web-search built-in skill -> renamed to git-mirror
    # helper-skills $REPO librarian
    helper-skills $REPO mermaid
    helper-skills $REPO native-web-search
    helper-skills $REPO openscad
    helper-skills $REPO summarize
    helper-skills $REPO uv
    helper-skills $REPO web-browser
  '';

  scripts.install-skills-badlogic.exec = ''
    export REPO="badlogic/pi-skills"

    helper-skills $REPO browser-tools
  '';

  scripts.install-skills-devenv.exec = ''
    export REPO="kissgyorgy/coding-agents"

    helper-skills $REPO devenv
  '';

  scripts.install-skills-webfrontend.exec = ''
    export REPO="sveltejs/ai-tools"

    helper-skills $REPO svelte-code-writer
    helper-skills $REPO svelte-core-bestpractices

    export REPO="ejirocodes/agent-skills"
    helper-skills $REPO svelte5-best-practices
  '';

  # Helper script to call skills.sh tool.
  # Installs into ~/.agents/skills
  # $1: repository
  # $2: skill name
  scripts.helper-skills.exec = ''
    npx skills@latest add $1 --skill $2 --global --agent opencode
  '';

  enterShell = ''
    devenv info
  '';

  # https://devenv.sh/tasks/
  # tasks = {
  #   "myproj:setup".exec = "mytool build";
  #   "devenv:enterShell".after = [ "myproj:setup" ];
  # };

  # https://devenv.sh/tests/
  enterTest = ''
    echo "Running tests"
    git --version | grep --color=auto "${pkgs.git.version}"
  '';

  # https://devenv.sh/git-hooks/
  # git-hooks.hooks.shellcheck.enable = true;

  # See full reference at https://devenv.sh/reference/options/
}
