;;; NEUROSYM.scm — saur-ssg
;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 hyperpolymath
;;
;; Neuro-symbolic configuration: reasoning patterns, symbolic representations,
;; verification properties, and formal specifications

(define-module (saur-ssg neurosym)
  #:export (symbolic-types reasoning-rules verification-properties invariants))

;; ─────────────────────────────────────────────────────────────────────────────
;; SYMBOLIC TYPES - Type system for adapter components
;; ─────────────────────────────────────────────────────────────────────────────

(define symbolic-types
  '((Adapter
      (fields
        ((name . String)
         (language . Language)
         (description . (Option String))
         (tools . (List Tool))
         (connected . Boolean)))
      (invariants
        ("name is non-empty")
        ("language is valid SSG language")
        ("tools list is non-empty")))

    (Tool
      (fields
        ((name . Identifier)
         (description . String)
         (inputSchema . JSONSchema)
         (execute . (Fn Params -> Promise Result))))
      (invariants
        ("name follows pattern {ssg}_{operation}")
        ("inputSchema is valid JSON Schema")))

    (Language
      (variants
        ("Rust" "Haskell" "Elixir" "Clojure" "Julia" "Scala"
         "CommonLisp" "FSharp" "Racket" "Kotlin" "Crystal"
         "Nim" "Swift" "D" "Tcl" "OCaml" "Erlang")))

    (Result
      (variants
        ((Ok (value . Any))
         (Error (message . String) (code . (Option Integer)))))
      (invariants
        ("Error.message is non-empty")))))

;; ─────────────────────────────────────────────────────────────────────────────
;; REASONING RULES - Inference rules for adapter behavior
;; ─────────────────────────────────────────────────────────────────────────────

(define reasoning-rules
  '((adapter-lifecycle
      (rules
        ;; Connection rules
        ((rule . "connect-before-execute")
         (premise . "(not connected)")
         (action . "execute tool")
         (conclusion . "error: adapter not connected"))

        ((rule . "idempotent-connect")
         (premise . "connected")
         (action . "connect")
         (conclusion . "no-op, remain connected"))

        ((rule . "disconnect-cleans-state")
         (premise . "connected")
         (action . "disconnect")
         (conclusion . "(not connected) ∧ state-cleared"))))

    (tool-execution
      (rules
        ;; Tool execution rules
        ((rule . "valid-params-required")
         (premise . "execute(tool, params)")
         (condition . "(not (valid-schema? params tool.inputSchema))")
         (conclusion . "Error: invalid parameters"))

        ((rule . "tool-isolation")
         (premise . "execute(tool₁, params₁)")
         (condition . "concurrent execute(tool₂, params₂)")
         (conclusion . "independent execution, no interference"))

        ((rule . "error-propagation")
         (premise . "CLI returns non-zero exit code")
         (conclusion . "Result.Error with stderr message"))))

    (security
      (rules
        ((rule . "no-shell-injection")
         (premise . "user input in params")
         (action . "pass to CLI")
         (requirement . "input must be sanitized or passed as array args"))

        ((rule . "no-path-traversal")
         (premise . "path parameter")
         (requirement . "path must not contain .. or absolute paths outside project"))))))

;; ─────────────────────────────────────────────────────────────────────────────
;; VERIFICATION PROPERTIES - Properties that must hold
;; ─────────────────────────────────────────────────────────────────────────────

(define verification-properties
  '((safety-properties
      (description . "Properties that must always hold")
      (properties
        ((no-resource-leak
           (formal . "∀ adapter: connect(adapter) → eventually(disconnect(adapter))")
           (check . "ensure disconnect called in finally block"))

         (no-undefined-behavior
           (formal . "∀ tool, params: execute(tool, params) → Result")
           (check . "all code paths return valid Result"))

         (input-validation
           (formal . "∀ params: execute(_, params) → validate(params) before CLI call")
           (check . "schema validation before Deno.Command")))))

    (liveness-properties
      (description . "Properties about eventual behavior")
      (properties
        ((connection-eventual
           (formal . "connect() → ◇ (connected ∨ Error)")
           (check . "connect must eventually resolve"))

         (tool-termination
           (formal . "execute(tool, params) → ◇ Result")
           (check . "all tool executions must terminate"))

         (graceful-shutdown
           (formal . "disconnect() → ◇ (not connected)")
           (check . "disconnect must eventually complete")))))

    (security-properties
      (description . "Security-related properties")
      (properties
        ((no-credential-exposure
           (formal . "∀ output: ¬contains(output, credentials)")
           (check . "grep for password/token patterns"))

         (sandboxed-execution
           (formal . "∀ cmd: execute(cmd) → within(project-dir)")
           (check . "verify working directory constraints"))

         (audit-trail
           (formal . "∀ tool-call: logged(tool-call)")
           (check . "all tool executions are logged")))))))

