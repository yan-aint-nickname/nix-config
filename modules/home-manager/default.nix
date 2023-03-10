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
    gitui
    poetry
    teleport
    k9s
    vscodium
    jql
    rustup
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
  programs.zsh = {
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "kubectl"];
      theme = "robbyrussell";
    };
  };
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [
      vscodevim.vim 
      ms-azuretools.vscode-docker
      alefragnani.bookmarks
      editorconfig.editorconfig
      golang.go
      rust-lang.rust-analyzer
      ms-python.python
      mvllow.rose-pine
    ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "plantuml";
	publisher = "jebbs";
	version = "2.17.5";
	sha256 = "C/kf+rYGTIdExxivNKHWeOzNsPAOWz2jn4sc52+sClA=";
      }
      {
        name = "cpptools";
	publisher = "ms-vscode";
	version = "1.14.4";
	sha256 = "3gWMrsVr5XjsuXL3DJ+KkVVD2RWtN6Uqdp3e7u9OwnM=";
      }
      {
        name = "vscodeintellicode";
	publisher = "VisualStudioExptTeam";
	version = "1.2.30";
	sha256 = "f2Gn+W0QHN8jD5aCG+P93Y+JDr/vs2ldGL7uQwBK4lE=";
      }
    ];
    userSettings = {
      "editor.fontSize" = 14;
      "editor.fontFamily" = "Meslo";
      "editor.fontLigatures" = true;
      "editor.formatOnSave" = true;
      "editor.tabCompletion" = "on";
      "files.autoSave" = "afterDelay";
      "files.autoSaveDelay" = 1000;
      "workbench.colorTheme" = "Rosé Pine";
      "terminal.integrated.fontFamily" = "MesloLGL Nerd Font Mono";
      "terminal.integrated.fontSize" = 13;
    };
  };
}
