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
      arandr
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
      i3lock
      inputs.maxfetch.packages.${pkgs.system}.default
      kitty
      linuxPackages.acpi_call
      mpv
      neofetch
      neovide
      neovim
      obs-studio
      pavucontrol
      pamixer
      pciutils
      playerctl
      polybar
      roboto
      rsync
      rofi
      slurp
      sshuttle
      smartmontools
      speedtest-cli
      sxhkd
      tdesktop
      tree
      unzip
      ventoy
      via
      websocat
      wget
		  xorg.xrandr
		  xbrightness
      xorg.libXt
      xfce.xfce4-taskmanager
      xorg.libXtst
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
    # ./themes
    ./vscode
    # ./mpd
    # ./spicetify
  ];

  home.stateVersion = "23.05";
  programs.home-manager.enable = true;
}
