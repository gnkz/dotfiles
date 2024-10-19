{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

  };

  outputs =
    {
      nixpkgs,
      home-manager,
      ...
    }:
    {
      nixosConfigurations.dalinar = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
          ./services.nix
          ./users.nix
          ./networking.nix
          ./virtualisation.nix
          home-manager.nixosModules.home-manager
          {
            nixpkgs.config.enableUnfree = true;
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.gsanchez =
              { pkgs, lib, ... }:
              {
                imports = [
                  ./packages.nix
                  ./zsh.nix
                  ./neovim.nix
                  ./git.nix
                ];

                programs.home-manager.enable = true;

                programs.starship = {
                  enable = true;
                  enableZshIntegration = true;
                  # enableFishIntegration = true;
                };

                programs.zoxide = {
                  enable = true;
                  enableZshIntegration = true;
                  # enableFishIntegration = true;
                };

                programs.direnv = {
                  enable = true;
                  enableZshIntegration = true;
                  nix-direnv.enable = true;
                };

                programs.fzf = {
                  enable = true;
                  enableZshIntegration = true;
                  # enableFishIntegration = true;
                };

                programs.carapace = {
                  enable = true;
                  enableZshIntegration = true;
                  # enableFishIntegration = true;
                };

                programs.chromium = {
                  enable = true;
                  package = pkgs.brave;
                  extensions = [
                    { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; } # ublock origin
                    { id = "aeblfdkhhhdcdjpifhhbdiojplfjncoa"; } # 1password
                    { id = "acmacodkjbdgmoleebolmdjonilkdbch"; } # rabby
                    { id = "jplgfhpmjnbigmhklmmbgecoobifkmpa"; } # proton vpn
                  ];
                };

                programs.alacritty = {
                  enable = true;
                  settings = {
                    font = {
                      normal = {
                        family = "Monoid Nerd Font";
                        style = "Regular";
                      };
                    };
                  };
                };

                # programs.fish = {
                #   enable = true;
                # };

                services.ssh-agent.enable = true;
                services.kdeconnect.enable = true;

                services.mopidy = {
                  enable = true;
                  extensionPackages = with pkgs; [ mopidy-spotify ];
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
