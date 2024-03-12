{ pkgs, ... }: {
  nixpkgs.config.allowUnfreePredicate = _: true;
  home.packages = with pkgs; [
    nixfmt
    eza
    localsend
    ripgrep
    fzf
    neovim
    neovide
    stow
    nodejs_20
    wezterm
    obsidian
  ];

  programs = {
    direnv = {
      enable = true;
      enableZshIntegration = true; # see note on other shells below
      nix-direnv.enable = true;
    };

    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };

    fzf = {
      enable = true;
      enableZshIntegration = true;
    };

    starship = { enable = true; };
  };
}
