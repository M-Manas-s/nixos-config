{ pkgs, inputs, ... }:
{
    # List packages installed in system profile
    environment = {
        systemPackages =  with pkgs; let themes = pkgs.callPackage ./sddm/themes.nix {}; in [
            curl
            git
            unzip
            vim
            wget
            zip
            htop
            btop
            gcc
            spotify
            speedtest-cli
            pciutils
            pulseaudio
            libsForQt5.qt5.qtgraphicaleffects
            neofetch
            tree
            themes.sddm-sugar-dark 
            themes.tokyo-night
            valgrind
            compsize
            smartmontools
            networkmanagerapplet
            inputs.home-manager.packages.${pkgs.system}.home-manager
            inputs.nh.packages.${system}.default
            wireplumber
            wl-clipboard
        ];
        pathsToLink = [ "/libexec" "/share/zsh" ];
    };

    fonts.packages = with pkgs; [
        (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" "JetBrainsMono" ]; })
        font-awesome
    ];

    #Programs
    programs = {
        dconf.enable = true;
        direnv.enable = true;

        hyprland = {
            enable = true; 
            package = inputs.hyprland.packages.${pkgs.system}.hyprland;
            xwayland = {
                enable = true;
            };
        };

        # monitor backlight control
        light.enable = true;

        thunar = {
            enable = true;
            plugins = with pkgs.xfce; [ 
                xfconf
                thunar-archive-plugin
                thunar-volman 
            ];
        };
    };

}