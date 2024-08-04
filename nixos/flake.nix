{
  description = "NixOS Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    my-repo = {
      url = "github:heng30/nixos-pkgs";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem rec {
        system = "x86_64-linux";

        modules = [
          ({
            nixpkgs.overlays = [
              (final: prev: {
                my-repo = inputs.my-repo.packages."${prev.system}";
              })
            ];
          })

          ./configuration.nix

          home-manager.nixosModules.home-manager
          {

            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = inputs;
            home-manager.users.blue = import ./home;
            home-manager.backupFileExtension = "backup";
          }

          # add this module, to enable cross-compilation for riscv64
          # { nixpkgs.crossSystem = { system = "riscv64-linux"; }; }
        ];
      };
    };
  };
}
