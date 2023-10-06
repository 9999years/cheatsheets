# Format this file with `alejandra`.
# Enter a development shell: `nix develop`
{
  description = "LaTeX cheatsheets";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = nixpkgs.legacyPackages.${system};
        inherit (pkgs) stdenv fetchzip;
      in {
        packages = {
          texlive = pkgs.texlive.combine {
            inherit
              (pkgs.texlive)
              scheme-small
              collection-xetex
              latexmk
              collection-latexrecommended
              framed
              enumitem
              fontawesome5
              titlesec
              ;
          };

          charter = let
            version = "210112";
          in
            stdenv.mkDerivation {
              pname = "charter";
              inherit version;

              src = fetchzip {
                url = "https://practicaltypography.com/fonts/Charter%20${version}.zip";
                name = "Charter-${version}.zip";
                hash = "sha256-rsKMp+LBEitOFPgM1xF//BLgF3uIRPlBitLdrefmsnw=";
              };

              phases = "unpackPhase installPhase";

              # WOFF2 fonts seem to cause problems on Linux; disable them by
              # default.
              enableWoff2 = false;

              installPhase = ''
                mkdir -p $out/share/fonts
                mv "OTF format (best for Mac OS)/Charter" $out/share/fonts/opentype
                mv "TTF format (best for Windows)/Charter" $out/share/fonts/truetype
                if [[ -n "$enableWoff2" ]]; then
                  mv "WOFF2 format (best for web)/Charter" $out/share/fonts/woff
                fi
                mv "Charter license.txt" $out/LICENSE.txt
              '';
            };
        };

        checks = self.packages.${system};

        devShells = {
          changelog = pkgs.mkShell {
            name = "latex-cheatsheets";
            packages = [
              pkgs.texlab # TeX language server
              self.packages.${system}.texlive
            ];
            FONTCONFIG_FILE = pkgs.makeFontsConf {fontDirectories = [self.packages.${system}.charter];};
          };

          default = self.devShells.${system}.changelog;
        };
      }
    );
}
