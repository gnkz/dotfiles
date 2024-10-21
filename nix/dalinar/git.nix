{ lib, pkgs, ... }:
{
  programs.git = {
    enable = true;
    userName = "gnkz";
    userEmail = "gnkz.dev@gmail.com";
    delta.enable = true;
    extraConfig = {
      push = {
        autoSetupRemote = true;
      };
      gpg = {
        format = "ssh";
      };
      "gpg \"ssh\"" = {
        program = "${lib.getExe' pkgs._1password-gui "op-ssh-sign"}";
      };
      commit = {
        gpgsign = true;
      };
      user = {
        signingKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIG1g1qF0MUcbKX9sPBzpDbVCe61x6wg2EML2bRHiVO4t";
      };
    };
  };
}
