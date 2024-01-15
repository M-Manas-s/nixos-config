{ pkgs, inputs, ... }:
{
    # List packages installed in system profile
    environment = {
        systemPackages = with pkgs; [
            curl
            git
            unzip
            vim
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
        ];
        pathsToLink = [ "/libexec" "/share/zsh" ];
    };

    #Programs
    programs = {
        dconf.enable = true;
        direnv.enable = true;
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