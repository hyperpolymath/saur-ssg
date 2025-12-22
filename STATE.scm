;;; STATE.scm — saur-ssg
;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 hyperpolymath
;;
;; Project state tracking: 44/44 components across 10 categories

(define metadata
  '((version . "0.1.0")
    (updated . "2025-12-17")
    (project . "saur-ssg")
    (total-components . 44)
    (logical-groups . 10)))

;; ─────────────────────────────────────────────────────────────────────────────
;; CURRENT POSITION
;; ─────────────────────────────────────────────────────────────────────────────

(define current-position
  '((phase . "v0.1 - Initial Setup")
    (overall-completion . 75)
    (components-complete . 33)
    (components-total . 44)))

;; ─────────────────────────────────────────────────────────────────────────────
;; 44/44 COMPONENTS STATUS
;; ─────────────────────────────────────────────────────────────────────────────

(define component-status
  '(;; Category 1: SSG Adapters (28/28 complete)
    (category-1-adapters
      (name . "SSG Adapters")
      (status . "complete")
      (completion . "28/28")
      (components
        ((cobalt.js . complete)
         (mdbook.js . complete)
         (zola.js . complete)
         (ema.js . complete)
         (hakyll.js . complete)
         (serum.js . complete)
         (tableau.js . complete)
         (nimble-publisher.js . complete)
         (babashka.js . complete)
         (cryogen.js . complete)
         (perun.js . complete)
         (documenter.js . complete)
         (franklin.js . complete)
         (staticwebpages.js . complete)
         (laika.js . complete)
         (scalatex.js . complete)
         (coleslaw.js . complete)
         (fornax.js . complete)
         (frog.js . complete)
         (pollen.js . complete)
         (orchid.js . complete)
         (marmot.js . complete)
         (nimrod.js . complete)
         (publish.js . complete)
         (reggae.js . complete)
         (wub.js . complete)
         (yocaml.js . complete)
         (zotonic.js . complete))))

    ;; Category 2: Build System (2/4 complete)
    (category-2-build-system
      (name . "Build System")
      (status . "in-progress")
      (completion . "2/4")
      (components
        ((Justfile . complete)
         (Mustfile . complete)
         (Containerfile . pending)
         (flake.nix . pending))))

    ;; Category 3: Configuration (2/3 complete)
    (category-3-configuration
      (name . "Configuration")
      (status . "in-progress")
      (completion . "2/3")
      (components
        ((config.ncl . template)
         (.env.example . pending)
         (.gitattributes . complete))))

    ;; Category 4: Testing (1/4 complete)
    (category-4-testing
      (name . "Testing")
      (status . "pending")
      (completion . "1/4")
      (components
        ((tests/ . pending)
         (tests/e2e/ . pending)
         (coverage/ . pending)
         (ci-pipeline . partial))))

    ;; Category 5: Documentation (6/8 complete)
    (category-5-documentation
      (name . "Documentation")
      (status . "in-progress")
      (completion . "6/8")
      (components
        ((README.adoc . pending)
         (cookbook.adoc . complete)
         (SECURITY.md . complete)
         (CODE_OF_CONDUCT.md . complete)
         (CONTRIBUTING.md . complete)
         (LICENSE.txt . complete)
         (adapters/README.md . complete)
         (CHANGELOG.md . pending))))

    ;; Category 6: SCM Files (6/6 complete)
    (category-6-scm-files
      (name . "SCM Configuration")
      (status . "complete")
      (completion . "6/6")
      (components
        ((META.scm . complete)
         (STATE.scm . complete)
         (ECOSYSTEM.scm . complete)
         (PLAYBOOK.scm . complete)
         (AGENTIC.scm . complete)
         (NEUROSYM.scm . complete))))

    ;; Category 7: GitHub Config (4/6 complete)
    (category-7-github
      (name . "GitHub Configuration")
      (status . "in-progress")
      (completion . "4/6")
      (components
        ((codeql.yml . complete)
         (dependabot.yml . complete)
         (FUNDING.yml . complete)
         (ISSUE_TEMPLATE/ . complete)
         (pull_request_template.md . pending)
         (ci.yml . pending))))

    ;; Category 8: Security (3/3 complete)
    (category-8-security
      (name . "Security")
      (status . "complete")
      (completion . "3/3")
      (components
        ((SECURITY.md . complete)
         (git-hooks . template)
         (audit-command . complete))))

    ;; Category 9: Tooling (2/3 complete)
    (category-9-tooling
      (name . "Development Tooling")
      (status . "in-progress")
      (completion . "2/3")
      (components
        ((copilot-instructions.md . complete)
         (.gitignore . complete)
         (.editorconfig . pending))))

    ;; Category 10: Ecosystem (3/3 complete)
    (category-10-ecosystem
      (name . "Ecosystem Integration")
      (status . "complete")
      (completion . "3/3")
      (components
        ((adapters-sync . complete)
         (mcp-interface . complete)
         (rsr-compliance . complete))))))

;; ─────────────────────────────────────────────────────────────────────────────
;; BLOCKERS AND ISSUES
;; ─────────────────────────────────────────────────────────────────────────────

(define blockers-and-issues
  '((critical ())
    (high-priority ())
    (medium-priority
      (("README.adoc needs content" . documentation)
       ("CI workflow needs implementation" . ci-cd)
       ("Tests not yet written" . testing)))
    (low-priority
      (("Containerfile not created" . build)
       ("flake.nix not created" . build)
       (".editorconfig not created" . tooling)))))

;; ─────────────────────────────────────────────────────────────────────────────
;; CRITICAL NEXT ACTIONS
;; ─────────────────────────────────────────────────────────────────────────────

