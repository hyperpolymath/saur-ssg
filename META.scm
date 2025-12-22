;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 hyperpolymath
;;; META.scm — saur-ssg

(define-module (saur-ssg meta)
  #:export (architecture-decisions development-practices design-rationale
            component-inventory technology-stack))

;; ─────────────────────────────────────────────────────────────────────────────
;; ARCHITECTURE DECISIONS (ADRs)
;; ─────────────────────────────────────────────────────────────────────────────

(define architecture-decisions
  '((adr-001
     (title . "RSR Gold Compliance")
     (status . "accepted")
     (date . "2025-12-15")
     (context . "Satellite SSG project in the hyperpolymath ecosystem")
     (decision . "Follow Rhodium Standard Repository guidelines")
     (consequences . ("SHA-pinned GitHub Actions"
                      "SPDX headers on all files"
                      "Multi-platform CI/CD"
                      "Comprehensive security policy")))

    (adr-002
     (title . "MCP Adapter Architecture")
     (status . "accepted")
     (date . "2025-12-16")
     (context . "Need standardized interface for 28 SSG tools")
     (decision . "Use MCP-compatible adapters synced from poly-ssg-mcp hub")
     (consequences . ("Consistent API across all SSGs"
                      "CLI wrapper pattern via Deno.Command"
                      "Tool definitions with JSON Schema")))

    (adr-003
     (title . "Deno Runtime")
     (status . "accepted")
     (date . "2025-12-17")
     (context . "Need secure, modern JavaScript runtime for adapters")
     (decision . "Use Deno as primary runtime")
     (consequences . ("Built-in TypeScript support"
                      "Secure by default (explicit permissions)"
                      "Modern ES modules"
                      "Built-in tooling (fmt, lint, test)")))

    (adr-004
     (title . "Scheme Configuration Files")
     (status . "accepted")
     (date . "2025-12-17")
     (context . "Need expressive, version-controlled project metadata")
     (decision . "Use .scm files for META, STATE, ECOSYSTEM, PLAYBOOK, AGENTIC, NEUROSYM")
     (consequences . ("Homoiconic configuration"
                      "Machine-readable metadata"
                      "Guile-compatible syntax")))

    (adr-005
     (title . "Just + Must Task Runners")
     (status . "accepted")
     (date . "2025-12-17")
     (context . "Need standardized build/test/deploy commands")
     (decision . "Use Justfile for recipes, Mustfile for mandatory gates")
     (consequences . ("Consistent developer experience"
                      "Clear separation of optional vs required"
                      "Pre-commit/pre-push automation")))))

;; ─────────────────────────────────────────────────────────────────────────────
;; DEVELOPMENT PRACTICES
;; ─────────────────────────────────────────────────────────────────────────────

(define development-practices
  '((code-style
      (languages . ("javascript" "typescript" "scheme"))
      (formatter . "deno fmt")
      (linter . "deno lint")
      (conventions . "See copilot-instructions.md"))

    (security
      (sast . "CodeQL")
      (credentials . "Environment variables only")
      (input-validation . "Required for all CLI args")
      (audit . "just audit"))

    (testing
      (framework . "deno test")
      (coverage-minimum . 70)
      (types . ("unit" "integration" "e2e")))

    (versioning
      (scheme . "SemVer 2.0.0")
      (tracking . "STATE.scm"))

    (documentation
      (format . "AsciiDoc (.adoc)")
      (exception . "GitHub-required files use Markdown")
      (api-docs . "deno doc"))

    (ci-cd
      (platform . "GitHub Actions")
      (security . "SHA-pinned actions")
      (pipeline . "just ci"))))

;; ─────────────────────────────────────────────────────────────────────────────
;; COMPONENT INVENTORY (44 components)
;; ─────────────────────────────────────────────────────────────────────────────

