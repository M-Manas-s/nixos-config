{ pkgs, inputs, ... }:
{
    # List packages installed in system profile
    environment = {
        systemPackages = with pkgs; [
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
            neofetch
            tree
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