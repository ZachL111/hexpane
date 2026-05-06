# hexpane

`hexpane` treats cli tools as a local verification problem. The Zig implementation is intentionally narrow, but the fixtures and notes make the behavior explicit.

## Hexpane Checkpoints

Treat the compact fixture as the contract and the extended examples as a scratchpad. The code should stay boring enough that a change in behavior is obvious from the test output.

## What This Is For

This project keeps the domain idea close to the tests. That makes it useful as a reference implementation, a small experiment, or a starting point for a more specialized tool.

## Case Study

The examples are meant to be readable before they are exhaustive. They cover enough variation to show how latency and risk can pull a decision below the threshold.

## Architecture Notes

The core is a scoring model over demand, capacity, latency, risk, and weight. That keeps terminal output, argument shape, and file input in one explicit decision path. The threshold is 175, with risk penalty 6, latency penalty 3, and weight bonus 2. The Zig version uses compile-time constants and native test blocks for fast local checks.

## Useful Pieces

- Models terminal output with deterministic scoring and explicit review decisions.
- Uses fixture data to keep argument shape changes visible in code review.
- Includes extended examples for file input, including `recovery` and `degraded`.
- Documents repeatable reports tradeoffs in `docs/operations.md`.
- Runs locally with a single verification command and no external credentials.

## Local Workflow

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/verify.ps1
```

This runs the language-level build or test path against the compact fixture set.

## Quality Gate

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/audit.ps1
```

The audit command checks repository structure and README constraints before it delegates to the verifier.

## Project Layout

- `src`: primary implementation
- `fixtures`: compact golden scenarios
- `examples`: expanded scenario set
- `metadata`: project constants and verification metadata
- `docs`: operations and extension notes
- `scripts`: local verification and audit commands

## Expansion Ideas

- Add a loader for `examples/extended_cases.csv` and promote selected cases into the language test suite.
- Add a short report command that prints the score breakdown for a single scenario.
- Add malformed input fixtures so the failure path is as visible as the happy path.
- Add one more cli tools fixture that focuses on a malformed or borderline input.

## Scope

The scoring model is simple by design. More domain-specific behavior should be added through explicit adapters or extra fixture classes rather than hidden constants.

## Tooling

Clone the repository, enter the directory, and run the verifier. No database server, cloud account, or token is required.
