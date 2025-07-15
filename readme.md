<h1 align="center">⚙️ Android Kernel Builder CI</h1>
<p align="center">
  <strong>Modular GitHub Actions CI untuk membangun kernel Android</strong><br>
  <em>Didukung oleh TRB Clang, integrasi Telegram, dan pengemasan AnyKernel3 ZIP</em>
</p>

---

![Build Status](https://img.shields.io/github/actions/workflow/status/dragonzords/android_kernel_builder/build.yml?label=CI%20Status&style=for-the-badge)
![Compiler](https://img.shields.io/badge/Compiler-TRB%20Clang-red?style=for-the-badge)
![Variant](https://img.shields.io/badge/Variant-Dynamic%20via%20config.env-blue?style=for-the-badge)
![Telegram](https://img.shields.io/badge/Telegram-Notifier-green?style=for-the-badge)

---

## 🚀 Fitur Utama

*   **Otomatisasi Build:** Proses build kernel otomatis melalui konfigurasi `config.env`.
*   **Kompatibilitas Compiler:** Sepenuhnya kompatibel dengan TRB Clang (The Raging Beast).
*   **Pengemasan Flashable:** Menghasilkan ZIP flashable menggunakan AnyKernel3.
*   **Notifikasi Telegram:** Notifikasi build ke Telegram dengan format yang jelas (bold & waktu WIB).
*   **Aksesibilitas Mobile:** Dapat dijalankan langsung dari perangkat mobile via GitHub Web/App.
*   **Manajemen Secrets Aman:** Pengelolaan token dan thread ID menggunakan GitHub Secrets untuk keamanan data.

---

## 📝 Cara Penggunaan

### 1️⃣ Fork atau Clone Repositori

Mulai dengan melakukan fork atau clone repositori ini ke lingkungan lokal Anda:


### 2️⃣ Konfigurasi `config.env`

Sesuaikan parameter build dengan mengisi file `config.env`. Berikut adalah contoh bagian-bagian penting yang perlu diisi

**Catatan:** Template `config.env` dengan petunjuk lengkap sudah tersedia dalam repositori.

### 3️⃣ Clone Toolchain TRB Clang

Dapatkan toolchain TRB Clang dengan meng-clone repositori berikut ke dalam folder `toolchain/trb_clang`:


### 4️⃣ Tambahkan GitHub Secrets

Untuk mengaktifkan notifikasi Telegram, tambahkan secrets berikut di `Settings` → `Secrets` → `Actions` pada repositori GitHub Anda

TELEGRAM_TOKEN
MESSAGE_THREAD_ID
TELEGRAM_CHAT_ID

👤 Kredit

Developed by dragonzordsCompiler: The Raging Beast ClangZIP Packing: AnyKernel3Telegram Bot: appleboy/telegram-action

“Build kernel bukan cuma compile—tapi soal flow, gaya, dan CI yang bisa ngomong ke Telegram.”


---

📌 Udah siap commit langsung ke `README.md` repo lo. Mau gue bantu bikin banner PNG buat header atau QR ZIP release buat repo showcase? Gue standby kayak TRB Clang yang udah preload rage mode di folder `bin/` 🚀📲💻🔥🧠🦅
