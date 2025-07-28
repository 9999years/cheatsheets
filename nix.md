# NixOS / Nixpkgs / Nix

Install (multi-user):

    bash -c "sh <(curl -L https://nixos.org/nix/install) --daemon"

Use `--no-daemon` for single-user. See <https://nixos.org/download.html>

- Search options: <https://search.nixos.org/options>
- Manual: <https://nixos.org/manual/nixos/stable/>
- Overlays: `(self: super: { pkg = super.pkg.overrideAttrs (old: { ... }); })`

## Overriding derivations

- `<pkg>.override` changes arguments passed to a function.
- `<pkg>.overrideAttrs` changes the attributes passed to `stdenv.mkDerivation`.
  Use like: `pkgs.hello.overrideAttrs (old: { ... })`.


## Shells

```nix
{ pkgs ? import <nixpkgs> {} }:
pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    ghc
  ];
}
```

## Nixpkgs

Build tests (`pkgs/test/default.nix`):

```bash
nix build --file . tests.haskell.env
```

## nix-eval-jobs

```bash
nix-eval-jobs --expr 'with import ./. {}; tests.haskell' | jq
nix-eval-jobs --expr 'with import ./. {}; tests.haskell' | jq --raw-output .drvPath | xargs nix build --log-format multiline-with-logs
```
