#!/bin/bash

# Gemini CLIをインストール
echo "Installing Gemini CLI..."
npm install -g @google/gemini-cli

# Claude Codeをインストール
echo "Installing Claude Code..."
npm install -g @anthropic-ai/claude-code

# Geminiの設定ファイルを配置
mkdir -p ~/.gemini
cp .devcontainer/gemini-settings.json ~/.gemini/settings.json