{ pkgs, config, ... }:
{
  programs.kitty = {
    enable = true;
    font = {
      package = pkgs.monaspace;
      name = "Monaspace Neon";
      size = "14";
    };
  };
}
