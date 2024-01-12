{
  config,
  pkgs,
  inputs,
  ...
}: let
  spicetify = inputs.spicetify-nix;
  spicePkgs = spicetify.packages.${pkgs.system}.default;
in {
  imports = [spicetify.homeManagerModule];

  programs.spicetify = {
    enable = true;
    theme = spicePkgs.themes.catppuccin;
    colorScheme = "moccha";
    enabledExtensions = with spicePkgs.extensions; [
      fullAppDisplay
      shuffle
      hidePodcasts
      adblock
      volumePercentage
    ];
  };
}