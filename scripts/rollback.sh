#!/bin/bash
set -e

echo "===== Rolling Back ====="

CURRENT_CONTAINER="reverse-string-app"
BACKUP_CONTAINER="reverse-string-app-backup"

docker rm -f ${CURRENT_CONTAINER} 2>/dev/null || true

if docker ps -a --format "{{.Names}}" | grep -q "^${BACKUP_CONTAINER}$"; then

    echo "Restoring previous container..."

    docker rename ${BACKUP_CONTAINER} ${CURRENT_CONTAINER}

    docker start ${CURRENT_CONTAINER}

    echo "Rollback Complete"

else

    echo "No backup container found."

fi