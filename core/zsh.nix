{ ... }:
{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    setOptions = ["PROMPT_SUBST" "appendhistory"];
  };
}