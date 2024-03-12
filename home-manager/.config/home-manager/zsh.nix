{ pkgs, ... }: {
  programs.zsh = {
    enable = true;
    shellAliases = {
      v = "neovim";
      vi = "neovim";
      vim = "neovim";
      nv = "neovide";
      ls = "exa";
      ll = "exa -l";
      cd = "z";
    };
    zplug = {
      enable = true;
      plugins = [
        { name = "zsh-users/zsh-autosuggestions"; }
        { name = "zsh-users/zsh-syntax-highlighting"; }
        { name = "Aloxaf/fzf-tab"; }
      ];
    };
  };
}
