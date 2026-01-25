import 'P1.dart';
import 'dart:io';

/*
Phòng loại B: Có thêm thông tin khối lượng giặt ủi (giatui), và số máy sử dụng internet (somay).
Tiền phòng = 2000 + 2*Số điện + 8*Số nước + Giatui*5 + Somay*100
*/
class phongB extends phongTro {
  double _giatUi = 0.0;
  int _soMay = 0;
  phongB() : super();
  phongB.constructor(
    String maPhong,
    int soNguoi,
    double tienDien,
    double soNuoc,
    this._giatUi,
    this._soMay,
  ) : super.construction(maPhong, soNguoi, soNuoc, tienDien);
  void setgiatUi(double giatUi) {
    if (giatUi < 0) {
      print('Nhap khoi luong giat ui loi ! ');
    } else {
      this._giatUi = giatUi;
    }
  }

  void setsoMay(int soMay) {
    if (soMay < 0) {
      print('Nhap so may loi ! ');
    } else {
      this._soMay = soMay;
    }
  }

  double getgiatUi() => this._giatUi;
  int getsoMay() => this._soMay;
  void nhap_giatUi() {
    do {
      stdout.write('Nhap khoi luong giat ui : ');
      setgiatUi(double.tryParse(stdin.readLineSync() ?? '') ?? 0);
    } while (this._giatUi < 0);
  }

  void nhap_soMay() {
    do {
      stdout.write('Nhap so luong may su dung internet : ');
      setsoMay(int.tryParse(stdin.readLineSync() ?? '') ?? 0);
    } while (this._soMay < 0);
  }

  void nhap() {
    super.nhap();
    nhap_giatUi();
    nhap_soMay();
  }

  void hienThi() {
    super.hienThi();
    print('Khoi luong giat ui : ${getgiatUi()}');
    print('So may su dung internet : ${getsoMay()}');
    print('Tien phong cua ${getmaPhong()} : ${tienPhong()}');
  }

  double tienPhong() {
    return 2000 +
        2 * gettienDien() +
        8 * getsoNuoc() +
        getgiatUi() * 5 +
        getsoMay() * 100;
  }
}
