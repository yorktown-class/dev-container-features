#!/bin/sh
set -e

apt-get update
apt-get install -y apt-transport-https ca-certificates wget gnupg lsb-release
wget -qO - https://apt.llvm.org/llvm-snapshot.gpg.key | gpg --dearmor -o /usr/share/keyrings/llvm-snapshot.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/llvm-snapshot.gpg] http://apt.llvm.org/$(lsb_release -cs)/ llvm-toolchain-$(lsb_release -cs)-${LLVM_VERSION} main" > /etc/apt/sources.list.d/llvm.list
apt-get update
apt-get install -y llvm-${LLVM_VERSION} clang-${LLVM_VERSION} lld-${LLVM_VERSION} clangd-${LLVM_VERSION}
apt-get clean
update-alternatives --install /usr/bin/clang clang /usr/bin/clang-${LLVM_VERSION} 100
update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-${LLVM_VERSION} 100
update-alternatives --install /usr/bin/lld lld /usr/bin/lld-${LLVM_VERSION} 100
clangd --version

