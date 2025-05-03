{ pkgs, ... }: {
  home = {
    stateVersion = "23.11";
    username = "szymon";
    homeDirectory = "/Users/szymon";
    packages = [ ];
    file."/.config/ghostty/config" = { source = ./dotfiles/ghostty/config; };
    file."/.config/neofetch/config.conf" = { source = ./dotfiles/neofetch/config.conf; };
    file."/.config/starship.toml" = { source = ./dotfiles/starship.toml; };
    file."/.config/nvim" = { source = ./dotfiles/nvim; recursive = true;};
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
      core.editor = "nvim";
    };
  };
  programs.tmux = {
    enable = true;
    mouse = true;
    baseIndex = 1;
    shortcut = "a";
    extraConfig = ''
      # Refreshing the config
      unbind r
      bind r source-file ~/.config/tmux/tmux.conf

      set -g default-terminal "tmux-256color"
      set -ag terminal-overrides ",xterm-256color:RGB"
      set-option -g status-position top

      set -g default-command /bin/zsh
      set -g default-shell /bin/zsh

      bind-key h select-pane -L
      bind-key j select-pane -D
      bind-key k select-pane -U
      bind-key l select-pane -R

      bind-key -r h resize-pane -L 5
      bind-key -r j resize-pane -D 5
      bind-key -r k resize-pane -U 5
      bind-key -r l resize-pane -R 5
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
      on-window-detected = [
        {
          "if".app-name-regex-substring = "Finder";
          run = "layout floating";
        }
      ];
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

        alt-1 = "workspace 1";
        alt-2 = "workspace 2";
        alt-3 = "workspace 3";
        alt-4 = "workspace 4";
        alt-5 = "workspace 5";

        alt-shift-1 = "move-node-to-workspace 1";
        alt-shift-2 = "move-node-to-workspace 2";
        alt-shift-3 = "move-node-to-workspace 3";
        alt-shift-4 = "move-node-to-workspace 4";
        alt-shift-5 = "move-node-to-workspace 5";

        alt-tab = "workspace-back-and-forth";
        alt-shift-tab = "move-workspace-to-monitor --wrap-around next";
        alt-shift-semicolon = "mode service";
        alt-shift-w = "mode apps";
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
      mode.apps.binding = {
        alt-t = [
          "exec-and-forget open -a /Applications/Ghostty.app"
          "mode main"
        ];
        alt-b = [
          "exec-and-forget open -a ${pkgs.google-chrome}/Applications/Google Chrome.app"
          "mode main"
        ];
        alt-m = [
          "exec-and-forget open -a /System/Applications/Music.app"
          "mode main"
        ];
        alt-f = [
          "exec-and-forget open -a /System/Library/CoreServices/Finder.app"
          "mode main"
        ];
      };
    };
  };
}
