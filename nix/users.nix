{ config, pkgs, ... }:
{


	users.defaultUserShell = pkgs.zsh;
	users.users.gsanchez = {
		isNormalUser = true;
		extraGroups = [ "wheel" ];
		initialPassword = "123";
		packages = with pkgs; [];
	};
}
