{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    syntaxHighlighting = {
      enable = true;
      highlighters = [ "main" "brackets" ];
    };
    shellAliases = {
      switch = "nh os switch ~/nixos-config -H callilope -u -- --impure";
      repair-switch = "sudo nix-store --repair --verify --check-contents";
      logout = "loginctl terminate-user manas";
      # code = "code --disable-gpu";
      switch-test = "nh os test ~/nixos-config-test -H callilope -u -- --impure";
    };
  };
}