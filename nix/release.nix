{ sources ? import ./sources.nix, nixpkgs ? sources.nixpkgs
, pkgs ? import nixpkgs { } }:

let mkTest = import "${nixpkgs}/nixos/tests/make-test-python.nix";
in rec {
  studioLink = pkgs.callPackage ./build.nix { };

  test = pkgs.callPackage ./test.nix { inherit mkTest studioLink; };
}

