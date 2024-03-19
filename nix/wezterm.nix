{ pkgs, config, ... }: {

  home.file."${config.home.homeDirectory}/.config/wezterm" = {
    source = "../wezterm";
    recursive = true;
  };

}
