{ pkgs }:
import ("${pkgs.path}/nixos/lib/make-disk-image.nix") {
  config = (import ("${pkgs.path}/nixos/lib/eval-config.nix") {
    inherit (pkgs) system;
    modules = [{
      imports = [ ./nixos-config.nix ];
    }];
  }).config;
  inherit pkgs;
  inherit (pkgs) lib;
  diskSize = 8192;
  partitionTableType = "none";
  format = "qcow2";
}
