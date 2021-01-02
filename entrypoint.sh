#!/bin/bash
set -e
rm -f /portfolio/tmp/pids/server.pid
exec "$@"