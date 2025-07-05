#!/bin/bash
# OpenMower Boot Path Compatibility Script
# Ensures /boot/openmower exists regardless of Raspberry Pi OS version
# Written for OpenMowerOS
# GPL V3

set -e

echo "OpenMower Boot Compatibility: Detecting boot structure..."

# Check if we're on newer Raspberry Pi OS with /boot/firmware structure
if [ -d "/boot/firmware" ]; then
    echo "Detected newer Raspberry Pi OS with /boot/firmware structure"
    
    # Find the actual OpenMower directory
    OPENMOWER_SOURCE=""
    
    # Check possible locations in order of preference
    if [ -d "/boot/firmware/openmower" ]; then
        OPENMOWER_SOURCE="/boot/firmware/openmower"
        echo "Found OpenMower config in: $OPENMOWER_SOURCE"
    elif [ -d "/boot/firmware/firmware/openmower" ]; then
        OPENMOWER_SOURCE="/boot/firmware/firmware/openmower"
        echo "Found OpenMower config in: $OPENMOWER_SOURCE"
    else
        echo "Warning: No OpenMower directory found in /boot/firmware structure"
        exit 0
    fi
    
    # Create compatibility symlink if needed
    if [ ! -e "/boot/openmower" ]; then
        echo "Creating compatibility symlink: /boot/openmower -> $OPENMOWER_SOURCE"
        ln -sf "$OPENMOWER_SOURCE" /boot/openmower
        echo "Boot compatibility symlink created successfully"
    else
        echo "Compatibility path /boot/openmower already exists"
        
        # Verify it points to the right location
        if [ -L "/boot/openmower" ]; then
            CURRENT_TARGET=$(readlink /boot/openmower)
            if [ "$CURRENT_TARGET" != "$OPENMOWER_SOURCE" ]; then
                echo "Updating symlink to point to: $OPENMOWER_SOURCE"
                rm /boot/openmower
                ln -sf "$OPENMOWER_SOURCE" /boot/openmower
            fi
        fi
    fi
else
    echo "Detected older Raspberry Pi OS - no compatibility symlink needed"
fi

# Verify the final setup
if [ -d "/boot/openmower" ]; then
    echo "Boot compatibility check successful: /boot/openmower is available"
    echo "Contents:"
    ls -la /boot/openmower/ || echo "Directory exists but cannot list contents"
else
    echo "Warning: /boot/openmower is not available after compatibility setup"
    exit 1
fi

echo "OpenMower boot path compatibility setup completed"
