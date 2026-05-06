# Failure Modes

For `hexpane`, I would look first for these mistakes:

- `file span` cases moving lanes without a matching threshold change.
- `argument risk` scoring higher after drag increases.
- Duplicate fixture ids hiding a stale golden row.
- README examples drifting away from the verifier.

The local checks are intentionally strict about these cases.
