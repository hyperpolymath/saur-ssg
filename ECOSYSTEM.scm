;; SPDX-License-Identifier: AGPL-3.0-or-later
;; ECOSYSTEM.scm - Ecosystem positioning for saur-ssg
;; Media Type: application/vnd.ecosystem+scm

(ecosystem
  (version "1.0.0")
  (name "saur-ssg")
  (type "ssg-engine")
  (purpose "Embedded scripting site generation using Squirrel for game engines, interactive applications, and lightweight scripting scenarios")
  
  (position-in-ecosystem
    (role "satellite")
    (hub "poly-ssg-mcp")
    (category "embedded-scripting")
    (distinguishing-factor "Squirrel's game engine heritage for interactive content generation"))
  
  (related-projects
    ((name "poly-ssg-mcp")
     (relationship "hub")
     (description "Central MCP hub providing unified SSG orchestration"))
    ((name "orbital-ssg")
     (relationship "sibling")
     (description "Grain/WASM-based SSG for portable bytecode"))
    ((name "shift-ssg")
     (relationship "sibling")
     (description "Wren-based SSG with fiber concurrency"))
    ((name "my-ssg")
     (relationship "sibling")
     (description "Janet-based SSG for Lisp-style scripting"))
    ((name "baremetal-ssg")
     (relationship "sibling")
     (description "RISC-V assembly SSG for bare metal")))
  
  (what-this-is
    ("A static site generator written in Squirrel language"
     "Designed for embedding in game engines and applications"
     "Lightweight VM with fast startup"
     "C/C++ native binding support"
     "Part of the poly-ssg ecosystem with ReScript adapter"
     "Ideal for interactive documentation and in-app help"))
  
  (what-this-is-not
    ("Not a general-purpose web framework"
     "Not optimized for large-scale static sites"
     "Not dependent on heavy runtimes"
     "Not limited to traditional static output")))
