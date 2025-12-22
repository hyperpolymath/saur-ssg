;;; AGENTIC.scm — saur-ssg
;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 hyperpolymath
;;
;; Agentic AI configuration: MCP interface, tool definitions, agent behaviors

(define-module (saur-ssg agentic)
  #:export (mcp-config agent-capabilities tool-registry behaviors))

;; ─────────────────────────────────────────────────────────────────────────────
;; MCP CONFIGURATION - Model Context Protocol settings
;; ─────────────────────────────────────────────────────────────────────────────

(define mcp-config
  '((protocol
      (version . "1.0")
      (transport . "stdio")
      (capabilities . ("tools" "resources")))

    (server
      (name . "saur-ssg")
      (version . "0.1.0")
      (description . "MCP server providing 28 SSG adapters"))

    (authentication
      (method . "none")
      (note . "Local execution only"))

    (rate-limits
      (requests-per-minute . 60)
      (concurrent-tools . 5))))

;; ─────────────────────────────────────────────────────────────────────────────
;; AGENT CAPABILITIES - What AI agents can do with this project
;; ─────────────────────────────────────────────────────────────────────────────

(define agent-capabilities
  '((code-generation
      (enabled . #t)
      (languages . ("javascript" "typescript"))
      (scope . "adapters only")
      (requires-review . #t))

    (code-review
      (enabled . #t)
      (checks . ("security" "style" "correctness" "performance"))
      (guidelines . "copilot-instructions.md"))

    (documentation
      (enabled . #t)
      (formats . ("asciidoc" "markdown"))
      (auto-generate . ("api-docs" "changelog-entries")))

    (testing
      (enabled . #t)
      (can-write-tests . #t)
      (can-run-tests . #t)
      (coverage-target . 70))

    (refactoring
      (enabled . #t)
      (scope . "within-file")
      (requires-tests . #t))

    (security-analysis
      (enabled . #t)
      (can-audit . #t)
      (can-fix . #t)
      (requires-review . #t))))

;; ─────────────────────────────────────────────────────────────────────────────
;; TOOL REGISTRY - Available MCP tools across all adapters
;; ─────────────────────────────────────────────────────────────────────────────

(define tool-registry
  '((common-tools
      (description . "Tools available in most adapters")
      (tools
        (("{ssg}_init" . "Initialize new project")
         ("{ssg}_build" . "Build static site")
         ("{ssg}_serve" . "Serve site locally")
         ("{ssg}_version" . "Show SSG version"))))

    (extended-tools
      (description . "Additional tools in some adapters")
      (tools
        (("{ssg}_check" . "Validate site configuration")
         ("{ssg}_clean" . "Remove build artifacts")
         ("{ssg}_deploy" . "Deploy to hosting")
         ("{ssg}_new" . "Create new content"))))

    (adapter-list
      (rust . ("cobalt" "mdbook" "zola"))
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

;; ─────────────────────────────────────────────────────────────────────────────
;; BEHAVIORS - Expected agent behaviors and constraints
;; ─────────────────────────────────────────────────────────────────────────────

(define behaviors
  '((safety
      (never
        ("Execute arbitrary shell commands")
        ("Access files outside project directory")
        ("Commit code without review")
        ("Push to protected branches")
        ("Expose secrets or credentials"))
      (always
        ("Validate input parameters")
        ("Log tool executions")
        ("Respect rate limits")
        ("Follow security guidelines")))

    (code-style
      (follow . "copilot-instructions.md")
      (format . "deno fmt")
      (lint . "deno lint")
      (commit-style . "conventional-commits"))

    (interaction
      (verbose . #f)
      (explain-reasoning . #t)
      (ask-before-destructive . #t)
      (suggest-alternatives . #t))

    (error-handling
      (retry-on-transient . #t)
      (max-retries . 3)
      (backoff . "exponential")
      (report-failures . #t))))

;; ─────────────────────────────────────────────────────────────────────────────
;; PROMPTS - System prompts for AI agents working on this project
;; ─────────────────────────────────────────────────────────────────────────────

(define agent-prompts
  '((code-reviewer
      (role . "Code reviewer for saur-ssg adapters")
      (context . "MCP-compatible SSG adapters in JavaScript/Deno")
      (guidelines
        ("Follow copilot-instructions.md strictly")
        ("Flag security issues immediately")
        ("Ensure SPDX headers present")
        ("Verify MCP interface compliance")
        ("Check for proper error handling")))

    (adapter-developer
      (role . "Developer creating new SSG adapters")
      (context . "Each adapter wraps an SSG CLI as MCP tools")
      (guidelines
        ("Export: name, language, description, tools, connect, disconnect, isConnected")
        ("Use Deno.Command for CLI execution")
        ("Include init, build, serve, version tools minimum")
        ("Add SPDX-License-Identifier: MIT header")
        ("Follow existing adapter patterns")))

    (documentation-writer
      (role . "Documentation maintainer")
      (context . "AsciiDoc for docs, Markdown for GitHub files")
      (guidelines
        ("Use British English spelling")
        ("Include code examples")
        ("Cross-reference related docs")
        ("Keep README.adoc comprehensive")
        ("Update cookbook.adoc with new recipes")))))

;; ─────────────────────────────────────────────────────────────────────────────
;; HOOKS - Integration with external AI systems
;; ─────────────────────────────────────────────────────────────────────────────

(define hooks
  '((pre-generation
      (validate-request . #t)
      (check-permissions . #t)
      (log-intent . #t))

    (post-generation
      (validate-output . #t)
      (run-linter . #t)
      (security-scan . #t))

    (on-error
      (log-error . #t)
      (suggest-fix . #t)
      (escalate-if-critical . #t))))
