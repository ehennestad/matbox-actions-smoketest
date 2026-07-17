# matbox-actions-smoketest

A minimal MATLAB toolbox that exists only to smoke-test
[matbox-actions](https://github.com/ehennestad/matbox-actions) against its
`main` branch **before** a release tag is cut.

## Why this repo exists

The matbox-actions reusable workflows reference that repo's own composite
actions internally. On `main` those internal refs are `@main`, so pointing a
consumer's workflow at `...@main` exercises the entire stack as a unit — which
pinning to a lagging `@v1` cannot. This repo is that consumer: it runs the real
workflows at `@main` so regressions are caught here rather than in downstream
toolboxes.

## What it exercises

| Workflow | Pins | Exercises |
|----------|------|-----------|
| [`test-code.yml`](.github/workflows/test-code.yml) | `test-code-workflow.yml@main` | install MatBox, code analysis, tests, badge rendering |
| [`analyse-code.yml`](.github/workflows/analyse-code.yml) | `check-code-workflow.yml@main` | code analysis + SARIF upload |
| [`prepare-release.yml`](.github/workflows/prepare-release.yml) | `prepare-release-workflow.yml@main` | version validation, test matrix, packaging, draft release, install verification |

`test-code` runs on every push plus weekly; `analyse-code` runs weekly and on
demand; `prepare-release` runs on a `vX.Y.Z` tag or manual dispatch.

## The toolbox

Deliberately trivial: `smoketest.addNumbers` in [`src`](src) with a couple of
tests in [`tests`](tests) and metadata in
[`tools/MLToolboxInfo.json`](tools/MLToolboxInfo.json). The content is
irrelevant — it exists so the workflows have something real to analyse, test,
and package.

## Release smoke test

`prepare-release` needs a `DEPLOY_KEY` secret (an SSH private key whose public
key is added to this repo as a deploy key with write access). Trigger it from
the Actions tab with a version like `0.1.0`, or push a matching tag. It cuts a
real draft release in this repo; that is expected.
