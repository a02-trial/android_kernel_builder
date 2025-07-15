#!/usr/bin/env bash

# Load Environment
source config.env

# Prepare output folder
mkdir -p out
rm -rf out/*

# Export build environment
export ARCH=arm64
export SUBARCH=arm64
export CLANG_PATH=$CLANG_DIR/bin
export PATH=$CLANG_PATH:$PATH

export CROSS_COMPILE=$CLANG_PATH/$CROSS_COMPILE
export CROSS_COMPILE_ARM32=$CLANG_PATH/$CROSS_COMPILE_ARM32

# Optional: Show compiler version
clang --version

# Start compilation
make -j$(nproc) O=out $KERNEL_CONFIG
make -j$(nproc) O=out $BUILD_ARGS

# Copy Image.gz-dtb if build succeeds
if [[ -f out/arch/arm64/boot/${OUTPUT_IMAGE_NAME} ]]; then
  echo "✅ Kernel built successfully!"
  cp out/arch/arm64/boot/${OUTPUT_IMAGE_NAME} ${ANYKERNEL_DIR}/
else
  echo "❌ Build failed: Image not found!"
  exit 1
fi

# ZIP packing if enabled
if [[ "$PACK_KERNEL" == "true" ]]; then
  cd $ANYKERNEL_DIR
  zip -r9 "${DEVICE_CODENAME}-${BUILD_VARIANT}-Kernel.zip" *
fi
