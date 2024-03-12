{ pkgs, ... }: {
  programs.zsh = {
    enable = true;
    shellAliases = {
      v = "nvim";
      vi = "nvim";
      vim = "nvim";
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
