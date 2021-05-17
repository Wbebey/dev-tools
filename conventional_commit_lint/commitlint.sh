#!/bin/bash

# Install commitlint cli and conventional config
npm install --save-dev @commitlint/{config-conventional,cli}

# Configure commitlint to use conventional config
echo "module.exports = {extends: ['@commitlint/config-conventional']}" > commitlint.config.js

# Install Husky v6
npm install husky --save-dev

# Activate hooks
npx husky install

# Add hook
npx husky add .husky/commit-msg 'npx --no-install commitlint --edit "$1"'

# Add .gitignore
echo "node_modules/" >> .gitignore 
echo "package-lock.json" >> .gitignore 