# Debian Railway — Personal Web Terminal

Container **Debian 13 (Trixie)** dengan terminal shell berbasis browser, autentikasi username/password, banner sistem otomatis, dan direktori kerja `/data`. Dirancang untuk deploy dari GitHub ke Railway.

> **Penting:** ini adalah container aplikasi dengan terminal web, bukan VPS penuh. Railway tidak menyediakan `systemd` penuh, akses kernel host, atau perilaku VPS tradisional. Cocok untuk terminal CLI dan eksperimen; bukan jaminan semua daemon atau layanan latar belakang akan berjalan.

## Fitur

- Debian 13 (Trixie) slim
- Terminal browser melalui `ttyd`
- Login dilindungi `TERMINAL_USER` dan `TERMINAL_PASSWORD`
- Banner sistem saat membuka shell login
- Git, curl, Python 3, pip/venv, compiler, dan utilitas CLI
- Direktori kerja `/data`
- Zona waktu default `Asia/Jakarta`
- Mendukung arsitektur AMD64 dan ARM64 selama image dan binary `ttyd` tersedia
- Tidak menyimpan API key atau token provider dalam source code

## Deploy ke Railway

1. Buat repository GitHub baru bernama `debian-railway`, lalu unggah semua isi folder ini ke root repository.
2. Di [Railway](https://railway.com/), pilih **New Project → Deploy from GitHub Repo**.
3. Pilih repository `debian-railway`. Pastikan Railway membangun dari `Dockerfile` di root.
4. Buka service → **Variables**, lalu tambahkan variabel berikut.
5. Setelah build selesai, buka **Settings → Networking → Generate Domain**.
6. Kunjungi domain Railway. Browser akan meminta username dan password.

## Variabel Railway

Masukkan di **Railway → Service → Variables**:

| Variable | Wajib | Nilai |
|---|---:|---|
| `TERMINAL_USER` | Ya | Username terminal, jangan memakai karakter `:` |
| `TERMINAL_PASSWORD` | Ya | Password unik minimal 16 karakter; disarankan 24–40 karakter |
| `TZ` | Tidak | `Asia/Jakarta` |
| `PORT` | Otomatis | Biarkan Railway menyediakannya |

Contoh nilai non-rahasia:

```env
TERMINAL_USER=durian
TZ=Asia/Jakarta
```

Atur password langsung di Railway Variables. **Jangan** menaruh password asli ke README, GitHub, atau file `.env` yang di-commit. Jika password diduga bocor, ganti variabel dan redeploy/restart service.

## Volume persisten

Tanpa Volume, file di filesystem container bisa hilang saat container dibuat ulang atau redeploy.

Untuk menyimpan file:
1. Buka service di Railway.
2. Masuk ke **Settings → Volumes → Add Volume**.
3. Gunakan mount path `/data`.
4. Simpan file penting di `/data`.

Direktori awal terminal otomatis `/data`.

## Menggunakan terminal

Setelah domain Railway aktif, buka URL di browser dan login menggunakan `TERMINAL_USER` serta `TERMINAL_PASSWORD`. Shell berjalan sebagai root **di dalam container**, bukan sebagai root host Railway.

Contoh perintah:

```bash
cat /etc/os-release
python3 --version
git --version
pwd
```

Banner sistem muncul otomatis pada sesi Bash login baru.

## Batasan dan keamanan

- Terminal dapat diakses dari internet melalui domain Railway; gunakan password acak dan panjang.
- Shell berjalan sebagai root di dalam container.
- Jangan menaruh token/API key di command history atau file yang tersimpan pada repository.
- Ini bukan VPS penuh: `systemd`, Docker-in-Docker, akses kernel host, dan semua daemon tradisional tidak dijamin tersedia.
- Browser automation dan paket sistem tertentu mungkin membutuhkan dependensi tambahan.
- Resource, waktu aktif, dan biaya mengikuti paket serta kebijakan Railway.
- Periksa **Build Logs** dan **Deploy Logs** jika service gagal berjalan.

## Troubleshooting

**Build gagal saat mengunduh `ttyd`:** periksa koneksi build ke GitHub Releases dan pastikan arsitektur yang dipilih didukung.

**Deployment berhenti langsung:** pastikan `TERMINAL_USER` terisi dan `TERMINAL_PASSWORD` memiliki minimal 16 karakter.

**Domain terbuka tetapi terminal tidak muncul:** pastikan deployment berstatus aktif, domain mengarah ke service yang benar, dan aplikasi mendengarkan pada `PORT` yang disediakan Railway.

**File hilang setelah redeploy:** pastikan Volume terpasang pada `/data` dan file disimpan di direktori itu.

**Banner tidak terlihat:** buka sesi baru dan pastikan shell Bash berjalan sebagai login shell.

**Password perlu diganti:** ubah `TERMINAL_PASSWORD` di Railway Variables, lalu restart atau redeploy service.

## Struktur repository

```text
debian-railway/
├── Dockerfile
├── entrypoint.sh
├── system-banner.sh
├── .dockerignore
├── .gitignore
├── .env.example
└── LICENSE
```
