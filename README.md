# Studio Link for NixOS

This repository packages [Studio Link](https://studio-link.de/) for
[NixOS](https://nixos.org/).

Install via:

```sh
% nix-env -iA studioLink --arg nixpkgs '<nixpkgs>' -f https://github.com/blitz/nix-studio-link/tarball/master
```

In case your nixpkgs is incompatible, you can use the one that is
tested by the CI by omitting the `--arg nixpkgs '<nixpkgs>'` parameter
in the above command.
