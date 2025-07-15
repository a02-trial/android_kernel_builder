#!/bin/bash
source config.env

# ===== Environment Setup =====
export ARCH=arm64
export SUBARCH=arm64
export CLANG_PATH=$CLANG_DIR
export PATH=$CLANG_PATH/bin:$PATH
export CROSS_COMPILE=$CLANG_PATH/bin/$CROSS_COMPILE
export CROSS_COMPILE_ARM32=$CLANG_PATH/bin/$CROSS_COMPILE_ARM32

# ===== Output Folder =====
mkdir -p out

echo "🔧 Starting Kernel Build for: $KERNEL_CONFIG"

# ===== Defconfig =====
make O=out ARCH=$ARCH $KERNEL_CONFIG

# ===== Compilation =====
make -j$(nproc) O=out ARCH=$ARCH $BUILD_ARGS

# ===== Output Check & Packing =====
if [ -f "out/arch/arm64/boot/$OUTPUT_IMAGE_NAME" ]; then
    echo "✅ Build Success: $OUTPUT_IMAGE_NAME found"
    cp out/arch/arm64/boot/$OUTPUT_IMAGE_NAME out/$OUTPUT_IMAGE_NAME

    # ===== Clone AnyKernel3 & Pack ZIP =====
    if [ "$PACK_KERNEL" == "true" ]; then
        echo "📦 Packing with AnyKernel3..."
        git clone --depth=1 $ANYKERNEL_SOURCE -b $ANYKERNEL_SOURCE_BRANCH $ANYKERNEL_DIR
        cp out/$OUTPUT_IMAGE_NAME $ANYKERNEL_DIR/

        # Optional Inject SukiSU Ultra
        if [ "$SUKISU_ULTRA" == "true" ]; then
            echo "🔐 Injecting SukiSU Ultra modules..."
            # Lo bisa copy manager .apk, susfs4ksu.ko, atau script install di sini
            cp -r su_module/* $ANYKERNEL_DIR/ 2>/dev/null || echo "⚠️ No SukiSU Module found"
        fi

        cd $ANYKERNEL_DIR
        zip -r Flashable-Kernel.zip . -x "*.git*" "*.md" "README*" "*.apk" "*.ko"
        echo "✅ Flashable ZIP packed"
    fi
else
    echo "❌ Build Failed: $OUTPUT_IMAGE_NAME not found"
    exit 1
fi