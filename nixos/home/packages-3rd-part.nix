{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
      my-repo.simdict
      my-repo.encipher
      my-repo.cryptoinfo

      my-repo.apisvr
      my-repo.rssbox
      my-repo.sollaw
  ];
}
