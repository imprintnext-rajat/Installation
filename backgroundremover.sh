#!/bin/bash 
apt update
apt install -y php8.1
apt install -y python3.8
apt install -y ffmpeg python3.8-dev

 #for background remove---->
----------------------------
apt install -y python3-pip
pip install --upgrade pip
pip install backgroundremover


#command to convert image -->
-----------------------------
#backgroundremover -i "/path/to/image.jpeg" -o "output.png"
