# Otomasi Administrasi Linux — Backup Data

## Deskripsi
Proyek ini menggunakan Bash Shell Script untuk mengotomatisasi backup data lokal ke dalam arsip `.tar.gz`.

## Fitur
- Backup folder sumber ke folder tujuan.
- Nama arsip menggunakan tanggal dan waktu.
- Validasi folder sumber dan parameter.
- Pencatatan aktivitas dan kesalahan melalui `backup.log`.
- Exit status untuk menunjukkan keberhasilan atau kegagalan.

## Persyaratan
- Linux
- Bash
- Utilitas `tar`
- Git

## Cara Menjalankan

Jalankan dengan konfigurasi default:

```bash
bash backup.sh
```

Atau tentukan folder sumber dan tujuan:

```bash
bash backup.sh input backup
```

## Verifikasi Backup

Lihat daftar arsip:

```bash
ls -lh backup/
```

Periksa isi arsip:

```bash
tar -tzf backup/NAMA_ARSIP.tar.gz
```

Ganti `NAMA_ARSIP.tar.gz` dengan nama file backup yang tersedia.

## Pemulihan Data

```bash
mkdir -p restore
tar -xzf backup/NAMA_ARSIP.tar.gz -C restore
diff -r input restore
```

Pastikan nama arsip sudah diganti dengan file yang benar. Jika `diff` tidak menampilkan keluaran, isi kedua folder cocok.

## Exit Status

| Kode | Arti |
|---|---|
| 0 | Backup berhasil |
| 1 | Folder sumber tidak ditemukan atau proses gagal |
| 2 | Parameter tidak valid atau folder sumber dan tujuan sama |

## Pengujian
Laporan pengujian tersedia di `tests/test-cases.md`. Pengujian mencakup backup berhasil, folder sumber tidak ditemukan, dan jumlah parameter berlebihan.

## Pembersihan
Periksa isi folder sebelum menghapus arsip pengujian. Hapus hanya data yang memang tidak lagi diperlukan:

```bash
rm -f backup/*.tar.gz
rm -f backup.log
rm -rf restore/
```

Jangan menghapus satu-satunya salinan backup yang masih diperlukan.

## Rollback
Untuk kembali melihat branch utama:

```bash
git switch main
```

Untuk melihat riwayat commit:

```bash
git log --oneline
```

Jika perubahan sudah diunggah dan perlu dibatalkan, gunakan `git revert` pada commit yang sesuai.

## Batasan
Versi ini berfokus pada backup lokal. Penjadwalan otomatis, enkripsi, dan pengiriman backup ke server lain belum diterapkan.# otomasi-administrasi-linux2
