repo init -u https://github.com/crdroidandroid/android.git -b 16.0 --git-lfs
repo sync -j$(nproc --all)
. build/envsetup.sh
lunch lineage_pdx234-userdebug
mka bacon -j$(nproc)
