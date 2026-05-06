# Fuzzing Notes

The mutation fixture nudges signal, slack, drag, and confidence around the golden cases.

`fixtures/fuzz/mutations.csv` mutates each golden case in a predictable direction. `fixtures/fuzz/boundary-cases.jsonl` keeps threshold-adjacent cases separate so the verifier can catch off-by-one mistakes.

This is not a replacement for a full fuzzing harness. It is a cheap local guard that fits the size of the repository.
