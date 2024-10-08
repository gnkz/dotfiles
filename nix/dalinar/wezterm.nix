{ pkgs, config, ... }: {

  home.file.".config/wezterm" = {
    source = ../wezterm/.config/wezterm;
    recursive = true;
  };

}
