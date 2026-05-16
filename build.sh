#!/usr/bin/env bash
set -euo pipefail

if [ ! -d "flutter" ]; then
  git clone https://github.com/flutter/flutter.git --depth 1 -b stable
fi

export PATH="$PATH:$(pwd)/flutter/bin"

flutter --version
flutter config --enable-web
flutter pub get
flutter build web --release
