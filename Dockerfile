FROM ubuntu:22.04

# Install dependencies
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    openjdk-17-jdk git-core gnupg flex bison gperf build-essential zip curl \
    zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 libncurses5-dev \
    x11proto-core-dev libx11-dev libgl1-mesa-dev libxml2-utils xsltproc unzip \
    fontconfig python3 ccache repo rsync wget jq locales lsb-release libwxgtk3.0-dev htop \
    && apt-get clean

# Configure locale
RUN locale-gen en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8

# Enable ccache
ENV USE_CCACHE=1
ENV CCACHE_DIR=/ccache

# Setup working dirs
VOLUME /src /ccache /out
WORKDIR /src

# Create folders
mkdir -p ~/bin
# mkdir -p ~/android/lineage/.repo/local_manifests

# Install 'repo' tool
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo

# Configure Git & LFS
git config --global user.email "$GIT_EMAIL"
git config --global user.name  "LineageOS Developer"
git lfs install
git config --global trailer.changeid.key "Change-Id"

# Default shell
CMD ["/bin/bash"]
