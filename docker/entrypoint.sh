#!/bin/bash
set -e

echo "Starting RAGFlow FWWB..."

# Wait for dependencies
echo "Waiting for MySQL..."
while ! nc -z mysql 3306; do
  sleep 2
done

echo "Waiting for Elasticsearch..."
while ! nc -z elasticsearch 9200; do
  sleep 2
done

echo "Waiting for Redis..."
while ! nc -z redis 6379; do
  sleep 2
done

echo "Waiting for MinIO..."
while ! nc -z minio 9000; do
  sleep 2
done

echo "All dependencies are ready."

# Start nginx
echo "Starting Nginx..."
nginx

# Start backend services
echo "Starting backend services..."
cd /ragflow
uv run python -m api.main &
uv run python -m admin.main &

wait