repo init -u https://github.com/crdroidandroid/android.git -b 16.0 --git-lfs
repo sync -c --optimized-fetch --no-clone-bundle -j$(nproc)
