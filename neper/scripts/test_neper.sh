#!/bin/bash

##############################################################################
# Script to Test Neper Installation
# 
# This script sets the number of OpenMP threads, creates a directory for 
# tests, and runs several Neper commands to generate tessellation and images.
#
# All generated files will be stored in the './tests' directory.
#
# Usage:
# 1. Ensure that Neper is installed and accessible in your PATH.
# 2. Run this script in a terminal.
#
# Note:
# Modify the number of threads (OMP_NUM_THREADS) as needed based on your 
# system's capabilities.
# Data: 2024.09.05
##############################################################################

# Set the number of OpenMP threads
export OMP_NUM_THREADS=30

# Create a directory for tests
mkdir -p tests
cd tests

# Generate tessellation
echo "Generating tessellation with Neper..."
neper -T -n 100 -id 1 -o n100-id1.tess  # Generates n100-id1.tess in the tests directory

# Generate Image_1 from tessellation
echo "Generating Image_1 from tessellation..."
neper -V n100-id1.tess -datacellcol id -print Image_1.png  # Generates Image_1.png in the tests directory

# Generate mesh from tessellation
echo "Generating mesh file n100-id1.msh..."
neper -M n100-id1.tess -elttype hex -o n100-id1.msh  # Generates n100-id1.msh in the tests directory

# Generate Image_2 from tessellation and mesh
echo "Generating Image_2 from tessellation and mesh..."
neper -V n100-id1.tess,n100-id1.msh -dataelsetcol id -print Image_2.png  # Generates Image_2.png in the tests directory

# Indicate completion
echo "All tests completed successfully!"
