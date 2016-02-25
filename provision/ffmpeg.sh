#!/usr/bin/env bash

# FFmpeg
echo "Installing FFmpeg"
sudo -u $FOS_USER curl -sS http://johnvansickle.com/ffmpeg/releases/ffmpeg-release-64bit-static.tar.xz -o $FOS_HOME_DIR/ffmpeg-release-64bit-static.tar.xz
sudo -u $FOS_USER mkdir -p $FOS_HOME_DIR/ffmpeg
sudo -u $FOS_USER tar -xJf $FOS_HOME_DIR/ffmpeg-release-64bit-static.tar.xz -C $FOS_HOME_DIR/ffmpeg
sudo cp $FOS_HOME_DIR/ffmpeg/ffmpeg*/ffmpeg /usr/local/bin/ffmpeg
sudo cp $FOS_HOME_DIR/ffmpeg/ffmpeg*/ffprobe /usr/local/bin/ffprobe
sudo -u $FOS_USER rm -rf $FOS_HOME_DIR/ffmpeg
sudo -u $FOS_USER rm -f $FOS_HOME_DIR/ffmpeg-release-64bit-static.tar.xz

# FFmpeg Configuration
echo "Configuring FFmpeg"
sudo FOS_USER=$FOS_USER sh -c 'echo "$FOS_USER ALL = (root) NOPASSWD: /usr/local/bin/ffmpeg" >> /etc/sudoers'
sudo FOS_USER=$FOS_USER sh -c 'echo "$FOS_USER ALL = (root) NOPASSWD: /usr/local/bin/ffprobe" >> /etc/sudoers'
