#!/usr/bin/env bash

BACKUP_DIR=${BACKUP_DIR:-$HOME}
STORAGE_DIR=${STORAGE_DIR:-'/Volumes/Dumpster/Backup'}
DIR_NAME=${DIR_NAME:-`date "+%Y-%m-%d-%V"`}

if [ ! -d "$STORAGE_DIR" ]
then
	echo "External storage is not attached: $STORAGE_DIR"
	terminal-notifier -message "External storage is not attached: $STORAGE_DIR" -title "Backup failed" -sound Frog
	exit 1;
fi

DESTINATION_DIR="$STORAGE_DIR/$DIR_NAME"

mkdir -p "$DESTINATION_DIR"

echo "Backing up '$BACKUP_DIR' to '$DESTINATION_DIR'."

time rsync --archive --recursive --progress \
	--exclude 'Applications' \
	--exclude 'ArchiCAD' \
	--exclude 'Desktop' \
	--exclude 'Documents' \
	--exclude 'Downloads' \
	--exclude 'Dropbox' \
	--exclude 'Library' \
	--exclude 'Movies' \
	--exclude 'Music' \
	--exclude 'Podcasts' \
	--exclude 'Public' \
	--exclude 'tmp' \
	--exclude 'cache' \
	--exclude '.cache' \
	--exclude '.jmc' \
	--exclude '.kube/http-cache' \
	--exclude '.cups' \
	--exclude '.docker' \
	--exclude '.dropbox' \
	--exclude '.eclipse' \
	--exclude '.flickr' \
	--exclude '.matplotlib' \
	--exclude '.oracle_jre_usage' \
	--exclude '.password-store' \
	--exclude '.subversion' \
	--exclude '.testcontainers.properties' \
	--exclude '.tldrc' \
	--exclude '.m2' \
	--exclude '.gradle' \
	--exclude '.git' \
	--exclude '.Trash' \
	--exclude '*.jar' \
	--exclude 'target' \
	--exclude '.DS_Store' \
	--exclude '.idea' \
	--exclude '.iml' \
	"$BACKUP_DIR/" "$DESTINATION_DIR"

echo "Backup is done"
