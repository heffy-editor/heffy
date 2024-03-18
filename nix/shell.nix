{ inputs, ... }: {
  imports = [
    inputs.devshell.flakeModule
  ];
  perSystem = { config, pkgs, ... }:
    {
      devShells.default = pkgs.mkShell {
        shellHook = config.pre-commit.installationScript;
        name = "heffy-shell";
        nativeBuildInputs = with pkgs; [
          cabal-install
          haskellPackages.ghc
          haskellPackages.haskell-language-server
        ];
      };
    };
}

