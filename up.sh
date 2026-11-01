#!/usr/bin/env bash

set -euo pipefail
cd -- "$(dirname -- "${BASH_SOURCE[0]}")"

deploy() {
  cd "$1"

  if [[ -f prod.sops.env && "$1" == caddy ]]; then
    sops exec-env prod.sops.env 'docker compose up -d --build --pull missing'
  elif [[ -f prod.sops.env ]]; then
    sops exec-file --input-type dotenv --output-type dotenv prod.sops.env \
      "sh -c 'COMPOSE_ENV_FILE=\"\$1\" docker compose up -d --build --pull missing' sh {}"
  else
    docker compose up -d --build --pull missing
  fi
}

deploy 'caddy'

for file in */compose.yaml; do
  # caddy first
  [[ "$file" == caddy/compose.yaml ]] && continue

  deploy "${file%/*}"
done