;; ─────────────────────────────────────────────────────────────────────────────
;; INVARIANTS - System-wide invariants
;; ─────────────────────────────────────────────────────────────────────────────

(define invariants
  '((adapter-invariants
      (description . "Invariants for all adapters")
      (invariants
        ("adapter.name matches filename (without .js)")
        ("adapter.language is in Language variants")
        ("adapter.tools.length >= 1")
        ("each tool.name starts with lowercase adapter name")
        ("SPDX header present in every adapter file")))

    (tool-invariants
      (description . "Invariants for all tools")
      (invariants
        ("tool.name is snake_case")
        ("tool.inputSchema.type === 'object'")
        ("tool.execute is async function")
        ("tool.execute returns { result: ... } or { error: ... }")))

    (system-invariants
      (description . "System-wide invariants")
      (invariants
        ("exactly 28 adapters in adapters/")
        ("all adapters follow MCP interface")
        ("STATE.scm reflects actual completion status")
        ("no circular dependencies between adapters")))))

;; ─────────────────────────────────────────────────────────────────────────────
;; FORMAL SPECIFICATIONS - Executable specifications
;; ─────────────────────────────────────────────────────────────────────────────

(define formal-specs
  '((adapter-interface
      (spec . "
        interface Adapter {
          name: NonEmptyString
          language: Language
          tools: NonEmptyArray<Tool>

          connect(): Promise<void>
          disconnect(): Promise<void>
          isConnected(): boolean
        }

        precondition connect(): true
        postcondition connect(): isConnected() = true ∨ throws Error

        precondition disconnect(): true
        postcondition disconnect(): isConnected() = false

        invariant: tools.every(t => t.name.startsWith(name.toLowerCase()))
      "))

    (tool-interface
      (spec . "
        interface Tool {
          name: SnakeCase
          description: NonEmptyString
          inputSchema: JSONSchema
          execute: (params: object) => Promise<ToolResult>
        }

        precondition execute(params):
          validate(params, inputSchema) = true

        postcondition execute(params):
          result.isOk() ∨ result.isError()

        invariant: no side effects outside project directory
      "))

    (mcp-protocol
      (spec . "
        // MCP tool call sequence
        sequence ToolCall {
          client -> server: tools/call { name, arguments }
          server: validate(arguments, tool.inputSchema)
          server: result = tool.execute(arguments)
          server -> client: { content: [{ type: 'text', text: result }] }
        }

        // Error handling
        on ValidationError:
          server -> client: { isError: true, content: [...] }

        on ExecutionError:
          server -> client: { isError: true, content: [...] }
      "))))

;; ─────────────────────────────────────────────────────────────────────────────
;; SYMBOLIC REASONING - Patterns for AI reasoning about code
;; ─────────────────────────────────────────────────────────────────────────────

(define symbolic-reasoning
  '((code-patterns
      (description . "Recognized code patterns in adapters")
      (patterns
        ((cli-wrapper
           (pattern . "Deno.Command(binary, { args, cwd })")
           (meaning . "Execute SSG CLI command")
           (safety . "args must be array, not string interpolation"))

         (connection-state
           (pattern . "let connected = false")
           (meaning . "Mutable connection state")
           (safety . "must be updated in connect/disconnect"))

         (tool-definition
           (pattern . "{ name, description, inputSchema, execute }")
           (meaning . "MCP tool registration")
           (safety . "execute must be async, return Result")))))

    (anti-patterns
      (description . "Code patterns to avoid")
      (patterns
        ((shell-injection
           (pattern . "new Deno.Command('sh', { args: ['-c', userInput] })")
           (risk . "command injection")
           (fix . "pass args as array, validate input"))

         (missing-error-handling
           (pattern . "await cmd.output() // no try-catch")
           (risk . "unhandled promise rejection")
           (fix . "wrap in try-catch, return Result.Error"))

         (hardcoded-paths
           (pattern . "'/usr/local/bin/ssg'")
           (risk . "non-portable")
           (fix . "use PATH resolution or config")))))))
