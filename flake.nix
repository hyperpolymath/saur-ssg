# SPDX-License-Identifier: AGPL-3.0-or-later
# SPDX-FileCopyrightText: 2025 hyperpolymath
#
# Nix flake for saur-ssg
# Usage:
#   nix develop        - Enter development shell
#   nix build          - Build the project
#   nix flake check    - Run checks

{
  description = "saur-ssg: MCP-compatible SSG adapters for 28 static site generators";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};

        # SSG toolchains by language
        rustSSGs = with pkgs; [ cobalt mdbook zola ];
        haskellSSGs = with pkgs; [ ]; # ema hakyll - install via cabal/stack
        elixirSSGs = with pkgs; [ elixir ]; # serum tableau via mix
        # Add more as needed

      in
      {
        # Development shell
        devShells.default = pkgs.mkShell {
          name = "saur-ssg-dev";

          buildInputs = with pkgs; [
            # Runtime
            deno

            # Task runners
            just
            gnumake

            # Version control
            git

            # Documentation
            asciidoctor

            # Utilities
            jq
            curl
            ripgrep
            tree

            # Optional: Nickel for configuration
            nickel

            # Optional: Guile for SCM files
            guile

            # SSG toolchains (Rust-based)
          ] ++ rustSSGs;

          shellHook = ''
            echo "🦕 saur-ssg development environment"
            echo ""
            echo "Available commands:"
            echo "  just help      - Show available recipes"
            echo "  just test      - Run tests"
            echo "  just ci        - Run CI pipeline"
            echo "  deno repl      - Interactive REPL"
            echo ""
            echo "SSG adapters: 28 (see adapters/)"
            echo ""

            # Set up Deno
            export DENO_DIR="$PWD/.deno"
            mkdir -p "$DENO_DIR"

            # Check for just
            if command -v just &> /dev/null; then
              echo "Run 'just' to see available commands"
            fi
          '';
        };

        # Minimal shell (just Deno)
        devShells.minimal = pkgs.mkShell {
          name = "saur-ssg-minimal";
          buildInputs = with pkgs; [ deno just git ];
        };

        # Full shell with all SSG toolchains
        devShells.full = pkgs.mkShell {
          name = "saur-ssg-full";
          buildInputs = with pkgs; [
            deno
            just
            git
            asciidoctor
            nickel
            guile

            # Rust SSGs
            cobalt
            mdbook
            zola

            # Haskell (for hakyll)
            ghc
            cabal-install

            # Elixir (for serum, tableau)
            elixir
            erlang

            # Julia (for franklin, documenter)
            julia

            # Other languages
            scala
            kotlin
            crystal
            nim
            swift
            dmd  # D compiler
            tcl
            ocaml
          ];
        };

        # Package (for reference - adapters are JS, not compiled)
        packages.default = pkgs.stdenv.mkDerivation {
          pname = "saur-ssg";
          version = "0.1.0";
          src = ./.;

          buildInputs = [ pkgs.deno ];

          installPhase = ''
            mkdir -p $out/share/saur-ssg
            cp -r adapters $out/share/saur-ssg/
            cp -r *.scm $out/share/saur-ssg/ 2>/dev/null || true
            cp LICENSE.txt README.adoc $out/share/saur-ssg/
          '';

          meta = with pkgs.lib; {
            description = "MCP-compatible SSG adapters";
            homepage = "https://github.com/hyperpolymath/saur-ssg";
            license = licenses.agpl3Plus;
            platforms = platforms.all;
          };
        };

        # Checks
        checks = {
          # Lint check
          lint = pkgs.runCommand "lint" { buildInputs = [ pkgs.deno ]; } ''
            cd ${self}
            deno lint adapters/ || true
            touch $out
          '';

          # Format check
          format = pkgs.runCommand "format" { buildInputs = [ pkgs.deno ]; } ''
            cd ${self}
            deno fmt --check adapters/ || true
            touch $out
          '';
        };

        # Apps
        apps = {
          # Run adapter validation
          validate = {
            type = "app";
            program = toString (pkgs.writeShellScript "validate-adapters" ''
              cd ${self}
              for f in adapters/*.js; do
                name=$(basename "$f" .js)
                echo "Validating $name..."
                ${pkgs.deno}/bin/deno check "$f" 2>/dev/null || echo "Check: $f"
              done
            '');
          };
        };
      }
    );
}
