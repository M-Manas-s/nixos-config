{ config, pkgs, inputs, system, ... }:
{
  imports = [
    ./configuration.nix
    ./networking.nix
    ./services.nix
    ./hardware-configuration.nix
    ./packages.nix
    ./zsh
    # ./spicetify
  ];
}
