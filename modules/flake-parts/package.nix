{
  perSystem =
    { pkgs, ... }:
    {
      packages = {
        # TODO: Autoload all packages in the directory to build
        bibata-hyprcursor = pkgs.callPackage ../../packages/bibata-hyprcursor { };
      };
    };
}
