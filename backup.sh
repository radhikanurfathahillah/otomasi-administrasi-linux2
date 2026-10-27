
#!/bin/bash

# Konfigurasi default
SUMBER="input"
TUJUAN="backup"
LOG="backup.log"

# Baca konfigurasi jika file tersedia
CONFIG="${CONFIG:-backup.conf}"

if [ -f "$CONFIG" ]; then
    # shellcheck disable=SC1090
    source "$CONFIG"
fi

# Mencatat pesan ke terminal dan file log
log() {
    local pesan="$1"
    printf '[%s] %s\n' "$(date '+%Y-%m-%d %H:%M:%S')" "$pesan" |
        tee -a "$LOG"
}

# Menampilkan petunjuk penggunaan
usage() {
    echo "Penggunaan: $0 [folder_sumber] [folder_tujuan]"
    echo "Contoh: $0 input backup"
}

# Memvalidasi parameter dan folder sumber
validasi() {
    if [ "$#" -gt 2 ]; then
        usage
        log "GAGAL: Jumlah argumen tidak valid."
        return 2
    fi

    if [ "$#" -ge 1 ]; then
        SUMBER="$1"
    fi

    if [ "$#" -ge 2 ]; then
        TUJUAN="$2"
    fi

    if [ ! -d "$SUMBER" ]; then
        log "GAGAL: Folder sumber '$SUMBER' tidak ditemukan."
        return 1
    fi

    if [ "$SUMBER" = "$TUJUAN" ]; then
        log "GAGAL: Folder sumber dan tujuan tidak boleh sama."
        return 2
    fi

    return 0
}

# Melakukan backup
backup() {
    if ! mkdir -p "$TUJUAN"; then
        log "GAGAL: Tidak dapat membuat folder tujuan."
        return 1
    fi

    local waktu
    local arsip

    waktu=$(date '+%Y%m%d_%H%M%S')
    arsip="$TUJUAN/backup_$waktu.tar.gz"

    if tar -czf "$arsip" -C "$SUMBER" .; then
        log "BERHASIL: Backup tersimpan di '$arsip'."
        return 0
    else
        log "GAGAL: Proses pembuatan arsip gagal."
        rm -f -- "$arsip"
        return 1
    fi
}

# Program utama
main() {
    echo "================================"
    echo "MODUL OTOMASI ADMINISTRASI LINUX"
    echo "Pengguna: $(whoami)"
    echo "Tanggal: $(date)"
    echo "================================"

    validasi "$@"
    local status=$?

    if [ "$status" -ne 0 ]; then
        return "$status"
    fi

    log "Memulai backup dari '$SUMBER'."
    backup
}

main "$@"
exit $?
