{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting = {
      enable = true;
      highlighters = [ "main" "brackets" ];
    };
    shellAliases = {
      switch = "nh os switch ~/nixos-config -H callilope -u -- --impure";
      repair-switch = "sudo nix-store --repair --verify --check-contents";
      # code = "code --disable-gpu";
      switch-test = "nh os test ~/nixos-config-test -H callilope -u -- --impure";
    };
  };
}