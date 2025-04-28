{ pkgs, ... }: {
  home = {
    stateVersion = "23.11";
    username = "szymon";
    homeDirectory = "/Users/szymon";
    packages = [ ];
    file."/.config/ghostty/config" = { source = ./dotfiles/.config/ghostty/config; };
    file."/.config/neofetch/config.conf" = { source = ./dotfiles/.config/neofetch/config.conf; };
    file."/.config/starship.toml" = { source = ./dotfiles/.config/starship.toml; };
    file."/.config/nvim" = { source = ./dotfiles/.config/nvim; recursive = true;};
  };
  xdg.enable = true;

  programs.home-manager.enable = true;
  programs.zsh = {
    enable = true;
    initContent = ''
      eval "$(starship init zsh)"
      neofetch
      eval "$(zoxide init zsh)"
      ZSH_HIGHLIGHT_STYLES[path]=none
      ZSH_HIGHLIGHT_STYLES[path_prefix]=none
                              '';
    plugins = [
      {
        name = pkgs.zsh-autosuggestions.pname;
        src = pkgs.zsh-autosuggestions.src;
      }
      {
        name = pkgs.zsh-syntax-highlighting.pname;
        src = pkgs.zsh-syntax-highlighting.src;
      }
    ];
  };
  programs.git = {
    enable = true;
    package = pkgs.gitFull;
    extraConfig = {
      credential.helper = "manager";
    };
  };
  programs.tmux = {
    enable = true;
    mouse = true;
    baseIndex = 1;
    shortcut = "a";
    extraConfig = ''
      set-option -g status-position top
    '';
    plugins = with pkgs; [
      tmuxPlugins.sensible
      tmuxPlugins.vim-tmux-navigator
      {
        plugin = tmuxPlugins.rose-pine;
        extraConfig = ''
          set -g @rose_pine_variant 'moon'
          set -g @rose_pine_bar_bg_disable 'on' 
          set -g @rose_pine_bar_bg_disabled_color_option 'default'
          set -g @rose_pine_show_pane_directory 'on'
        '';
      }
    ];
  };
  services.jankyborders.enable = true;
  programs.aerospace = {
    enable = true;
    userSettings = {
      after-startup-command = [ 
        "exec-and-forget borders active_color=0xff58A4B0 inactive_color=0xff494d64 width=5.0"
      ];
      enable-normalization-flatten-containers = true;
      enable-normalization-opposite-orientation-for-nested-containers = true;
      accordion-padding = 30;
      default-root-container-layout = "tiles";
      default-root-container-orientation = "auto";
      on-focused-monitor-changed = ["move-mouse monitor-lazy-center"];
      automatically-unhide-macos-hidden-apps = false;
      start-at-login = true;
      key-mapping = {
        preset = "qwerty";
      };
      gaps = {
        inner.horizontal = 10;
        inner.vertical =   10;
        outer.left =       10;
        outer.bottom =     10;
        outer.top =        10;
        outer.right =      10;
      };
      mode.main.binding = {
        alt-slash = "layout tiles horizontal vertical";
        alt-comma = "layout accordion horizontal vertical";

        alt-h = "focus left";
        alt-j = "focus down";
        alt-k = "focus up";
        alt-l = "focus right";

        alt-shift-h = "move left";
        alt-shift-j = "move down";
        alt-shift-k = "move up";
        alt-shift-l = "move right";

        alt-shift-minus = "resize smart -50";
        alt-shift-equal = "resize smart +50";

        alt-t = "workspace 1";
        alt-b = "workspace 2";
        alt-m = "workspace 3";
        alt-n = "workspace 4";
        alt-o = "workspace 5";

        alt-shift-t = "move-node-to-workspace 1";
        alt-shift-b = "move-node-to-workspace 2";
        alt-shift-m = "move-node-to-workspace 3";
        alt-shift-n = "move-node-to-workspace 4";
        alt-shift-o = "move-node-to-workspace 5";

        alt-tab = "workspace-back-and-forth";
        alt-shift-tab = "move-workspace-to-monitor --wrap-around next";
        alt-shift-semicolon = "mode service";
      };
      mode.service.binding = {
        esc = [ 
          "reload-config" 
          "mode main"
        ];
        r = [
          "flatten-workspace-tree"
          "mode main"
        ]; 
        f = [
          "layout floating tiling" 
          "mode main"
        ];
        backspace = [
          "close-all-windows-but-current" 
          "mode main"
        ];

        alt-shift-h = [
          "join-with left"
          "mode main"
        ];
        alt-shift-j = [
          "join-with down"
          "mode main"
        ];
        alt-shift-k = [
          "join-with up"
          "mode main"
        ];
        alt-shift-l = [
          "join-with right"
          "mode main"
        ];
      };
    };
  };
}
