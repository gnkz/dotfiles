{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

  };

  outputs = { nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations.kaladin = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        ./users.nix
        ./packages.nix
        home-manager.nixosModules.home-manager
        {
          nixpkgs.config.enableUnfree = true;
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.gsanchez = { ... }: {
            imports = [ ./zsh.nix ./wezterm.nix ./neovim.nix ./git.nix ];

            programs.home-manager.enable = true;

            programs.starship = {
              enable = true;
              enableZshIntegration = true;
            };

            programs.zoxide = {
              enable = true;
              enableZshIntegration = true;
            };

            programs.direnv = {
              enable = true;
              enableZshIntegration = true;
              nix-direnv.enable = true;
            };

            programs.fzf = {
              enable = true;
              enableZshIntegration = true;
            };

            home.username = "gsanchez";
            home.homeDirectory = "/home/gsanchez";
            home.stateVersion = "24.05";
          };
        }
      ];
    };
  };
}
