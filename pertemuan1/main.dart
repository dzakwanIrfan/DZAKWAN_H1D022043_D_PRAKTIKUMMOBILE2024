import 'dart:io';

class Kontak {
  String nama;
  String nomorTelepon;

  Kontak(this.nama, this.nomorTelepon);
}

void main() {
  List<Kontak> daftarKontak = [];

  while (true) {
    print('\n==== Daftar Kontak ====');
    print('1. Tampilkan Semua Kontak');
    print('2. Tambah Kontak Baru');
    print('3. Hapus Kontak');
    print('4. Keluar');
    stdout.write('Pilih opsi (1-4): ');
    String? pilihan = stdin.readLineSync();

    if (pilihan == '1') {
      tampilkanKontak(daftarKontak);
    } else if (pilihan == '2') {
      tambahKontak(daftarKontak);
    } else if (pilihan == '3') {
      hapusKontak(daftarKontak);
    } else if (pilihan == '4') {
      print('Keluar dari program...');
      break;
    } else {
      print('Pilihan tidak valid, coba lagi.');
    }
  }
}

void tampilkanKontak(List<Kontak> daftarKontak) {
  if (daftarKontak.isEmpty) {
    print('Belum ada kontak yang disimpan.');
  } else {
    print('\n==== Kontak ====');
    for (int i = 0; i < daftarKontak.length; i++) {
      print('${i + 1}. Nama: ${daftarKontak[i].nama}, Nomor: ${daftarKontak[i].nomorTelepon}');
    }
  }
}

void tambahKontak(List<Kontak> daftarKontak) {
  stdout.write('Masukkan Nama: ');
  String? nama = stdin.readLineSync();
  stdout.write('Masukkan Nomor Telepon: ');
  String? nomorTelepon = stdin.readLineSync();

  if (nama != null && nomorTelepon != null) {
    daftarKontak.add(Kontak(nama, nomorTelepon));
    print('Kontak berhasil ditambahkan.');
  } else {
    print('Nama atau nomor telepon tidak boleh kosong.');
  }
}

void hapusKontak(List<Kontak> daftarKontak) {
  if (daftarKontak.isEmpty) {
    print('Belum ada kontak yang disimpan.');
  } else {
    stdout.write('Masukkan nomor urut kontak yang ingin dihapus: ');
    String? input = stdin.readLineSync();
    int? index = int.tryParse(input ?? '');

    if (index != null && index > 0 && index <= daftarKontak.length) {
      daftarKontak.removeAt(index - 1);
      print('Kontak berhasil dihapus.');
    } else {
      print('Nomor urut tidak valid.');
    }
  }
}