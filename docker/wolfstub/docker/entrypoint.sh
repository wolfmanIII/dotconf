#!/bin/bash

# Exit immediately if a command exits with a non-zero exit status.
set -e

exec /usr/bin/supervisord --nodaemon
