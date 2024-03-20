{ pkgs, config, ... }: {
  programs.zsh.enable = true;
  programs.zsh.shellAliases = {
    v = "nvim";
    vi = "nvim";
    vim = "nvim";
    nv = "neovide";
    ls = "exa";
    ll = "exa -l";
    cd = "z";
  };
  programs.zsh.zplug = {
    enable = true;
    plugins = [
      { name = "zsh-users/zsh-autosuggestions"; }
      { name = "zsh-users/zsh-syntax-highlighting"; }
      { name = "Aloxaf/fzf-tab"; }
    ];
  };
}
