{ config, pkgs, ... }:

{
  imports = [
    ./zsh.nix
    ./tmux.nix
    ./git.nix
    ./cursor.nix
    ./packages.nix
    ./packages-3rd-part.nix
  ];

  home.file.".dwm" = {
    source = ../../dwm-scripts;
    recursive = true;   # 递归整个文件夹
    executable = true;  # 将其中所有文件添加「执行」权限
  };

  home.file.".config/nvim" = {
    source = ../../nvim;
    recursive = true;   # 递归整个文件夹
  };

  home.file.".local/bin/nix-proxy.sh" = {
    source = ../../scripts/proxy.sh;
    executable = true;
  };

  home = {
    username = "blue";
    homeDirectory = "/home/blue";
    stateVersion = "24.05";
    packages = with pkgs; [ ];

  };

  programs.home-manager.enable = true;
}
