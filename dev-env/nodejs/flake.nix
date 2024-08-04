{
  description = "A Nix-flake-based Node.js development environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
  };

  outputs = { self , nixpkgs ,... }: let
    system = "x86_64-linux";
  in {
    devShells."${system}".default = let
      pkgs = import nixpkgs {
        inherit system;
      };
    in pkgs.mkShell {
      packages = with pkgs; [
        nodejs_20
        nodePackages.pnpm
        nodePackages.npm
        (yarn.override { nodejs = nodejs_20; })
      ];

      shellHook = ''
        echo "node `${pkgs.nodejs}/bin/node --version`"
        exec zsh
      '';
    };
  };
}
