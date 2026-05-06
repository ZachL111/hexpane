# Review Journal

The cases below are the review handles I would use before changing the implementation.

The local checks classify each case as `ship`, `watch`, or `hold`. That gives the project a small review vocabulary that matches its cli tools focus without claiming live deployment or external usage.

## Cases

- `baseline`: `file span`, score 176, lane `ship`
- `stress`: `terminal width`, score 196, lane `ship`
- `edge`: `argument risk`, score 151, lane `ship`
- `recovery`: `report density`, score 186, lane `ship`
- `stale`: `file span`, score 210, lane `ship`

## Note

A future change should add new cases before it changes the scoring rule.
