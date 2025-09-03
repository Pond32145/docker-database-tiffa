#!/bin/bash
# backup.sh

BACKUP_DIR=./backup

FILENAME=paperless_$(date +%Y%m%d_%H%M%S).dump

mkdir -p $BACKUP_DIR

docker exec -t pg_paperless \
  pg_dump -U paperless -d postgres -Fc \
  > $BACKUP_DIR/$FILENAME

find $BACKUP_DIR -type f -mtime +30 -name "*.dump" -delete
