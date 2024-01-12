{ config, pkgs, inputs, ... }:
{
    programs.vscode = {
      package = pkgs.vscode.fhs;
      enable = true;
      enableUpdateCheck = true;
      enableExtensionUpdateCheck = true;
      extensions = with pkgs.vscode-extensions; [
        github.copilot
        github.github-vscode-theme
        github.vscode-github-actions
        ms-vscode.powershell
        bbenoist.nix
      ];
      userSettings = {
        "window.titleBarStyle" = "custom";
        "workbench.colorTheme" = "Shades of Purple (Super Dark)";
        "editor.fontFamily" = "'M+1Code Nerd Font','Droid Sans Mono', 'monospace', monospace";
        "github.copilot.enable" = {
          "*" = true;
          "plaintext" = false;
          "markdown" = true;
          "scminput" = false;
          "cpp" = false;
        };
        "powershell.powerShellAdditionalExePaths" = "/run/current-system/sw/bin/pwsh";
        "window.zoomLevel" = 1;
        "editor.inlineSuggest.enabled" = false;
      };
    };
}