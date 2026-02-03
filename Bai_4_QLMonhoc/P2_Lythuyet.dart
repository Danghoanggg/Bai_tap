import 'P1_Monhoc.dart';
import 'dart:io';

class Lythuyet extends Monhoc {
  double _diemTieuluan = 0, _diemCuoiki = 0;
  Lythuyet() : super();
  Lythuyet.constructor(
    String maMon,
    String tenMon,
    int sotinChi,
    this._diemCuoiki,
    this._diemTieuluan,
  ) : super.constructor(maMon, tenMon, sotinChi);
  bool setDiemTieuluan(double diemtieuluan) {
    if ((diemtieuluan < 0) || (diemtieuluan > 10)) {
      print('Nhap diem tieu luan hop le ! ');
      return false;
    }
    this._diemTieuluan = diemtieuluan;
    return true;
  }

  bool setDiemCuoiki(double diemcuoiki) {
    if ((diemcuoiki < 0) || (diemcuoiki > 10)) {
      print('Nhap diem cuoi ki hop le ! ');
      return false;
    }
    this._diemCuoiki = diemcuoiki;
    return true;
  }

  double getDiemTieuluan() => this._diemTieuluan;
  double getDiemCuoiki() => this._diemCuoiki;
  void nhap_DiemTieuluan() {
    double diem;
    while (true) {
      stdout.write('Nhap diem tieu luan : ');
      diem = double.tryParse(stdin.readLineSync() ?? '') ?? -1;
      if (setDiemTieuluan(diem)) {
        break;
      }
    }
  }

  void nhap_DiemCuoiki() {
    double diem;
    while (true) {
      stdout.write('Nhap diem cuoi ki : ');
      diem = double.tryParse(stdin.readLineSync() ?? '') ?? -1;
      if (setDiemCuoiki(diem)) {
        break;
      }
    }
  }

  void nhap() {
    super.nhap();
    nhap_DiemTieuluan();
    nhap_DiemCuoiki();
  }

  void HienThi() {
    super.HienThi();
    print('Diem tieu luan ma ${getMaMon()} : ${getDiemTieuluan()}');
    print('Diem cuoi ki ma ${getMaMon()} : ${getDiemCuoiki()}');
    print('Diem trung binh ma ${getMaMon()} : ${tinhDiem()}');
    print('He so ma ${getMaMon()} : ${heSo()}');
  }

  double tinhDiem() {
    return getDiemTieuluan() * 0.3 + getDiemCuoiki() * 0.7;
  }
}
