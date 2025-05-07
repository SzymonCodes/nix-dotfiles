{ pkgs, ... }: {
  programs.zsh = {
    enable = true;
    initContent = ''
      eval "$(starship init zsh)"
      neofetch
      if pgrep -x "sketchybar" >/dev/null 2>&1; then
        pkill -x sketchybar
        sketchybar &!
      else
       sketchybar &!
      fi
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
}
