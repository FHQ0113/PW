#!/bin/bash
sudo apt install -y g++
sudo apt install -y povray
sudo apt install -y asymptote
sudo apt install -y texlive-full
sudo apt-get install -y pkg-config
sudo apt-get install -y libgsl-dev
“”将每个空格替换为-
sudo apt-get install -y freeglut3-dev
sudo apt-get install -y libfltk1.3 libfltk1.3-dev
##############################################################################
# Script to Install Neper and Its Dependencies
#
# This script installs the necessary dependencies and builds Neper from source.
# It includes installations for OpenSSL, CMake, FreeType, GMSH, and other required libraries.
#
# Usage:
# 1. Run this script in a terminal with sudo privileges.
# 2. Ensure that you have internet access to download packages.
#
# Note:
# Adjust the number of threads in the '-j' option based on your CPU capabilities.
# 
# Data: 2024.09.05
# Ref1: https://github.com/NotRealEngineering/Neper-Gmsh-installation-guide/blob/main/Neper_Gmsh_installation.r
# Ref2: https://www.youtube.com/watch?v=3ENXVNd5UzI
##############################################################################

# # Update package list and install essential build tools
# echo "Updating package list and installing build-essential and gfortran..."
# sudo apt-get update
# sudo apt install -y build-essential gfortran

# # install Openssl
# # ---download and extract the sourcecode from---
# # 	https://github.com/openssl/openssl
# echo "Installing OpenSSL..."
# cd /home/pw-moose/projects/dldSF/openssl-3.4.0-alpha1
# ./configure
# sudo make -j30  # Use multiple threads for faster compilation
# sudo make install

# # install CMake
# # ---download and extract the sourcecode from---
# # 	https://cmake.org/download/
# echo "Installing CMake..."
# sudo snap install -y cmake
# sudo apt install -y povray
# sudo apt install -y asymptote
# sudo apt install -y texlive-full

# # Install additional dependencies
# echo "Installing dependencies..."
# sudo apt-get install -y libgmp3-dev libhdf5-serial-dev libfltk1.3-dev xorg \
#                      openbox libpng-dev povray libblas-dev liblapack-dev

# #Install freetype
# # ---download and extract the sourcecode from---
# # 	https://www.freetype.org/
# echo "Installing FreeType..."
# cd /home/pw-moose/projects/dldSF/freetype-2.10.0
# ./configure
# sudo make -j30  # Use multiple threads for faster compilation
# sudo make install

# # Install Gmsh
# # ---Download and extract Gmsh sourcecode from---
# # 	https://gmsh.info/
# echo "Reinstalling libgl1-mesa-dev..."
# sudo apt-get install --reinstall -y libgl1-mesa-dev
# echo "Installing GMSH..."
# cd /home/pw-moose/projects/dldSF/gmsh-4.13.1-source
# sudo rm -rf build  # Remove existing build directory if it exists
# mkdir build
# cd build
# cmake ..
# sudo make -j30  # Use multiple threads for faster compilation
# sudo make install

# # Install additional dependencies for Neper
# echo "Installing additional dependencies for Neper..."
# sudo apt-get install -y libgsl-dev libnlopt-dev libomp-dev \
#                      libscotch-dev libpthread-stubs0-dev

# #Install Neper
# # ---Download and extract Neper source code from---
# # 	https://neper.info/downloads.html
# echo "Installing Neper..."
# cd /home/pw-moose/projects/neper/src
# rm -rf build
# mkdir build
# cd build
# sudo apt install cmake
# cmake ..
# sudo make -j30  # Use multiple threads for faster compilation
# sudo make install

# # Indicate completion
# echo "Installation of Neper and its dependencies completed successfully!"
