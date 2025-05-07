{ pkgs, ... }: {
  home = {
    stateVersion = "23.11";
    username = "szymon";
    homeDirectory = "/Users/szymon";
    packages = [ ];
    file."/.config/ghostty/config" = { source = ./dotfiles/ghostty/config; };
    file."/.config/neofetch/config.conf" = { source = ./dotfiles/neofetch/config.conf; };
    file."/.config/starship.toml" = { source = ./dotfiles/starship.toml; };
    file."./.aerospace.toml" = { source = ./dotfiles/.aerospace.toml; };
    file."/.config/nvim" = { source = ./dotfiles/nvim; recursive = true;};
    file."/.config/sketchybar" = { source = ./dotfiles/sketchybar; recursive = true;};
  };
  xdg.enable = true;
  programs.home-manager.enable = true;
  imports = [
    ./dotfiles/zsh.nix
    ./dotfiles/git.nix
    ./dotfiles/cava.nix
    ./dotfiles/tmux.nix
    ./dotfiles/jankyborders.nix
  ];
}
