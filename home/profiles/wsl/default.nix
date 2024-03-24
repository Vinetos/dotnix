{ pkgs, lib, ... }:
{
  imports = [
    ../../programs
    ../../services
    ../../terminals/kitty.nix
  ];

  # Custom git configuration
  programs = {
    git = {
      # Signing Module
      signing = {
        key = "3EC1FE8DF090B8CF";
        signByDefault = false;
      };

      # User config
      userName = "Valentin Chassignol";
      userEmail = "valentin" + "." + "chassignol" + "@" + "infomaniak" + "." + "com";
    };
    ssh = {
      matchBlocks = {
        all = {
          host = "*";
          user = "root";
        };
      };
    };
  };

  home.packages = with pkgs; [  ];

}
