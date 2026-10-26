#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(pwd)"
PROJECT_ARCHIVE="${ROOT_DIR}/SceneSpeakMinnaN5-JSON-Import.zip"
SOURCE_DIR="${ROOT_DIR}/.scenespeak-build-source"

if [[ ! -f "$PROJECT_ARCHIVE" ]]; then
  echo "Build input not found: SceneSpeakMinnaN5-JSON-Import.zip must be in the repository root." >&2
  exit 1
fi

rm -rf "$SOURCE_DIR" "${ROOT_DIR}/dist"
mkdir -p "$SOURCE_DIR"
unzip -q "$PROJECT_ARCHIVE" -d "$SOURCE_DIR"

if [[ ! -f "$SOURCE_DIR/SceneSpeakApp/package.json" ]]; then
  echo "Could not find SceneSpeakApp/package.json inside the source archive." >&2
  exit 1
fi

cd "$SOURCE_DIR/SceneSpeakApp"
node --version
npm --version
npm install --no-audit --no-fund
npm run build

if [[ ! -f "$SOURCE_DIR/SceneSpeakApp/dist/index.html" ]]; then
  echo "Build command completed but dist/index.html was not generated." >&2
  exit 1
fi
mkdir -p "${ROOT_DIR}/dist"
cp -R "$SOURCE_DIR/SceneSpeakApp/dist/." "${ROOT_DIR}/dist/"
echo "SceneSpeak build output is ready in ${ROOT_DIR}/dist"