(define component-inventory
  '((category-1-adapters  ; 28 components
      (name . "SSG Adapters")
      (count . 28)
      (location . "adapters/")
      (components
        ((rust . ("cobalt" "mdbook" "zola"))
         (haskell . ("ema" "hakyll"))
         (elixir . ("serum" "tableau" "nimble-publisher"))
         (clojure . ("babashka" "cryogen" "perun"))
         (julia . ("documenter" "franklin" "staticwebpages"))
         (scala . ("laika" "scalatex"))
         (common-lisp . ("coleslaw"))
         (fsharp . ("fornax"))
         (racket . ("frog" "pollen"))
         (kotlin . ("orchid"))
         (crystal . ("marmot"))
         (nim . ("nimrod"))
         (swift . ("publish"))
         (d . ("reggae"))
         (tcl . ("wub"))
         (ocaml . ("yocaml"))
         (erlang . ("zotonic")))))

    (category-2-build-system  ; 4 components
      (name . "Build System")
      (count . 4)
      (components
        ((justfile ((location . "Justfile") (status . "complete")))
         (mustfile ((location . "Mustfile") (status . "complete")))
         (containerization ((location . "Containerfile") (status . "pending")))
         (nix ((location . "flake.nix") (status . "pending"))))))

    (category-3-configuration  ; 3 components
      (name . "Configuration")
      (count . 3)
      (components
        ((nickel ((location . "config.ncl") (status . "template")))
         (environment ((location . ".env.example") (status . "pending")))
         (gitattributes ((location . ".gitattributes") (status . "complete"))))))

    (category-4-testing  ; 4 components
      (name . "Testing")
      (count . 4)
      (components
        ((unit-tests ((location . "tests/") (status . "pending")))
         (e2e-tests ((location . "tests/e2e/") (status . "pending")))
         (coverage ((location . "coverage/") (status . "pending")))
         (ci-pipeline ((location . ".github/workflows/") (status . "partial"))))))

    (category-5-documentation  ; 8 components
      (name . "Documentation")
      (count . 8)
      (components
        ((readme ((location . "README.adoc") (status . "pending")))
         (cookbook ((location . "cookbook.adoc") (status . "complete")))
         (security ((location . "SECURITY.md") (status . "complete")))
         (conduct ((location . "CODE_OF_CONDUCT.md") (status . "complete")))
         (contributing ((location . "CONTRIBUTING.md") (status . "complete")))
         (license ((location . "LICENSE.txt") (status . "complete")))
         (adapters-readme ((location . "adapters/README.md") (status . "complete")))
         (changelog ((location . "CHANGELOG.md") (status . "pending"))))))

    (category-6-scm-files  ; 6 components
      (name . "SCM Configuration")
      (count . 6)
      (components
        ((meta ((location . "META.scm") (status . "complete")))
         (state ((location . "STATE.scm") (status . "complete")))
         (ecosystem ((location . "ECOSYSTEM.scm") (status . "complete")))
         (playbook ((location . "PLAYBOOK.scm") (status . "complete")))
         (agentic ((location . "AGENTIC.scm") (status . "complete")))
         (neurosym ((location . "NEUROSYM.scm") (status . "complete"))))))

    (category-7-github  ; 6 components
      (name . "GitHub Configuration")
      (count . 6)
      (components
        ((codeql ((location . ".github/workflows/codeql.yml") (status . "complete")))
         (dependabot ((location . ".github/dependabot.yml") (status . "complete")))
         (funding ((location . ".github/FUNDING.yml") (status . "complete")))
         (issue-templates ((location . ".github/ISSUE_TEMPLATE/") (status . "complete")))
         (pr-template ((location . ".github/pull_request_template.md") (status . "pending")))
         (ci-workflow ((location . ".github/workflows/ci.yml") (status . "pending"))))))

    (category-8-security  ; 3 components
      (name . "Security")
      (count . 3)
      (components
        ((security-policy ((location . "SECURITY.md") (status . "complete")))
         (git-hooks ((location . ".git/hooks/") (status . "template")))
         (audit ((location . "just audit") (status . "complete"))))))

    (category-9-tooling  ; 3 components
      (name . "Development Tooling")
      (count . 3)
      (components
        ((copilot-config ((location . "copilot-instructions.md") (status . "complete")))
         (gitignore ((location . ".gitignore") (status . "complete")))
         (editorconfig ((location . ".editorconfig") (status . "pending"))))))

    (category-10-ecosystem  ; 3 components
      (name . "Ecosystem Integration")
      (count . 3)
      (components
        ((hub-sync ((location . "adapters-sync") (status . "complete")))
         (mcp-interface ((location . "MCP tools") (status . "complete")))
         (rsr-compliance ((location . "RSR Gold") (status . "complete")))))))

  ;; Summary
  (total . 68)  ; Actual: 28 adapters + 40 other = 68 (grouped as 44 logical)
  (logical-groups . 10))

;; ─────────────────────────────────────────────────────────────────────────────
;; TECHNOLOGY STACK
;; ─────────────────────────────────────────────────────────────────────────────

(define technology-stack
  '((runtime
      (primary . "Deno")
      (version . "1.x")
      (features . ("TypeScript" "ES Modules" "Permissions")))

    (languages
      (adapters . "JavaScript (ES2022+)")
      (configuration . "Scheme (Guile-compatible)")
      (documentation . "AsciiDoc"))

    (tools
      (task-runner . "just")
      (gate-runner . "must (alias for Mustfile)")
      (linter . "deno lint")
      (formatter . "deno fmt")
      (tester . "deno test")
      (bundler . "deno bundle"))

    (infrastructure
      (vcs . "Git")
      (hosting . "GitHub")
      (ci . "GitHub Actions")
      (container . "Podman/Docker")
      (package . "Nix (optional)"))))

;; ─────────────────────────────────────────────────────────────────────────────
;; DESIGN RATIONALE
;; ─────────────────────────────────────────────────────────────────────────────

(define design-rationale
  '((why-rsr
      "RSR (Rhodium Standard Repository) ensures consistency, security,
       and maintainability across the hyperpolymath ecosystem.")

    (why-mcp
      "MCP (Model Context Protocol) provides a standardized tool interface
       for AI assistants, enabling seamless integration with LLMs.")

    (why-satellite
      "The satellite pattern allows focused implementation while the hub
       (poly-ssg-mcp) manages the complexity of 28 SSG integrations.")

    (why-scheme-config
      "Scheme provides homoiconic configuration that's both human-readable
       and machine-processable, with full programming language expressivity.")

    (why-justfile
      "Justfile provides a modern, cross-platform task runner with better
       ergonomics than Makefile and clearer semantics than shell scripts.")))
