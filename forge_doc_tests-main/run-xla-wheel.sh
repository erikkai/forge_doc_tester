#!/bin/bash

set -e  # Stop the script if any command fails

echo "🧪 Install and test the pjrt-plugin-tt package."
pip install --upgrade pip
pip install pjrt-plugin-tt --extra-index-url https://pypi.eng.aws.tenstorrent.com/

echo "📦 Installing dependencies for the demo."
pip install flax transformers

echo "🚀 Running the demo..."
python3 /demo.py

echo "✅ Demo completed."



