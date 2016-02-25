#!/usr/bin/env bash

# FOS-Streaming
echo "Clone FOS-Streaming"
sudo -H -u $FOS_USER git clone --bare https://github.com/zgelici/FOS-Streaming-v1.git $FOS_GIT_DIR

echo "Configuring GIT Repository"
sudo -u $FOS_USER GITDIR=$FOS_GIT_DIR FOSDIR=$FOS_INSTALL_DIR sh -c "cat <<EOT > $FOS_GIT_DIR/hooks/post-update
#!/bin/sh
git --work-tree=$FOSDIR --git-dir=$GITDIR checkout -f
EOT"
sudo -u $FOS_USER mkdir -p $FOS_INSTALL_DIR
sudo -H -u $FOS_USER git --work-tree=$FOS_INSTALL_DIR --git-dir=$FOS_GIT_DIR checkout -f

echo "Installing Dependencies via Composer"
sudo -H -u $FOS_USER composer install --no-progress -d $FOS_INSTALL_DIR