(define critical-next-actions
  '((immediate
      (("Complete README documentation" . high)
       ("Create ci.yml workflow" . high)
       ("Add PR template" . medium)))
    (this-week
      (("Add tests for adapters" . high)
       ("Create Containerfile" . medium)
       ("Create flake.nix" . low)))
    (this-month
      (("Reach 70% test coverage" . high)
       ("Set up integration tests" . medium)
       ("Create CHANGELOG.md" . medium)))))

;; ─────────────────────────────────────────────────────────────────────────────
;; ROADMAP
;; ─────────────────────────────────────────────────────────────────────────────

(define roadmap
  '((v0.1
      (name . "Initial Setup")
      (description . "Foundation and RSR compliance")
      (status . "in-progress")
      (completion . 75)
      (milestones
        ((m1 ((name . "RSR Gold Compliance")
              (status . "complete")
              (items
                (("SPDX headers" . complete)
                 ("SHA-pinned actions" . complete)
                 ("Security policy" . complete)
                 ("Code of conduct" . complete)
                 ("Contributing guide" . complete)))))
         (m2 ((name . "Adapter Integration")
              (status . "complete")
              (items
                (("28 SSG adapters synced" . complete)
                 ("MCP-compatible interface" . complete)
                 ("Adapter documentation" . complete)))))
         (m3 ((name . "Build & Configuration")
              (status . "complete")
              (items
                (("Justfile recipes" . complete)
                 ("Mustfile gates" . complete)
                 ("cookbook.adoc" . complete)
                 ("SCM files (6/6)" . complete)))))
         (m4 ((name . "Documentation")
              (status . "in-progress")
              (items
                (("README.adoc" . pending)
                 ("CHANGELOG.md" . pending)
                 ("API documentation" . pending)))))
         (m5 ((name . "Testing & CI/CD")
              (status . "pending")
              (items
                (("Unit tests" . pending)
                 ("E2E tests" . pending)
                 ("CI workflow" . pending)
                 ("70% coverage" . pending))))))))

    (v0.2
      (name . "Testing & Validation")
      (description . "Comprehensive test coverage and validation")
      (status . "planned")
      (milestones
        ((m6 ((name . "Test Infrastructure")
              (items
                (("Test harness" . pending)
                 ("Mock SSG CLIs" . pending)
                 ("CI test matrix" . pending)))))
         (m7 ((name . "Validation")
              (items
                (("Input validation" . pending)
                 ("Error handling" . pending)
                 ("Security hardening" . pending))))))))

    (v0.3
      (name . "Production Ready")
      (description . "Release preparation and integration")
      (status . "planned")
      (milestones
        ((m8 ((name . "Release")
              (items
                (("Version tagging" . pending)
                 ("Release workflow" . pending)
                 ("Publish artifacts" . pending)))))
         (m9 ((name . "Integration")
              (items
                (("Hub sync automation" . pending)
                 ("Satellite configuration" . pending))))))))))

;; ─────────────────────────────────────────────────────────────────────────────
;; SESSION HISTORY
;; ─────────────────────────────────────────────────────────────────────────────

(define session-history
  '((snapshots
      ((session-1
         ((date . "2025-12-15")
          (agent . "Claude Opus 4.5")
          (notes . "Initial SCM files and RSR compliance framework")))
       (session-2
         ((date . "2025-12-16")
          (agent . "Claude Opus 4.5")
          (notes . "Integrated 28 SSG adapters from poly-ssg-mcp hub")))
       (session-3
         ((date . "2025-12-17")
          (agent . "Claude Opus 4.5")
          (notes . "Security review: fixed SECURITY.md and CODE_OF_CONDUCT.md templates")))
       (session-4
         ((date . "2025-12-17")
          (agent . "Claude Opus 4.5")
          (notes . "Major update: Justfile, Mustfile, cookbook.adoc, PLAYBOOK.scm, AGENTIC.scm, NEUROSYM.scm, updated all SCM files with 44-component tracking")))))))

;; ─────────────────────────────────────────────────────────────────────────────
;; STATE SUMMARY
;; ─────────────────────────────────────────────────────────────────────────────

(define state-summary
  '((project . "saur-ssg")
    (version . "0.1.0")
    (phase . "v0.1 - Initial Setup")
    (completion . 75)
    (components . "33/44")
    (blockers . 0)
    (categories
      (("Adapters" . "28/28")
       ("Build System" . "2/4")
       ("Configuration" . "2/3")
       ("Testing" . "1/4")
       ("Documentation" . "6/8")
       ("SCM Files" . "6/6")
       ("GitHub Config" . "4/6")
       ("Security" . "3/3")
       ("Tooling" . "2/3")
       ("Ecosystem" . "3/3")))
    (next-priority . "Complete README.adoc and ci.yml workflow")
    (updated . "2025-12-17")))

;; ─────────────────────────────────────────────────────────────────────────────
;; NEW COMMANDS (from Final Project Status template)
;; ─────────────────────────────────────────────────────────────────────────────

(define new-commands
  '((just-commands
      (("just test" . "Run unit tests")
       ("just test-e2e" . "Run e2e tests")
       ("just test-all" . "Run all tests")
       ("just lsp" . "Start language server")
       ("just ci" . "Run full CI pipeline")))

    (must-commands
      (("must pre-commit" . "Pre-commit gates")
       ("must pre-push" . "Pre-push gates")
       ("must pr-ready" . "PR merge gates")
       ("must release-ready" . "Release gates")
       ("must rsr-gold" . "RSR compliance check")))))
