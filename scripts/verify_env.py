#!/usr/bin/env python3
import sys
import subprocess

def test_python_env():
    print("[+] Checking Python environment...")
    import torch
    import geopandas
    import rasterio
    
    cuda_available = torch.cuda.is_available()
    print(f"    - PyTorch version: {torch.__version__}")
    print(f"    - CUDA Available: {cuda_available}")
    if cuda_available:
        print(f"    - GPU Name: {torch.cuda.get_device_name(0)}")

def test_r_env():
    print("[+] Checking R environment...")
    try:
        r_output = subprocess.check_output(
            ["R", "-e", "library(sf); library(terra); cat('R Geospatial Libraries Loaded Successfully\n')"],
            text=True
        )
        print(f"    - {r_output.strip()}")
    except Exception as e:
        print(f"    - R Verification Failed: {e}")

if __name__ == "__main__":
    print("=== Running Workstation Health Check ===")
    test_python_env()
    test_r_env()
    print("=== Health Check Finished ===")
