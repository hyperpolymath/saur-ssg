;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 hyperpolymath
;; ECOSYSTEM.scm — saur-ssg

(ecosystem
  (version "1.0.0")
  (name "saur-ssg")
  (type "satellite")
  (purpose "MCP-compatible static site generator adapters for the hyperpolymath ecosystem")

  ;; ─────────────────────────────────────────────────────────────────────────────
  ;; POSITION IN ECOSYSTEM
  ;; ─────────────────────────────────────────────────────────────────────────────

  (position-in-ecosystem
    "Satellite SSG implementation providing MCP adapters for 28 static site generators.
     Part of hyperpolymath ecosystem. Follows RSR Gold guidelines.
     Syncs adapters from the poly-ssg-mcp hub.

     Architecture:
     ┌─────────────────────────────────────────────────────────────┐
     │                    hyperpolymath Ecosystem                   │
     ├─────────────────────────────────────────────────────────────┤
     │  ┌───────────────┐      ┌───────────────┐                   │
     │  │ poly-ssg-mcp  │ ───► │   saur-ssg    │ (this project)    │
     │  │    (Hub)      │      │  (Satellite)  │                   │
     │  └───────────────┘      └───────────────┘                   │
     │         │                      │                            │
     │         ▼                      ▼                            │
     │  ┌───────────────┐      ┌───────────────┐                   │
     │  │ 28 SSG CLIs   │      │ MCP Interface │                   │
     │  └───────────────┘      └───────────────┘                   │
     └─────────────────────────────────────────────────────────────┘")

  ;; ─────────────────────────────────────────────────────────────────────────────
  ;; RELATED PROJECTS
  ;; ─────────────────────────────────────────────────────────────────────────────

  (related-projects
    (project
      (name "poly-ssg-mcp")
      (url "https://github.com/hyperpolymath/poly-ssg-mcp")
      (relationship "hub")
      (description "Unified MCP server for 28 SSGs - provides adapter interface")
      (sync-command "just adapters-sync")
      (differentiation
        "poly-ssg-mcp = Hub with all SSG adapters via MCP
         saur-ssg = Satellite SSG implementation using the hub"))

    (project
      (name "rhodium-standard-repositories")
      (url "https://github.com/hyperpolymath/rhodium-standard-repositories")
      (relationship "standard")
      (description "RSR Gold compliance guidelines")
      (compliance-level "gold"))

    (project
      (name "mcp-specification")
      (url "https://modelcontextprotocol.io")
      (relationship "protocol")
      (description "Model Context Protocol specification")))

  ;; ─────────────────────────────────────────────────────────────────────────────
  ;; SUPPORTED SSGs (28 total)
  ;; ─────────────────────────────────────────────────────────────────────────────

  (supported-ssgs
    (count 28)

    (by-language
      (rust
        (count 3)
        (ssgs ("Cobalt" "mdBook" "Zola"))
        (characteristics "Systems-level, fast compilation"))

      (haskell
        (count 2)
        (ssgs ("Ema" "Hakyll"))
        (characteristics "Pure functional, type-safe"))

      (elixir
        (count 3)
        (ssgs ("Serum" "Tableau" "NimblePublisher"))
        (characteristics "Concurrent, fault-tolerant"))

      (clojure
        (count 3)
        (ssgs ("Babashka" "Cryogen" "Perun"))
        (characteristics "Lisp, immutable data"))

      (julia
        (count 3)
        (ssgs ("Documenter.jl" "Franklin.jl" "StaticWebPages.jl"))
        (characteristics "Scientific computing, fast"))

      (scala
        (count 2)
        (ssgs ("Laika" "ScalaTex"))
        (characteristics "JVM, functional-OOP hybrid"))

      (common-lisp
        (count 1)
        (ssgs ("Coleslaw"))
        (characteristics "Classic Lisp, macros"))

      (fsharp
        (count 1)
        (ssgs ("Fornax"))
        (characteristics ".NET, ML-style"))

      (racket
        (count 2)
        (ssgs ("Frog" "Pollen"))
        (characteristics "Scheme-derived, DSL-friendly"))

      (kotlin
        (count 1)
        (ssgs ("Orchid"))
        (characteristics "JVM, modern syntax"))

      (crystal
        (count 1)
        (ssgs ("Marmot"))
        (characteristics "Ruby-like, compiled"))

      (nim
        (count 1)
        (ssgs ("Nimrod"))
        (characteristics "Python-like, compiled"))

      (swift
        (count 1)
        (ssgs ("Publish"))
        (characteristics "Apple ecosystem, type-safe"))

      (d
        (count 1)
        (ssgs ("Reggae"))
        (characteristics "Systems, metaprogramming"))

      (tcl
        (count 1)
        (ssgs ("Wub"))
        (characteristics "Scripting, embedded"))

      (ocaml
        (count 1)
        (ssgs ("YOCaml"))
        (characteristics "ML-family, fast"))

      (erlang
        (count 1)
        (ssgs ("Zotonic"))
        (characteristics "BEAM VM, distributed"))))

  ;; ─────────────────────────────────────────────────────────────────────────────
  ;; LANGUAGE FAMILIES
  ;; ─────────────────────────────────────────────────────────────────────────────

  (language-families
    (functional ("Haskell" "Elixir" "Clojure" "F#" "Racket" "OCaml" "Erlang"))
    (systems ("Rust" "Crystal" "Nim" "Swift" "D"))
    (scientific ("Julia" "Scala"))
    (lisp ("Clojure" "Common Lisp" "Racket"))
    (jvm ("Scala" "Kotlin" "Clojure"))
    (beam ("Elixir" "Erlang")))

  ;; ─────────────────────────────────────────────────────────────────────────────
  ;; ECOSYSTEM DEPENDENCIES
  ;; ─────────────────────────────────────────────────────────────────────────────

  (dependencies
    (runtime
      (required ("deno"))
      (optional ("just" "nickel" "guile")))

    (ssg-toolchains
      (note "Each SSG requires its own toolchain installed")
      (install-guide "See adapters/README.md")))

  ;; ─────────────────────────────────────────────────────────────────────────────
  ;; WHAT THIS IS / IS NOT
  ;; ─────────────────────────────────────────────────────────────────────────────

  (what-this-is
    "• Satellite SSG implementation with 28 MCP-compatible adapters
     • Standardized interface to diverse SSG toolchains
     • Part of the hyperpolymath polyglot ecosystem
     • RSR Gold compliant repository
     • Bridge between AI assistants and static site generators")

  (what-this-is-not
    "• NOT a standalone SSG (uses existing SSG CLIs)
     • NOT the hub (that's poly-ssg-mcp)
     • NOT exempt from RSR compliance
     • NOT a replacement for learning individual SSGs
     • NOT for production use without understanding the underlying SSG"))
