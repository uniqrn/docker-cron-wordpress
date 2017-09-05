#!/bin/bash

set -e

service cron start

exec apache2-foreground "$@"
