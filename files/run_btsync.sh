#!/bin/bash

set -e

CONFIG_FILE=/btsync/btsync.conf

if [ -z $ADMIN_PASS ]; then
    echo Please provide a password for the 'btsync' user via the ADMIN_PASS enviroment variable.
    exit 1
fi

sed -i.bak -e "s/@password@/$ADMIN_PASS/" $CONFIG_FILE 

if [ -z $SECRET_KEY ]; then
    echo Please provide a secret key for the 'btsync' synchro via the SECRET_KEY enviroment variable.
    exit 1
fi

sed -i.bak -e "s/@secret_key@/$SECRET_KEY/" $CONFIG_FILE

if [ -z $SHARED_DIR ]; then
    echo Please provide a directory to share with the SHARED_DIR enviroment variable.
    exit 1
fi

sed -i.bak -e "s/@shared_dir@/$SHARED_DIR/" $CONFIG_FILE


exec btsync --config /btsync/btsync.conf --nodaemon


