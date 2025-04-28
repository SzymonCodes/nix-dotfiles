{ pkgs, ... }: 
{
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowBroken = true;
  environment.systemPackages =
    [
      # Neovim
      pkgs.lua-language-server
      pkgs.pyright
      pkgs.neovim

      # CLIs
      pkgs.tmux
      pkgs.duckdb
      pkgs.tidy-viewer
      pkgs.quarto
      pkgs.micromamba
      pkgs.starship
      pkgs.fzf
      pkgs.neofetch
      pkgs.zoxide
      pkgs.bat
      pkgs.ripgrep
      pkgs.cmatrix
      pkgs.jankyborders
      pkgs.zsh-autosuggestions
      pkgs.zsh-syntax-highlighting

      # Git
      pkgs.git
      pkgs.git-credential-manager

      # GUI Applications      
      pkgs.aerospace
      pkgs.raycast
      pkgs.spotify
      pkgs.appcleaner 
      pkgs.google-chrome 
      pkgs.obsidian 
      # pkgs._1password-gui
      pkgs._1password-cli 
    ];

  fonts.packages = [
    pkgs.nerd-fonts.jetbrains-mono
  ];

  homebrew = {
    enable = true;
    casks = [
      "affinity-designer" 
      "affinity-photo" 
      "ghostty" 
      "1password"
    ];
    onActivation.cleanup = "zap";
    onActivation.autoUpdate = true;
    onActivation.upgrade = true;
  };

  system.defaults = {
    dock.autohide = true;
    dock.wvous-br-corner = 1;
    dock.mru-spaces = false;
    dock.show-recents = false;
    dock.persistent-apps = [
      "/Applications/Ghostty.app"
      "${pkgs.obsidian}/Applications/Obsidian.app"
      "${pkgs.google-chrome}/Applications/Google Chrome.app"
      "${pkgs.spotify}/Applications/Spotify.app"
      "/System/Applications/Music.app"
    ];
    finder.FXPreferredViewStyle = "Nlsv";
    loginwindow.GuestEnabled = false;
    NSGlobalDomain.AppleICUForce24HourTime = true;
    NSGlobalDomain.AppleInterfaceStyle = "Dark";
    NSGlobalDomain.KeyRepeat = 2;
    finder.FXDefaultSearchScope = "SCcf";
    finder._FXSortFoldersFirst = true;
    finder.AppleShowAllFiles = true;
    finder.CreateDesktop = false;
    finder.NewWindowTarget = "Documents";
    finder.ShowStatusBar = true;
    WindowManager.EnableStandardClickToShowDesktop = false;
    NSGlobalDomain.NSWindowShouldDragOnGesture = true;
  };

  system.startup.chime = false;

  nix.enable = false;	

  nix.settings.experimental-features = "nix-command flakes";
  programs.zsh.enable = true;

  system.stateVersion = 4;

  nixpkgs.hostPlatform = "aarch64-darwin";

  users.users.szymon = {
    name = "szymon";
    home = "/Users/szymon";
  };
}
