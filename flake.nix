{
  description = "NixOS configuration";

  inputs = {
    
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    pipecord = {
      url = "github:justinlime/pipecord";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    maxfetch = {
      url = "github:jobcmax/maxfetch";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
      url = "github:the-argus/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-index-db = {
      url = "github:Mic92/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nh = {
      url = "github:viperML/nh";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    fu.url = "github:numtide/flake-utils";

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    anyrun = {
      url = "github:Kirottu/anyrun";
      inputs.nixpkgs.follows = "nixpkgs";
    };

 };
 
  outputs = inputs@{ self, nixpkgs, home-manager, ... } : 
  let
    # overlays = [inputs.nur.overlay inputs.rust-overlay.overlays.default];
    pkgs = import nixpkgs {
      # inherit overlays;
      config.allowUnfree = true;
    };
    custom = rec {
      font = "FiraCode Nerd Font";
      fontsize = "12";
      primary_accent = "cba6f7";
      secondary_accent= "89b4fa";
      tertiary_accent = "f5f5f5";
      background = "11111B";
      opacity = "1";
      cursor = "Numix-Cursor";
      palette = {
        primary_accent_hex = "cba6f7";
        secondary_accent_hex = "89b4fa";
        tertiary_accent_hex = "f5f5f5";
        primary_background_hex = "11111B";
        secondary_background_hex = "1b1b2b";
        tertiary_background_hex = "25253a";
        active_background_hex = "50507d";

        primary_accent_rgba = "rgba(203,166,247,${opacity})";
        secondary_accent_rgba = "rgba(137,180,250,${opacity})";
        tertiary_accent_rgba = "rgba(245,245,245,${opacity})";
        primary_background_rgba = "rgba(17,17,27,${opacity})";
        secondary_background_rgba = "rgba(27,27,43,${opacity})";
        tertiary_background_rgba = "rgba(37,37,58,${opacity})";
        # active_background_rgba = "rgba(59,59,92,${opacity})";
      };
    };
  in 
  {
    nixosConfigurations = {
      callilope = nixpkgs.lib.nixosSystem rec {
        system = "x86_64-linux";
        specialArgs = {inherit self system inputs pkgs custom;};
        modules = [
          ./core

          home-manager.nixosModules.home-manager
          {
            home-manager.extraSpecialArgs = {inherit self system inputs pkgs custom;};
            home-manager.useUserPackages = true;
            home-manager.users.manas = import ./home;
          }

          inputs.nh.nixosModules.default
          {
            nh = {
              enable = true;
              clean.enable = true;
              clean.extraArgs = "--keep-since 4d --keep 3";
            };
          }

        ];
      };
    };
  };
}
