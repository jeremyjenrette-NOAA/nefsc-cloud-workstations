#!/usr/bin/env bash
set -e

echo "=== Installing Python ML & Data Science Packages ==="
python3 -m pip install --upgrade pip
pip install torch torchvision --index-url https://download.pytorch.org/whl/cu121
pip install scikit-learn pandas numpy matplotlib

echo "=== Installing R & Geospatial Dependencies ==="
sudo apt-get update && sudo apt-get install -y libgdal-dev libgeos-dev libproj-dev libudunits2-dev
R -e "install.packages(c('tidyverse', 'devtools'), repos='https://cloud.r-project.org/')"

echo "=== Setup Complete ==="
