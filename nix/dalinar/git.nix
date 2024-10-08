{ pkgs, ... }: {
  programs.git = {
    enable = true;
    userName = "gnkz";
    userEmail = "gnkz.dev@gmail.com";
    delta.enable = true;
    extraConfig = { push = { autoSetupRemote = true; }; };
  };
}
