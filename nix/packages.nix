{ config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    vim
    wezterm
    telegram-desktop
    monaspace
    wget
    libgcc
    gcc
    gnumake
    discord
    firefox
    neovide
    git
    nodejs_20
    unzip
    spotify
    go
    framesh
    eza
    nixfmt
    localsend
    fzf
    lazygit
  ];
}
