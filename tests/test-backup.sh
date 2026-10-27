#!/bin/bash

set -u

echo "=== Pengujian Otomasi Backup ==="

echo
echo "[1] Memeriksa backup normal"
bash backup.sh input backup
status=$?
echo "Exit status: $status"

if [ "$status" -eq 0 ]; then
    echo "HASIL: Lulus"
else
    echo "HASIL: Gagal"
fi

echo
echo "[2] Memeriksa folder sumber yang tidak ada"
bash backup.sh folder-tidak-ada backup
status=$?
echo "Exit status: $status"

if [ "$status" -eq 1 ]; then
    echo "HASIL: Lulus"
else
    echo "HASIL: Gagal"
fi

echo
echo "[3] Memeriksa argumen berlebihan"
bash backup.sh input backup ekstra
status=$?
echo "Exit status: $status"

if [ "$status" -eq 2 ]; then
    echo "HASIL: Lulus"
else
    echo "HASIL: Gagal"
fi
