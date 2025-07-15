#!/usr/bin/env bash
set -e

# Load environment variables
source config.env

# Prepare output folder
rm -rf out
mkdir -p out

# Export build environment
export ARCH=arm64
export SUBARCH=arm64
export CLANG_PATH="$CLANG_DIR/bin"
export PATH="$CLANG_PATH:$PATH"

export CROSS_COMPILE="$CLANG_PATH/$CROSS_COMPILE"
export CROSS_COMPILE_ARM32="$CLANG_PATH/$CROSS_COMPILE_ARM32"

# Optional: Show compiler version
echo "📦 Clang Version:"
clang --version || echo "❌ Clang not found"

# Start compilation
echo "🚀 Starting Kernel Build..."
make -j$(nproc) O=out $KERNEL_CONFIG
make -j$(nproc) O=out $BUILD_ARGS

# Check output image
IMAGE_PATH="out/arch/arm64/boot/${OUTPUT_IMAGE_NAME}"
if [[ -f "$IMAGE_PATH" ]]; then
  echo "✅ Build finished: $OUTPUT_IMAGE_NAME found."
  cp "$IMAGE_PATH" "$ANYKERNEL_DIR/"
else
  echo "❌ Build failed: Kernel image not found at $IMAGE_PATH"
  exit 1
fi

# ZIP packing (optional)
if [[ "$PACK_KERNEL" == "true" ]]; then
  echo "📦 Packing ZIP via AnyKernel3..."
  cd "$ANYKERNEL_DIR"
  zip -r9 "${DEVICE_CODENAME}-${BUILD_VARIANT}-Kernel.zip" * > /dev/null
  echo "✅ ZIP created: ${DEVICE_CODENAME}-${BUILD_VARIANT}-Kernel.zip"
else
  echo "📦 ZIP packing skipped (PACK_KERNEL=false)"
fi
