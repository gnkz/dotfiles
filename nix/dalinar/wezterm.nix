{ ... }:
{
  programs.wezterm = {
    enable = true;
    enableZshIntegration = true;
    extraConfig = ''
        config.color_scheme = 'Kanagawa (Gogh)'
      	config.enable_wayland = true
    '';
  };
}
