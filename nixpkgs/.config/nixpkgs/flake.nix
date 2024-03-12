{
		description = "Home Manager Flake";

		inputs = {
				nixpkgs.url = "github:NixOS/nixpkgs/master";
				home-manager.url = "github:nix-community/home-manager";
				home-manager.inputs.nixpkgs.follows = "nixpkgs";
		};

		outputs = inputs : {
			homeConfigurations = {
				tyrion = inputs.home-manager.lib.homeManagerConfiguration {
					system = "aarch64-darwin";
					homeDirectory = "/Users/gsanchezv";
					username = "gsanchezv";
					configuration.imports = [
						./home-manager.nix
					];
				};
			};
		};
}
