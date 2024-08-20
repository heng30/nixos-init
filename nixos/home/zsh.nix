{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    initExtra = ''
      eval "$(zoxide init zsh)"
      # export OPENSSL_INCLUDE_DIR=${pkgs.openssl.dev}/include
      export INTEL_OPENVINO_DIR=${pkgs.openvino}
      export CXXFLAGS=-I${pkgs.libGL.dev}/include
      source "$HOME/init/zsh-init.sh"
    '';

    shellAliases = {
      # os-switch = "sudo nixos-rebuild switch";
    };

    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };

    zplug = {
      enable = true;
      plugins = [{ name = "zsh-users/zsh-autosuggestions"; }];
    };

    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [ "git" "bundler" "dotenv" "rake" "rbenv" ];
    };
  };
}

