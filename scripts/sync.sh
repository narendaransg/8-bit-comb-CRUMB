#!/bin/bash
# CRUMB Collaboration Sync Script
# Usage: ./scripts/sync.sh [pull|push] "Optional commit message"

REPO_ROOT=$(git rev-parse --show-toplevel)
GAME_DIR="/mnt/d/CRUMB.Circuit.Simulator.v1.3.5/saves"
CIRCUITS_DIR="$REPO_ROOT/circuits"

case "$1" in
    pull)
        echo "📥 Pulling latest circuits from GitHub..."
        git pull origin main
        
        echo "📂 Copying to CRUMB saves folder..."
        cp "$CIRCUITS_DIR"/*.cru "$GAME_DIR/" 2>/dev/null
        
        echo "✅ Done! You can now load the circuit in CRUMB."
        ;;
        
    push)
        MSG=${2:-"Updated CRUMB circuits"}
        
        echo "📂 Copying from CRUMB saves to Git repo..."
        cp "$GAME_DIR"/*.cru "$CIRCUITS_DIR/" 2>/dev/null
        
        echo "📤 Pushing to GitHub..."
        git add "$CIRCUITS_DIR/"
        git commit -m "$MSG"
        git push origin main
        
        echo "✅ Uploaded successfully! Your friend can now pull."
        ;;
        
    *)
        echo "⚠️  Invalid command."
        echo "Usage: ./scripts/sync.sh pull"
        echo "       ./scripts/sync.sh push \"Your commit message\""
        ;;
esac
