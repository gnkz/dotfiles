{ config, lib, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "kaladin";
  networking.networkmanager.enable = true;

  time.timeZone = "America/Santiago";

  sound.enable = true;
  hardware.pulseaudio.enable = true;

  services.xserver.enable = true;
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.displayManager.sddm.wayland.enable = false;
  services.xserver.desktopManager.plasma5.enable = true;

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

  system.stateVersion = "23.11";
}

