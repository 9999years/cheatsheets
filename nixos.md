# NixOS / Nixpkgs / Nix

Install (multi-user):

    bash -c "sh <(curl -L https://nixos.org/nix/install) --daemon"

Use `--no-daemon` for single-user. See <https://nixos.org/download.html>

- Search options: <https://search.nixos.org/options>
- Manual: <https://nixos.org/manual/nixos/stable/>

## Overriding derivations

- `<pkg>.override` changes arguments passed to a function.
- `<pkg>.overrideAttrs` changes the attributes passed to `stdenv.mkDerivation`.
  Use like: `pkgs.hello.overrideAttrs (old: { ... })`.
