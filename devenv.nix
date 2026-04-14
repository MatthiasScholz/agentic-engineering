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

    # NOTE defuddle nix package currently broken
    #helper-skills $REPO defuddle
  '';

  # https://www.aihero.dev/5-agent-skills-i-use-every-day
  scripts.install-skills-mattpocock.exec = ''
    export REPO="mattpocock/skills"

    # General
    helper-skills $REPO grill-me
    helper-skills $REPO write-a-skill
    helper-skills $REPO ubiquitous-language
    helper-skills $REPO edit-article

    # Planing Work
    # Product Requirements Document (PRD)
    helper-skills $REPO write-a-prd
    helper-skills $REPO prd-to-plan
    helper-skills $REPO prd-to-issues
    helper-skills $REPO triage-issue

    # Coding
    helper-skills $REPO tdd
    helper-skills $REPO improve-codebase-architecture
    helper-skills $REPO request-refactor-plan
    helper-skills $REPO design-an-interface
    helper-skills $REPO qa
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
