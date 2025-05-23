{ pkgs, ... }: {
  programs.cava = {
    enable = true;
    settings = {
      general = {
        bars = 0;
        bar_width = 2;
        bar_spacing = 1;
      };
      input = {
        method = "portaudio";
        source = "Background Music";
      };
      # color = {
      #   gradient = 1;
      #   gradient_count = 6;
      #   gradient_color_1 = "'#3e8fb0'";
      #   gradient_color_2 = "'#9ccfd8'";
      #   gradient_color_3 = "'#c4a7e7'";
      #   gradient_color_4 = "'#ea9a97'";
      #   gradient_color_5 = "'#f6c177'";
      #   gradient_color_6 = "'#eb6f92'";
      # };
    };
  };
}
