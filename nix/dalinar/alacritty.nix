{ ... }:
{
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        decorations = "None";
        startup_mode = "Fullscreen";
        padding = {
          x = 10;
          y = 10;
        };
      };
      font = {
        size = 14.0;
        normal = {
          family = "VictorMono Nerd Font Mono";
          style = "Regular";
        };
        bold = {
          family = "VictorMono Nerd Font Mono";
          style = "Bold";
        };
        italic = {
          family = "VictorMono Nerd Font Mono";
          style = "Oblique";
        };
        bold_italic = {
          family = "VictorMono Nerd Font Mono";
          style = "Bold Oblique";
        };
      };
    };
  };
}
