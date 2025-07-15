
<h1 align="center">⚙️ Android Kernel CI Builder</h1>
<p align="center">
  <strong>Modular kernel build system powered by TRB Clang & GitHub Actions</strong><br>
  <em>Fleksibel, rapi, dan siap dipakai langsung—bahkan tanpa PC!</em>
</p>

---

!CI Status
!TRB Clang
!Kernel Variant
!Telegram Notifier

---

🚀 Fitur Unggulan

- 🔧 Builder otomatis pakai config.env  
- ⚡️ Kompatibel dengan TRB Clang & LLVM optimisasi  
- 💬 Notifikasi Telegram stylish pake MarkdownV2  
- 📦 ZIP flashable via AnyKernel3  
- 📲 Bisa dijalankan langsung dari HP via GitHub Web/App  
- 🔒 Aman: semua token & Thread ID via Secrets  

---

📝 Cara Pakai Builder

1️⃣ Fork atau Clone Repo Ini
Lalu buka tab Actions di GitHub dan pilih workflow Kernel Build CI.

---

2️⃣ Edit File config.env
Isi bagian penting seperti ini:

`bash
DEVICE_CODENAME=begonia                 # ← codename device
BUILD_VARIANT=Regular                   # ← flavor build (Regular / KSU-Next / Magisk)
KERNELCONFIG=vendor/begoniauser_defconfig
LOCALVERSION=axira-begonia

CLANGDIR=toolchain/trbclang          # ← folder hasil clone TRB Clang
CROSS_COMPILE=aarch64-linux-android-
CROSSCOMPILEARM32=arm-linux-androideabi-
BUILDARGS=CC=clang LD=ld.lld LLVM=1 LLVMIAS=1
OUTPUTIMAGENAME=Image.gz-dtb
PACK_KERNEL=true
ANYKERNEL_SOURCE=https://github.com/yourusername/AnyKernel3
ANYKERNELSOURCEBRANCH=main
ANYKERNEL_DIR=AnyKernel3
SUKISU_ULTRA=false
`

🧠 Sudah tersedia versi template dengan petunjuk di dalamnya.

---

3️⃣ Clone TRB Clang
Toolchain wajib buat compile kernel:
`bash
git clone --depth=1 https://gitlab.com/TheRagingBeast/clang.git toolchain/trb_clang
`

---

4️⃣ Tambahkan GitHub Secrets
Masuk ke Settings → Secrets → Actions, tambahkan:

| Secret Name           | Keterangan                            |
|-----------------------|----------------------------------------|
| TELEGRAM_TOKEN      | Bot token Telegram                     |
| TELEGRAMCHATID    | ID chat grup/channel Telegram          |
| MESSAGETHREADID   | ID thread topik Telegram (optional)    |

---

5️⃣ Trigger Build
Masuk ke tab Actions, pilih workflow Kernel Build CI, klik Run workflow.

---

🔔 Format Notifikasi Telegram

Contoh notifikasi rapi bold di Telegram:
`
🎈 Build Kernel Triggered By github_actor

📱 Device : begonia  
📅 Date Build : 20250715  
🕐 Jam Build : 13:25:01 WIB  
🦎 Build Variant : Regular
`

> 📦 Build sukses akan upload ZIP ke tab Artifacts

---

📁 Struktur Proyek

| File/Folder            | Fungsi                                      |
|------------------------|---------------------------------------------|
| .github/workflows/   | Workflow CI YAML                            |
| config.env           | Konfigurasi build & device                  |
| build.sh             | Script compile kernel dan packing ZIP       |
| AnyKernel3/          | Tempat file output ZIP dikemas              |
| toolchain/trb_clang  | Folder hasil clone TRB Clang                |

---

📌 Catatan Tambahan

- Build berjalan di GitHub Action, gak butuh VPS atau PC  
- Bisa build lewat HP (edit config.env, trigger via GitHub)  
- Semua script sudah modular—tinggal isi dan jalan  
- Output format ZIP: begonia-Regular-Kernel.zip

---

👤 Kredit

Developed by [yourusername]  
Compiler: The Raging Beast Clang  
Packing ZIP by AnyKernel3  
Notifikasi bot via appleboy/telegram-action

> "Build kernel bukan cuma soal compile—tapi soal flow, estetika, dan gaya digital developer masa kini."

---
`

---

💡 Jangan lupa ganti yourusername dan nama repo/badge sesuai dengan repo lo.  
Mau gue bantu tambahin banner gambar, QR scan ZIP, atau changelog parser di workflow? Gue standby kayak AnyKernel script yang udah siap zip -r9 🔥📲💻🧠🦅
