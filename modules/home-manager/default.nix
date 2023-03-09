{ pkgs, ... }: {
  # Don't change this when you change package input. Leave it alone.
  home.stateVersion = "22.11";
  # specify my home-manager configs
  home.packages = with pkgs; [
    fzf
    curl
    less
    neovim
    iterm2
    vscode
    gitui
    poetry
    teleport
  ];
  home.sessionVariables = {
    PAGER = "less";
    CLICLOLOR = 1;
    EDITOR = "nvim";
  };
  programs.fzf.enable = true;
  programs.fzf.enableZshIntegration = true;
  programs.git.enable = true;
  programs.zsh.enable = true;
  programs.zsh.enableCompletion = true;
  programs.zsh.enableAutosuggestions = true;
  programs.zsh.enableSyntaxHighlighting = true;
  programs.zsh.shellAliases = {
    ls = "ls --color=auto -F";
    nixswitch = "darwin-rebuild switch --flake ~/.nix-config/.#";
    nixup = "pushd ~/.nix-config; nix flake update; nixswitch; popd";
  };
  programs.starship.enable = true;
  programs.starship.enableZshIntegration = true;
  programs.vscode = { 
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      vscodevim.vim 
      ms-azuretools.vscode-docker
      alefragnani.bookmarks
      editorconfig.editorconfig
      golang.go
      ms-python.python
      mvllow.rose-pine
    ];
    userSettings = {
      "editor.fontSize" = 14;
      "editor.fontFamily" = "Meslo";
      "editor.fontLigatures" = true;
      "editor.formatOnSave" = true;
      "telemetry.enableTelemetry" = false;
      "files.autoSave" = "afterDelay";
      "files.autoSaveDelay" = 1000;
      "workbench.colorTheme" = "Rosé Pine";
    };
  };
}
