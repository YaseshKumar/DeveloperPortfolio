#!/usr/bin/env bash
# Author: Yasesh Kumar (2601730181)
# Description: Creates a timestamped compressed backup of a target folder and logs the result.
set -euo pipefail

if [[ $# -lt 1 || -z "${1}" ]]; then
  echo "Usage: ./backup.sh <folder>"
  exit 1
fi

SOURCE_FOLDER="${1}"
LOG_TIMESTAMP="$(date '+%Y-%m-%d %H:%M:%S')"
BACKUP_DIR="${HOME}/DeveloperPortfolio_Backups"
LOG_FILE="${BACKUP_DIR}/backup.log"

mkdir -p "${BACKUP_DIR}"

if [[ ! -d "${SOURCE_FOLDER}" ]]; then
  echo "Error: Folder '${SOURCE_FOLDER}' does not exist or is not a directory." >&2
  echo "[${LOG_TIMESTAMP}] FAILED: Source folder '${SOURCE_FOLDER}' not found." >> "${LOG_FILE}"
  exit 1
fi

ARCHIVE_NAME="backup_$(date '+%Y-%m-%d_%H-%M-%S').tar.gz"
ARCHIVE_PATH="${BACKUP_DIR}/${ARCHIVE_NAME}"
SOURCE_PARENT="$(dirname "${SOURCE_FOLDER}")"
SOURCE_BASENAME="$(basename "${SOURCE_FOLDER}")"

if tar -czf "${ARCHIVE_PATH}" -C "${SOURCE_PARENT}" "${SOURCE_BASENAME}"; then
  ARCHIVE_SIZE="$(du -h "${ARCHIVE_PATH}" | awk '{print $1}')"
  echo "Backup created successfully: ${ARCHIVE_PATH} (Size: ${ARCHIVE_SIZE})"
  echo "[${LOG_TIMESTAMP}] SUCCESS: Created ${ARCHIVE_PATH} (Size: ${ARCHIVE_SIZE}) from '${SOURCE_FOLDER}'." >> "${LOG_FILE}"
else
  echo "Error: Failed to create backup archive for '${SOURCE_FOLDER}'." >&2
  echo "[${LOG_TIMESTAMP}] FAILED: Error archiving '${SOURCE_FOLDER}'." >> "${LOG_FILE}"
  exit 1
fi
