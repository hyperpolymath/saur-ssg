;; SPDX-License-Identifier: AGPL-3.0-or-later
;; META.scm - Project metadata for saur-ssg
;; Media Type: application/meta+scheme

(define project-meta
  `((version . "1.0.0")
    
    (architecture-decisions
      ((adr-001
        (title . "Squirrel as Primary Language")
        (status . "accepted")
        (date . "2024-12-01")
        (context . "Need a lightweight embeddable language popular in game development")
        (decision . "Use Squirrel for core SSG logic")
        (consequences
          ("Familiar to game developers"
           "Easy C/C++ embedding"
           "Smaller community than mainstream languages"
           "Fast VM with small footprint")))
       
       (adr-002
        (title . "Game Engine Integration Focus")
        (status . "accepted")
        (date . "2024-12-01")
        (context . "Documentation and content often needs to be generated within game engines")
        (decision . "Design for embedding in game engines and interactive applications")
        (consequences
          ("Natural fit for in-game help systems"
           "Hot reload support"
           "May be overkill for simple static sites"
           "Enables dynamic content generation")))
       
       (adr-003
        (title . "Lightweight Template Processing")
        (status . "accepted")
        (date . "2024-12-01")
        (context . "Embedded environments have memory and startup constraints")
        (decision . "Minimize dependencies and optimize for fast startup")
        (consequences
          ("Quick startup times"
           "Low memory footprint"
           "Limited built-in functionality"
           "Easy to extend via native bindings")))))
    
    (development-practices
      ((code-style . "squirrel-standard")
       (security . "openssf-scorecard")
       (testing . "squirrel-unit")
       (versioning . "semver")
       (documentation . "asciidoc")
       (branching . "trunk-based")))
    
    (design-rationale
      ((why-squirrel . "Proven embeddable scripting language with game industry adoption")
       (why-embedded . "SSGs should be usable within applications, not just standalone")
       (why-lightweight . "Fast startup and low memory essential for embedded scenarios")
       (why-native-bindings . "Enable extension via C/C++ for performance-critical operations")))))
