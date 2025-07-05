# Archived Workflows

This directory contains old GitHub Actions workflows that have been archived for reference.

## Files:

### `build.yaml.old` (Original build workflow)
- **Status:** Replaced by BuildOS.yml
- **Issues:** 
  - Used outdated actions/checkout@v2
  - Simple approach, relied on submodules
  - Less robust error handling
- **Archived on:** July 4, 2025

### `BuildOS_old.yml` (Previous BuildOS workflow)
- **Status:** Updated and replaced
- **Issues:**
  - Used actions/checkout@v3 and upload-artifact@v3
  - Triggered on 'testing' branch instead of 'main'
  - Missing release automation
- **Archived on:** July 4, 2025

## Current Active Workflow
The current active workflow is `../BuildOS.yml` which combines the best features of both archived workflows with modern GitHub Actions versions.
