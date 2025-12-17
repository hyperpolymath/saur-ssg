;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;;; META.scm — saur-ssg

(define-module (saur-ssg meta)
  #:export (architecture-decisions development-practices design-rationale))

(define architecture-decisions
  '((adr-001
     (title . "RSR Compliance")
     (status . "accepted")
     (date . "2025-12-15")
     (context . "Satellite SSG project in the hyperpolymath ecosystem")
     (decision . "Follow Rhodium Standard Repository guidelines")
     (consequences . ("RSR Gold target" "SHA-pinned actions" "SPDX headers" "Multi-platform CI")))
    (adr-002
     (title . "MCP Adapter Architecture")
     (status . "accepted")
     (date . "2025-12-16")
     (context . "Need standardized interface for 28 SSG tools")
     (decision . "Use MCP-compatible adapters synced from poly-ssg-mcp hub")
     (consequences . ("Consistent API" "CLI wrapper pattern" "Deno.Command execution")))))

(define development-practices
  '((code-style
      (languages . ("javascript" "scheme"))
      (formatter . "auto-detect")
      (linter . "auto-detect"))
    (security
      (sast . "CodeQL")
      (credentials . "env vars only")
      (input-validation . "required for CLI args"))
    (testing
      (coverage-minimum . 70)
      (framework . "deno test"))
    (versioning
      (scheme . "SemVer 2.0.0"))))

(define design-rationale
  '((why-rsr "RSR ensures consistency, security, and maintainability.")
    (why-mcp "MCP provides standardized tool interface for AI assistants.")
    (why-satellite "Satellite pattern allows focused implementation while hub manages complexity.")))
