;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;; ECOSYSTEM.scm — saur-ssg

(ecosystem
  (version "1.0.0")
  (name "saur-ssg")
  (type "satellite")
  (purpose "MCP-compatible static site generator adapters for the hyperpolymath ecosystem")

  (position-in-ecosystem
    "Satellite SSG implementation providing MCP adapters for 28 static site generators.
     Part of hyperpolymath ecosystem. Follows RSR guidelines.
     Syncs adapters from the poly-ssg-mcp hub.")

  (related-projects
    (project
      (name "poly-ssg-mcp")
      (url "https://github.com/hyperpolymath/poly-ssg-mcp")
      (relationship "hub")
      (description "Unified MCP server for 28 SSGs - provides adapter interface")
      (differentiation
        "poly-ssg-mcp = Hub with all SSG adapters via MCP
         saur-ssg = Satellite SSG implementation using the hub"))
    (project
      (name "rhodium-standard-repositories")
      (url "https://github.com/hyperpolymath/rhodium-standard-repositories")
      (relationship "standard")
      (description "RSR Gold compliance guidelines")))

  (supported-ssgs
    (rust "Cobalt" "mdBook" "Zola")
    (haskell "Ema" "Hakyll")
    (elixir "Serum" "Tableau" "NimblePublisher")
    (clojure "Babashka" "Cryogen" "Perun")
    (julia "Documenter.jl" "Franklin.jl" "StaticWebPages.jl")
    (scala "Laika" "ScalaTex")
    (common-lisp "Coleslaw")
    (fsharp "Fornax")
    (racket "Frog" "Pollen")
    (kotlin "Orchid")
    (crystal "Marmot")
    (nim "Nimrod")
    (swift "Publish")
    (d "Reggae")
    (tcl "Wub")
    (ocaml "YOCaml")
    (erlang "Zotonic"))

  (what-this-is "Satellite SSG implementation with 28 MCP-compatible adapters")
  (what-this-is-not "- NOT a standalone SSG\n- NOT exempt from RSR compliance"))
