Lilium Kernel Builder

`markdown

⚡ Lilium Kernel Builder

Automated GitHub Actions CI builder for Android custom kernels.  
Built for speed, modularity, and root-level stealth via SukiSU Ultra.  
Includes Telegram integration, artifact upload, and flashable ZIP packing via AnyKernel3.

---

📦 Features

- 🧠 Modular build script via config.env
- 🔧 Supports Lilium Clang and custom toolchains
- ⚙️ Auto-inject SukiSU Ultra modules & manager APK
- 🕵️‍♂️ Switchable via flags: SUKISUULTRA, SUSFSMODULE, KSUMANAGERAPK
- 📲 Telegram notification: start, success, failed
- 📝 Auto ZIP naming: localversion-jenis-codename-tanggal.zip
- 🌐 Optional kernel source auto-clone
- 💥 Artifact auto-upload for easy download
- 🔁 Ready for multi-device integration

---

🚀 Usage Guide

🔨 1. Clone Repo
`bash
git clone https://github.com/username/lilium-kernel-builder.git
cd lilium-kernel-builder
`

🔧 2. Edit config.env
Set these values:
`bash
KERNELSOURCE=https://github.com/user/devicekernel_source
KERNELSOURCEBRANCH=main
KERNELCONFIG=vendor/devicedefconfig
LOCALVERSION=lilium-rengoku

CLANGDIR=toolchain/liliumclang-xxxxxx
CROSS_COMPILE=aarch64-linux-gnu-
CROSSCOMPILEARM32=arm-linux-androideabi-

SUKISU_ULTRA=true      # Enable root module injection
PACK_KERNEL=true       # Enable flashable ZIP packing
`

📲 3. Setup Telegram Bot
- Create bot via @BotFather
- Get TELEGRAMTOKEN and TELEGRAMCHAT_ID
- Add them as Secrets in GitHub repo:
  - Settings > Secrets > Actions

---

✨ Output Format

Flashable ZIP will appear in GitHub Actions > Artifacts  
Named as:
`
localversion-[reguler/sukisu]-codename-yyyyMMdd.zip
`

Example:
`
lilium-rengoku-sukisu-violet-20250715.zip
`

---

📲 Telegram Notifications

Receive build status updates instantly:
- 🔔 Build Triggered
- ✅ Build Success
- ❌ Build Failed

Includes:
- Device Defconfig  
- Time & Date  
- Link to Artifact (via GitHub)

---

👑 Credits

- Kernel Build Script Base: zclkkk/kernelbuild
- Clang: Compile with Power
- SukiSU Ultra: SukiSU-Ultra
- Telegram CI Action: appleboy/telegram-action

---

> “Lilium Kernel Builder bukan sekadar CI—ini compiler rasa digital yang bisa ngomong ke Telegram dan nge-root langsung ke boot partition.”
`

---