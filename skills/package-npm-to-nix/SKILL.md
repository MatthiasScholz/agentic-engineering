---
name: package-npm-to-nix
description: Automates the creation of a native Nix derivation for a standalone npm executable using buildNpmPackage. Handles the setup, Flake Git staging, and the dependency hash resolution.
---

# Package NPM to Nix

You are equipped to package standalone npm executables into native Nix derivations. When requested to package an npm tool, follow these strict execution steps using your builtin bash capabilities.

## Setup Workspace

Identify the package name. Create a dedicated directory (e.g., `packages/<package-name>`).
Navigate into this directory.
Run `npm init -y` to create a blank configuration.
Run `npm install <package-name>` to generate the required `package-lock.json` file.

## Create Derivation

Create a `default.nix` file in the new directory.
Write a standard `buildNpmPackage` derivation.
Set `dontNpmBuild = true`.
Set `npmDepsHash = lib.fakeHash;` to intentionally trigger a hash mismatch on the first run.
Include a `postInstall` block to symlink the binary from `$out/lib/node_modules/` to `$out/bin/`.

## Stage Files

Nix Flakes strictly ignore untracked files.
Before attempting any build, you must stage the new files.
Run `git add packages/<package-name>/*`.

## Resolve Hash

Execute a build to force Nix to evaluate the derivation and calculate the dependencies.
If integrating into a larger flake config, run the standard flake check or build.
If testing locally, run:
`nix-build -E 'with import <nixpkgs> {}; callPackage ./default.nix {}'`

## Finalize Configuration

The previous build step will fail with a hash mismatch error.
Extract the correct hash from the `got:` field in the `stderr` output.
Modify the `default.nix` file, replacing `lib.fakeHash` with the real hash string.
Run the build command a second time to verify the derivation completes successfully.
Inform the user that the package is ready to be included in their `home.packages`.

## Important Context

Always verify the exact name of the binary located in `node_modules/.bin/`.
The `postInstall` symlink will fail if the package name differs from its binary executable name.
