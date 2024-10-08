{ config, lib, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  nix.settings.experimental-features = "nix-command flakes";

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "dalinar";
  networking.networkmanager.enable = true;

  time.timeZone = "America/Santiago";

  services.pipewire = {
  	enable = true;
	pulse.enable = true;
  };

  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;

  programs.zsh.enable = true;
  programs._1password.enable = true;
  programs._1password-gui = {
    enable = true;
    polkitPolicyOwners = [ "gsanchez" ];
  };

  services.openssh = {
    enable = true;
    settings = { PasswordAuthentication = true; };
  };

  services.ollama = {
    enable = true;
    acceleration = "cuda";
  };

  system.stateVersion = "24.05";
}

