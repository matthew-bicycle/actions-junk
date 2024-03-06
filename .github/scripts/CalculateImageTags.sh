# Calculate image tags for the current job

# Input Validation: Define these environment variables
VALID_ARGS=yes
[ -z "${GCP_LOCATION}" ] && echo "Error: missing GCP_LOCATION" && VALID_ARGS=no
[ -z "${GCP_PROJECT}" ] && echo "Error: missing GCP_PROJECT" && VALID_ARGS=no
[ -z "${CURRENT_SHA}" ] && echo "Error: missing CURRENT_SHA" && VALID_ARGS=no
[ -z "${CURRENT_REF}" ] && echo "Error: missing CURRENT_REF" && VALID_ARGS=no
[[ "${VALID_ARGS}" == "no" ]] && exit 1

TARGET_REPO="${GCP_LOCATION}-docker.pkg.dev/${GCP_PROJECT}/builds/build"

# OUTPUT: IMAGE_TAG_SHA 
echo "IMAGE_TAG_SHA=${TARGET_REPO}:git-${CURRENT_SHA}" >>"$GITHUB_OUTPUT"

# OUTPUT: IMAGE_TAG_REF
REF_TAG="${CURRENT_REF//\//_}" # refs/head/fix/foo -> refs_heads_fix_foo
echo "IMAGE_TAG_REF=${TARGET_REPO}:ref-${REF_TAG}" >>"$GITHUB_OUTPUT"

# FIXME: tag the dev build/prod release version
# CURRENT_RELEASE="${ ??? }"
# echo "IMAGE_TAG_RELEASE=${TARGET_REPO}:v${CURRENT_RELEASE}" >>"$GITHUB_OUTPUT"