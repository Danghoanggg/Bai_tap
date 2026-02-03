import 'dart:io';

enum Heso { A, B, C, D, F }

abstract class Monhoc {
  String _maMon = '', _tenMon = '';
  int _sotinChi = 0;
  Monhoc();
  Monhoc.constructor(this._maMon, this._tenMon, this._sotinChi);
  String getMaMon() => this._maMon;
  String getTenMon() => this._tenMon;
  int getSotinChi() => this._sotinChi;
  void setMaMon(String mamon) {
    mamon = mamon.trim();
    if (mamon.isEmpty) {
      print('Vui long nhap ma mon hoc !');
    } else {
      this._maMon = mamon;
    }
  }

  void setTenMon(String tenmon) {
    if (tenmon.isEmpty) {
      print('Vui long nhap ten mon hoc !');
    } else {
      this._tenMon = tenmon;
    }
  }

  bool setSotiinChi(int sotinchi) {
    if (sotinchi < 0) {
      print('Vui long nhap so tin chi dung yeu cau ! ');
      return false;
    } else {
      this._sotinChi = sotinchi;
      return true;
    }
  }

  void nhap_Mamon() {
    do {
      stdout.write('Nhap ma mon hoc : ');
      setMaMon(stdin.readLineSync() ?? '');
    } while (getMaMon().isEmpty);
  }

  void nhap_Tenmon() {
    do {
      stdout.write('Nhap ten mon hoc : ');
      setTenMon(stdin.readLineSync() ?? '');
    } while (this.getTenMon().isEmpty);
  }

  void nhap_SotinChi() {
    int sotin = 0;
    while (true) {
      stdout.write('Nhap so tin chi : ');
      sotin = int.tryParse(stdin.readLineSync() ?? '') ?? -1;
      if (setSotiinChi(sotin)) {
        break;
      }
    }
  }

  void nhap() {
    nhap_Tenmon();
    nhap_SotinChi();
  }

  void HienThi() {
    print('*****Ma mon hoc : ${getMaMon()}*****');
    print('Ten mon hoc : ${getTenMon()}');
    print('So tin chi mon ${getMaMon()} : ${getSotinChi()}');
  }

  double tinhDiem();
  Heso heSo() {
    double diem = tinhDiem();
    if (diem >= 8.5)
      return Heso.A;
    else if ((diem < 8.5) && (diem >= 7))
      return Heso.B;
    else if ((diem < 7) && (diem >= 5.5))
      return Heso.C;
    else if ((diem < 5.5) && (diem >= 4))
      return Heso.D;
    else
      return Heso.F;
  }
}
