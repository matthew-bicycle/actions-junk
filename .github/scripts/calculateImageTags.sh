#!/bin/bash -ue
# Calculate image tags for the current job

# INPUTS: Define these environment variables:
# - GCP_LOCATION: e.g. us-central1
# - GCP_PROJECT: e.g. bicycle-health-dev
# - CURRENT_SHA: e.g. github.event.pull_request.head.sha || github.sha
# - CURRENT_REF: e.g. github.head_ref || github.ref

# OUTPUTS:
# - IMAGE_TAG_SHA
# - IMAGE_TAG_REF

TARGET_REPO="${GCP_LOCATION}-docker.pkg.dev/${GCP_PROJECT}/builds/build"

echo "IMAGE_TAG_SHA=${TARGET_REPO}:git-${CURRENT_SHA}" >>"$GITHUB_OUTPUT"

REF_TAG="${CURRENT_REF//\//_}" # refs/head/fix/foo -> refs_heads_fix_foo
echo "IMAGE_TAG_REF=${TARGET_REPO}:ref-${REF_TAG}" >>"$GITHUB_OUTPUT"

# FIXME: tag the dev build/prod release version
# CURRENT_RELEASE="${ ??? }"
# echo "IMAGE_TAG_RELEASE=${TARGET_REPO}:v${CURRENT_RELEASE}" >>"$GITHUB_OUTPUT"