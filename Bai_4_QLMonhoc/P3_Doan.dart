import 'P1_Monhoc.dart';
import 'dart:io';

class Doan extends Monhoc {
  double _DiemGVHD = 0, _DiemGVPB = 0;
  Doan() : super();
  Doan.constructor(
    String maMon,
    String tenMon,
    int sotinChi,
    this._DiemGVHD,
    this._DiemGVPB,
  ) : super.constructor(maMon, tenMon, sotinChi);
  bool setDiemGVHD(double diemGVHD) {
    if ((diemGVHD < 0) || (diemGVHD > 10)) {
      print('Nhap diem khong hop le !');
      return false;
    } else {
      this._DiemGVHD = diemGVHD;
      return true;
    }
  }

  bool setDiemGVPB(double diemGVPB) {
    if ((diemGVPB < 0) && (diemGVPB > 10)) {
      print('Nhap diem khong hop le !');
      return false;
    } else {
      this._DiemGVPB = diemGVPB;
      return true;
    }
  }

  double getDiemGVHD() => this._DiemGVHD;
  double getDiemGVPB() => this._DiemGVPB;
  void nhap_DiemGVHD() {
    double diem = 0;
    while (true) {
      stdout.write('Nhap diem GVHD mon ${getMaMon()} : ');
      diem = double.tryParse(stdin.readLineSync() ?? '') ?? -1;
      if (setDiemGVHD(diem)) {
        break;
      }
    }
  }

  void nhap_DiemGVPB() {
    double diem = 0;
    while (true) {
      stdout.write('Nhap diem GVHD mon ${getMaMon()} : ');
      diem = double.tryParse(stdin.readLineSync() ?? '') ?? -1;
      if (setDiemGVPB(diem)) {
        break;
      }
    }
  }

  void nhap() {
    super.nhap();
    nhap_DiemGVHD();
    nhap_DiemGVPB();
  }

  void HienThi() {
    super.HienThi();
    print('Diem GVHD mon ${getMaMon()} : ${getDiemGVHD()}');
    print('Diem GVPB mon ${getMaMon()} : ${getDiemGVPB()}');
    print('Diem trung binh mon ${getMaMon()} : ${tinhDiem()}');
    print('He so ma ${getMaMon()} : ${heSo()}');
  }

  double tinhDiem() {
    return (getDiemGVHD() + getDiemGVPB()) / 2;
  }
}
