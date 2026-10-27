# Dokumentasi Pengujian Backup

## Tujuan
Memastikan script `backup.sh` dapat melakukan backup, memvalidasi parameter, mencatat log, dan menangani kesalahan.

## Pengujian 1 — Backup Berhasil
Perintah:
```bash
bash backup.sh input backup
```

Hasil aktual:
- Arsip berhasil dibuat: `backup/backup_20261027_225003.tar.gz`.
- Log menampilkan status `BERHASIL`.
- Verifikasi arsip menggunakan `tar -tzf` menghasilkan exit status `0`.

Kesimpulan: **Lulus**.

## Pengujian 2 — Folder Sumber Tidak Ditemukan
Perintah:
```bash
bash backup.sh folder-tidak-ada backup
```

Hasil aktual:
- Script menampilkan pesan bahwa folder sumber tidak ditemukan.
- Exit status yang diharapkan dan dilaporkan: `1`.

Kesimpulan: **Lulus**, berdasarkan hasil pengujian yang dilaporkan.

## Pengujian 3 — Parameter Berlebihan
Perintah:
```bash
bash backup.sh input backup ekstra
```

Hasil aktual:
- Script menampilkan petunjuk penggunaan.
- Log mencatat `GAGAL: Jumlah argumen tidak valid.`
- Exit status: `2`.

Kesimpulan: **Lulus**.

## Kesimpulan Umum
Ketiga skenario pengujian menunjukkan bahwa script dapat melakukan backup dan menangani input tidak valid. Hasil pengujian digunakan sebagai bukti pengembangan proyek Otomasi Administrasi Linux.
