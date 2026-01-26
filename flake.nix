{
  outputs = {self, nixpkgs}: {
    devShells = nixpkgs.lib.genAttrs nixpkgs.lib.systems.flakeExposed (system: let
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      default = pkgs.mkShell {
        packages = with pkgs; [
          cue
          gnumake
          zip
          coreutils
        ];
      };
    });
  };
}
