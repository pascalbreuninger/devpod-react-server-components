#!/bin/bash

echo "Installing nodejs dependencies"
npm install --legacy-peer-deps

echo "Setting up database"
echo "Building image"
docker build -t postgres-rsc . -f .devcontainer/Dockerfile.postgres

echo "Seeding database"
docker run --publish 5432:5432 -d postgres-rsc
# Give postgres time to start
sleep 10
node scripts/seed.js

