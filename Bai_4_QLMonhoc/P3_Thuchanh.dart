import 'P1_Monhoc.dart';
import 'dart:io';

class Thuchanh extends Monhoc {
  List<double> _DanhsachDiem = [];
  Thuchanh() : super();
  Thuchanh.constructor(
    String maMon,
    String tenMon,
    int sotinChi,
    this._DanhsachDiem,
  ) : super.constructor(maMon, tenMon, sotinChi);
  void setDiemkiemtra(double diemkiemtra) {
    if ((diemkiemtra < 0) || (diemkiemtra > 10)) {
      print('Nhap diem kiem tra khong hop le ! ');
    } else {
      this._DanhsachDiem.add(diemkiemtra);
    }
  }

  void nhap_Diemkiemtra() {
    for (int i = 0; i < 3; i++) {
      do {
        stdout.write('Nhap diem kiem tra thu ${i + 1} : ');
        double diem = double.tryParse(stdin.readLineSync() ?? '') ?? -1;
        if ((diem >= 0) && (diem <= 10)) {
          setDiemkiemtra(diem);
          break;
        }
      } while (true);
    }
  }

  void nhap() {
    super.nhap();
    nhap_Diemkiemtra();
  }

  void Hienthidiem() {
    for (int i = 0; i < _DanhsachDiem.length; i++) {
      print('Diem kiem tra lan ${i + 1} : ${_DanhsachDiem[i]}');
    }
  }

  void HienThi() {
    super.HienThi();
    Hienthidiem();
    print('Diem trung binh ma ${getMaMon()} : ${tinhDiem()}');
    print('He so ma ${getMaMon()} : ${heSo()}');
  }

  double tinhDiem() {
    double diem = 0, diemTb = 0;
    for (int i = 0; i < this._DanhsachDiem.length; i++) {
      diem += this._DanhsachDiem[i];
    }
    diemTb = diem / this._DanhsachDiem.length;
    return diemTb;
  }
}
