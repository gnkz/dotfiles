{ pkgs, config, ... }: {

  home.file.".config/nvim" = {
    source = ../nvim/.config/nvim;
    recursive = true;
  };

}

