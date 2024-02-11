{ inputs, ... }: {
  imports = [
    inputs.pre-commit-hooks.flakeModule
  ];
  perSystem = _:
    {
      pre-commit = {
        settings = {
          default_stages = [ "commit" "push" ];
          hooks = {
            nixpkgs-fmt.enable = true;
            cabal-fmt.enable = true;
            deadnix.enable = true;
            hlint.enable = true;
            nil.enable = true;
            ormolu.enable = true;
            statix.enable = true;
            typos.enable = true;
          };
        };
      };
    };
}
