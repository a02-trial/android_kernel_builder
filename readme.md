<h1 align="center">⚙️ Android Kernel Builder CI</h1>
<p align="center">
  <strong>Modular GitHub Actions CI for building Android kernels</strong><br>
  <em>Powered by TRB Clang, Telegram integration, and AnyKernel3 ZIP packing</em>
</p>

---

![Build Status](https://img.shields.io/github/actions/workflow/status/dragonzords/android_kernel_builder/build.yml?label=CI%20Status&style=for-the-badge)
![Compiler](https://img.shields.io/badge/Compiler-TRB%20Clang-red?style=for-the-badge)
![Variant](https://img.shields.io/badge/Variant-Dynamic%20via%20config.env-blue?style=for-the-badge)
![Telegram](https://img.shields.io/badge/Telegram-Notifier-green?style=for-the-badge)

---

## 🚀 Fitur Utama

- 🔧 Build otomatis via `config.env`
- ⚡️ Kompatibel dengan TRB Clang (The Raging Beast)
- 📦 ZIP flashable via AnyKernel3
- 💬 Notifikasi Telegram dengan format bold & jam WIB
- 📲 Bisa dijalankan langsung dari HP via GitHub Web/App
- 🔒 Secrets aman untuk token & thread ID

---

## 📝 Cara Pakai

### 1️⃣ Fork atau Clone Repo Ini

```bash
git clone https://github.com/dragonzords/android_kernel_builder.git
cd android_kernel_builder

2️⃣ Edit File config.env

Isi bagian penting seperti ini:

DEVICE_CODENAME=begonia                 # ← codename device
BUILD_VARIANT=Regular                   # ← Regular / KSU-Next / Magisk / dll
KERNEL_CONFIG=vendor/begonia_user_defconfig
LOCALVERSION=axira-begonia

CLANG_DIR=toolchain/trb_clang
CROSS_COMPILE=aarch64-linux-android-
CROSS_COMPILE_ARM32=arm-linux-androideabi-
BUILD_ARGS=CC=clang LD=ld.lld LLVM=1 LLVM_IAS=1

OUTPUT_IMAGE_NAME=Image.gz-dtb

PACK_KERNEL=true
ANYKERNEL_SOURCE=https://github.com/dragonzords/AnyKernel3
ANYKERNEL_SOURCE_BRANCH=main
ANYKERNEL_DIR=AnyKernel3

SUKISU_ULTRA=false

📌 Sudah tersedia versi template dengan petunjuk di dalamnya (config.env).

3️⃣ Clone Toolchain TRB Clang

git clone --depth=1 https://gitlab.com/TheRagingBeast/clang.git toolchain/trb_clang

4️⃣ Tambahkan Secrets ke Repo

Masuk ke Settings → Secrets → Actions, tambahkan:

Secret Name

Keterangan

TELEGRAM_TOKEN

Token bot Telegram

TELEGRAM_CHAT_ID

ID grup/channel Telegram

MESSAGE_THREAD_ID

ID topik thread Telegram (opsional)

5️⃣ Trigger Build

Masuk ke tab Actions, pilih workflow Kernel Build CI, lalu klik Run workflow.

🔔 Format Notifikasi Telegram

Contoh notifikasi rapi di Telegram:

🎈 Build Kernel Triggered By `github_actor`

📱 Device : begonia  
📅 Date Build : 20250715  
🕐 Jam Build : 13:25:01 WIB  
🦎 Build Variant : Regular

✅ Build sukses akan upload ZIP ke tab Artifacts❌ Build gagal akan kirim log & commit info

📁 Struktur Proyek

File/Folder

Fungsi

.github/workflows/

Workflow CI YAML

config.env

Konfigurasi build & device

build.sh

Script compile kernel dan packing ZIP

AnyKernel3/

Tempat file output ZIP dikemas

toolchain/trb_clang

Folder hasil clone TRB Clang

👤 Kredit

Developed by dragonzordsCompiler: The Raging Beast ClangZIP Packing: AnyKernel3Telegram Bot: appleboy/telegram-action

“Build kernel bukan cuma compile—tapi soal flow, gaya, dan CI yang bisa ngomong ke Telegram.”


---
