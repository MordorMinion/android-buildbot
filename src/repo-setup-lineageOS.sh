repo init -u https://github.com/LineageOS/android.git -b lineage-$LINEAGEOS_VERSION --git-lfs
repo sync -c --optimized-fetch --no-clone-bundle -j$(nproc)
