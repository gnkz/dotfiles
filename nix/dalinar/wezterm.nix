{ ... }:
{
  programs.wezterm = {
    enable = true;
    enableZshIntegration = true;
    extraConfig = ''
      local config = wezterm.config_builder()
      config.color_scheme = 'Kanagawa (Gogh)'
      config.enable_wayland = true
      config.font = wezterm.font 'VictorMono Nerd Font'
      config.front_end = "OpenGL"
      return config
    '';
  };
}
