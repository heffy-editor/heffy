{
  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    devshell.url = "github:numtide/devshell";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];
      imports = [
        inputs.devshell.flakeModule
      ];
      perSystem = { self', system, lib, config, pkgs, ... }: {
        devShells.default = pkgs.mkShell {
          name = "heffy-shell";
          nativeBuildInputs = with pkgs; [
            cabal-install
            haskellPackages.ghc
            haskellPackages.haskell-language-server
          ];
        };
      };
    };
}

