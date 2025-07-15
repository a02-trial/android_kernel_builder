#!/bin/bash
source config.env

# ===== Environment Setup =====
export ARCH=arm64
export SUBARCH=arm64
export CLANG_PATH=$CLANG_DIR
export PATH=$CLANG_PATH/bin:$PATH
export CROSS_COMPILE=$CLANG_PATH/bin/$CROSS_COMPILE
export CROSS_COMPILE_ARM32=$CLANG_PATH/bin/$CROSS_COMPILE_ARM32

# ===== Clone Kernel Source =====
if [ ! -d "kernel" ]; then
    echo "🌐 Cloning Kernel Source..."
    git clone --depth=1 $KERNEL_SOURCE -b $KERNEL_SOURCE_BRANCH kernel/
else
    echo "📁 Kernel source already exists. Skipping clone."
fi

# ===== Output Folder =====
mkdir -p out

# ===== Build Start =====
cd kernel
echo "🔧 Starting Kernel Build for: $KERNEL_CONFIG"

# ===== Defconfig =====
make O=../out ARCH=$ARCH $KERNEL_CONFIG

# ===== Compilation =====
make -j$(nproc) O=../out ARCH=$ARCH $BUILD_ARGS

# ===== Output Check & Packing =====
if [ -f "../out/arch/arm64/boot/$OUTPUT_IMAGE_NAME" ]; then
    echo "✅ Build Success: $OUTPUT_IMAGE_NAME found"
    cp ../out/arch/arm64/boot/$OUTPUT_IMAGE_NAME ../out/$OUTPUT_IMAGE_NAME

    # ===== Clone AnyKernel3 & Pack ZIP =====
    if [ "$PACK_KERNEL" == "true" ]; then
        echo "📦 Packing with AnyKernel3..."
        git clone --depth=1 $ANYKERNEL_SOURCE -b $ANYKERNEL_SOURCE_BRANCH ../$ANYKERNEL_DIR
        cp ../out/$OUTPUT_IMAGE_NAME ../$ANYKERNEL_DIR/

        # ===== Generate ZIP Name =====
        DATE=$(date +%Y%m%d)
        JENIS_BUILD="reguler"
        [ "$SUKISU_ULTRA" == "true" ] && JENIS_BUILD="sukisu"
        CODENAME="${KERNEL_CONFIG##*/}"
        ZIP_NAME="${LOCALVERSION}-${JENIS_BUILD}-${CODENAME}-${DATE}.zip"

        # ===== Inject SukiSU Ultra (Optional) =====
        if [ "$SUKISU_ULTRA" == "true" ]; then
            echo "🔐 Injecting SukiSU Ultra modules..."
            cp -r ../su_module/* ../$ANYKERNEL_DIR/ 2>/dev/null || echo "⚠️ No SukiSU Module found"
        fi

        cd ../$ANYKERNEL_DIR
        zip -r "$ZIP_NAME" . -x "*.git*" "*.md" "README*" "*.apk" "*.ko"
        echo "✅ Flashable ZIP Created: $ZIP_NAME"
    fi
else
    echo "❌ Build Failed: $OUTPUT_IMAGE_NAME not found"
    exit 1
fi
