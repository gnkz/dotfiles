{
  ...
}:

{
  imports = [ ./hardware-configuration.nix ];

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = "nix-command flakes";

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "dalinar";
  networking.networkmanager.enable = true;

  time.timeZone = "America/Santiago";

  programs.zsh.enable = true;
  programs.fish.enable = false;
  programs._1password.enable = true;
  programs._1password-gui = {
    enable = true;
    polkitPolicyOwners = [ "gsanchez" ];
  };

  system.stateVersion = "24.05";
}
