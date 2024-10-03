{ config, pkgs, ... }: {

  users.groups.plugdev = { };

  users.defaultUserShell = pkgs.zsh;
  users.users.gsanchez = {
    isNormalUser = true;
    extraGroups = [ "wheel" "plugdev" ];
    initialPassword = "123";
    packages = with pkgs; [ ];
  };
}
