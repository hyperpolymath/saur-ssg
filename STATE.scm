;; SPDX-License-Identifier: AGPL-3.0-or-later
;; STATE.scm - Project state for saur-ssg
;; Embedded scripting site generation in Squirrel

(state
  (metadata
    (version "1.0.0")
    (schema-version "1.0")
    (created "2024-12-01")
    (updated "2025-01-18")
    (project "saur-ssg")
    (repo "hyperpolymath/saur-ssg"))
  
  (project-context
    (name "saur-ssg")
    (tagline "Embedded scripting site generation in Squirrel")
    (tech-stack
      (primary-language "Squirrel")
      (adapter-language "ReScript")
      (runtime "Squirrel VM")
      (task-runner "Just")
      (container "Podman")))
  
  (current-position
    (phase "implemented")
    (overall-completion 100)
    (components
      ((name "squirrel-core")
       (status "complete")
       (completion 100)
       (description "Squirrel SSG engine"))
      ((name "rescript-adapter")
       (status "complete")
       (completion 100)
       (description "ReScript poly-ssg adapter"))
      ((name "template-system")
       (status "complete")
       (completion 100)
       (description "Squirrel-powered template processing"))
      ((name "containerization")
       (status "complete")
       (completion 100)
       (description "Podman/OCI container support")))
    (working-features
      ("Lightweight embedded scripting"
       "Game engine integration ready"
       "C/C++ embedding support"
       "Fast VM execution"
       "Dynamic typing with classes")))
  
  (route-to-mvp
    (milestones
      ((id "m1")
       (name "Squirrel Core Engine")
       (status "complete")
       (items
         (("Site generation logic" . "complete")
          ("Template processing" . "complete")
          ("Content transformation" . "complete"))))
      ((id "m2")
       (name "Embedding Support")
       (status "complete")
       (items
         (("Squirrel VM integration" . "complete")
          ("Native binding support" . "complete")
          ("Hot reload capability" . "complete"))))
      ((id "m3")
       (name "poly-ssg Integration")
       (status "complete")
       (items
         (("ReScript adapter" . "complete")
          ("MCP protocol support" . "complete")
          ("Containerization" . "complete"))))))
  
  (blockers-and-issues
    (critical ())
    (high ())
    (medium ())
    (low ()))
  
  (critical-next-actions
    (immediate
      ("Document game engine integration patterns"))
    (this-week
      ("Create example sites with embedded Squirrel logic"))
    (this-month
      ("Build interactive documentation generator demo"))))
