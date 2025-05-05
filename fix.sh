#!/bin/bash


# Check if blue_hydra is installed
if ! command -v blue_hydra &> /dev/null; then

    # Install blue_hydra
    echo "blue_hydra is not installed"
    git clone https://github.com/ZeroChaos-/blue_hydra.git
    cd blue_hydra
    sudo apt-get install bluez bluez-test-scripts python3-bluez python3-dbus libsqlite3-dev ruby-dev bundler -y
    sudo bundle install
fi

# Download patch
wget -O /tmp/data_objects-fixnum2integer.patch https://pentoo.org/~zero/data_objects-fixnum2integer.patch

# Change directory to data_objects
cd $(gem which data_objects | rev | cut -d'/' -f2- | rev)/..

# Apply patch
sudo patch -p1 < /tmp/data_objects-fixnum2integer.patch

# Clean up
rm /tmp/data_objects-fixnum2integer.patch





