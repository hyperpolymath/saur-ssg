;;; PLAYBOOK.scm — saur-ssg
;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 hyperpolymath
;;
;; Operational playbook: workflows, procedures, and runbooks

(define-module (saur-ssg playbook)
  #:export (workflows procedures runbooks escalation))

;; ─────────────────────────────────────────────────────────────────────────────
;; WORKFLOWS - Standard development workflows
;; ─────────────────────────────────────────────────────────────────────────────

(define workflows
  '((development
      (name . "Development Workflow")
      (steps
        (("Clone repository" . "git clone <url>")
         ("Install dependencies" . "nix develop")
         ("Run tests" . "just test")
         ("Make changes" . "edit adapters/")
         ("Validate" . "just ci")
         ("Commit" . "git commit -m 'type: message'"))))

    (adapter-creation
      (name . "New Adapter Workflow")
      (steps
        (("Copy template" . "cp adapters/_template.js adapters/new.js")
         ("Implement interface" . "export name, language, tools, connect, disconnect")
         ("Add SPDX header" . "// SPDX-License-Identifier: MIT")
         ("Validate interface" . "just adapter-validate new")
         ("Write tests" . "tests/adapters/new_test.js")
         ("Run tests" . "just test")
         ("Commit" . "feat(adapters): add new-ssg adapter"))))

    (release
      (name . "Release Workflow")
      (steps
        (("Run all checks" . "must all")
         ("Update version" . "just release-prep X.Y.Z")
         ("Update CHANGELOG" . "edit CHANGELOG.md")
         ("Update STATE.scm" . "update completion status")
         ("Create bundle" . "just release-bundle")
         ("Tag release" . "git tag vX.Y.Z")
         ("Push" . "git push origin main --tags"))))

    (security-patch
      (name . "Security Patch Workflow")
      (priority . critical)
      (steps
        (("Assess severity" . "CVSS scoring")
         ("Create security branch" . "git checkout -b security/fix-issue")
         ("Implement fix" . "minimal targeted change")
         ("Verify fix" . "just audit")
         ("Fast-track review" . "expedited PR review")
         ("Merge and release" . "immediate patch release")
         ("Notify affected users" . "security advisory"))))))

;; ─────────────────────────────────────────────────────────────────────────────
;; PROCEDURES - Standard operating procedures
;; ─────────────────────────────────────────────────────────────────────────────

(define procedures
  '((code-review
      (name . "Code Review Procedure")
      (checklist
        (("Format check" . "must format-ok")
         ("Lint check" . "must lint-ok")
         ("Test coverage" . "must coverage-ok")
         ("Security audit" . "must security-audit")
         ("SPDX headers" . "must spdx-headers")
         ("Documentation" . "public APIs documented")
         ("Commit format" . "conventional commits"))))

    (adapter-sync
      (name . "Adapter Sync Procedure")
      (frequency . "weekly")
      (steps
        (("Fetch from hub" . "just adapters-sync")
         ("Review changes" . "git diff adapters/")
         ("Validate all" . "for a in adapters/*.js; do just adapter-validate $(basename $a .js); done")
         ("Run tests" . "just test-all")
         ("Commit" . "chore(adapters): sync from poly-ssg-mcp"))))

    (incident-response
      (name . "Incident Response Procedure")
      (steps
        (("Identify" . "assess scope and severity")
         ("Contain" . "isolate affected components")
         ("Eradicate" . "remove root cause")
         ("Recover" . "restore normal operation")
         ("Learn" . "post-incident review"))))

    (dependency-update
      (name . "Dependency Update Procedure")
      (frequency . "weekly via dependabot")
      (steps
        (("Review PR" . "check changelog for breaking changes")
         ("Run tests" . "just test-all")
         ("Security check" . "just audit-deps")
         ("Merge if passing" . "squash merge"))))))

;; ─────────────────────────────────────────────────────────────────────────────
;; RUNBOOKS - Operational runbooks for common tasks
;; ─────────────────────────────────────────────────────────────────────────────

(define runbooks
  '((setup-development
      (name . "Development Environment Setup")
      (prereqs . ("git" "deno" "just"))
      (commands
        ("git clone https://github.com/hyperpolymath/saur-ssg"
         "cd saur-ssg"
         "just hooks-install"
         "just check"
         "just test")))

    (debug-adapter
      (name . "Debug Failing Adapter")
      (steps
        (("Check syntax" . "deno check adapters/<name>.js")
         ("Validate exports" . "just adapter-validate <name>")
         ("Test connection" . "deno eval 'import * as a from \"./adapters/<name>.js\"; await a.connect(); console.log(a.isConnected())'")
         ("Check CLI available" . "which <ssg-command>")
         ("Test tool execution" . "run individual tool with test params"))))

    (fix-ci-failure
      (name . "Fix CI Pipeline Failure")
      (steps
        (("Read error log" . "identify failing step")
         ("Reproduce locally" . "just ci")
         ("Fix issue" . "address specific failure")
         ("Verify fix" . "just ci again")
         ("Push fix" . "git push"))))

    (emergency-rollback
      (name . "Emergency Rollback")
      (priority . critical)
      (steps
        (("Identify bad commit" . "git log --oneline")
         ("Revert" . "git revert <sha>")
         ("Test" . "just test-all")
         ("Push" . "git push")
         ("Notify" . "communicate rollback"))))))

;; ─────────────────────────────────────────────────────────────────────────────
;; ESCALATION - Escalation paths and contacts
;; ─────────────────────────────────────────────────────────────────────────────

(define escalation
  '((security
      (severity . critical)
      (contact . "security@hyperpolymath.io")
      (response-time . "48 hours")
      (procedure . "See SECURITY.md"))

    (conduct
      (severity . high)
      (contact . "conduct@hyperpolymath.io")
      (response-time . "48 hours")
      (procedure . "See CODE_OF_CONDUCT.md"))

    (technical
      (severity . medium)
      (contact . "GitHub Issues")
      (response-time . "7 days")
      (procedure . "Open issue with reproduction steps"))

    (general
      (severity . low)
      (contact . "GitHub Discussions")
      (response-time . "best effort")
      (procedure . "Open discussion thread"))))

;; ─────────────────────────────────────────────────────────────────────────────
;; GATES - Quality gates at each stage
;; ─────────────────────────────────────────────────────────────────────────────

(define quality-gates
  '((pre-commit
      (required . ("format-ok" "lint-ok" "no-secrets"))
      (command . "must pre-commit"))

    (pre-push
      (required . ("tests-pass" "adapters-valid"))
      (command . "must pre-push"))

    (pr-merge
      (required . ("docs-complete" "coverage-ok" "security-audit"))
      (command . "must pr-ready"))

    (release
      (required . ("changelog-updated" "version-tagged" "scm-valid" "rsr-gold"))
      (command . "must release-ready"))))
