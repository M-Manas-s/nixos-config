{ config, pkgs, inputs, system, custom, ... }:
{
  
  home = {
    username = "manas";
    homeDirectory = "/home/manas";
    shellAliases = {
      home-switch = "nh os test ~/nixos-config -H callilope -u -- --impure --show-trace";
    };
    packages = with pkgs; [
      alsa-utils
      (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono"]; })
      btop
      brightnessctl
      compsize
      curl
      cmake
      deluge
      firefox
      foot
      gcc
      git
      glibc
      grim
      htop
      mpv
      inputs.maxfetch.packages.${pkgs.system}.default
      neofetch
      neovide
      neovim
      obs-studio
      pavucontrol
      pamixer
      pciutils
      playerctl
      roboto
      rsync
      slurp
      smartmontools
      speedtest-cli
      swaybg
      swww
      swayidle
      swaylock-effects
      swaynotificationcenter
      tdesktop
      tree
      unzip
      ventoy
      via
      waybar
      websocat
      wget
      wofi
      zig
    ];
  };

  # brave

  programs.brave = {
    enable = true;
  };

  # disable manuals as nmd fails to build often
  manual = {
    html.enable = false;
    json.enable = false;
    manpages.enable = false;
  };

  xdg.userDirs = {
    enable = true;
    createDirectories = true;
  };

  nixpkgs.config.allowUnfree = true;

  imports = [
    ./themes
    ./wayland
    ./vscode
    ./mpd
    ./spicetify
  ];

  home.stateVersion = "23.05";
  programs.home-manager.enable = true;
}
