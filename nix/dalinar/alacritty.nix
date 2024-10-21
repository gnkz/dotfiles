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
          family = "JetBrainsMono Nerd Font";
          style = "Regular";
        };
        bold = {
          family = "JetBrainsMono Nerd Font";
          style = "Bold";
        };
        italic = {
          family = "JetBrainsMono Nerd Font";
          style = "Italic";
        };
        bold_italic = {
          family = "JetBrainsMono Nerd Font";
          style = "Bold Italic";
        };
      };
    };
  };
}
