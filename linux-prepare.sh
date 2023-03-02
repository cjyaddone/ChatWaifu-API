#!/bin/sh
wget https://github.com/Pzy2002/ffmpeg-n4.4-archieve/archive/refs/heads/main.zip
unzip ./main.zip
cd linux
./configure  --prefix=/usr/local/ffmpeg  --enable-gpl --enable-nonfree  --enable-libfdk-aac  --enable-libx264  --enable-libx265  --enable-filter=delogo  --enable-debug --disable-optimizations  --enable-libspeex --enable-shared --enable-pthreads
make && sudo make install
sudo echo /usr/local/ffmpeg/lib >> /etc/ld.so.conf
sudo ldconfig
sudo echo FFMPEG=/usr/local/ffmpeg >> /etc/profile
sudo echo PATH=$PATH:$FFMPEG/bin >> /etc/profile
sudo source /etc/profile
pip install -r ./requirements.txt