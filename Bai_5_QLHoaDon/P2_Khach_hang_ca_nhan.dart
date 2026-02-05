import 'P1_Hoadon.dart';
import 'dart:io';

class KhachHangCaNhan extends Hoadon {
  double _Khoangcach = 0;
  KhachHangCaNhan() : super();
  KhachHangCaNhan.constructor(
    String MaKh,
    String TenKh,
    int Soluong,
    double Giaban,
    this._Khoangcach,
  ) : super.constructor(MaKh, TenKh, Soluong, Giaban);
  void setKhoangcach(double khoangcach) {
    if (khoangcach < 0) {
      print('Vui long nhap khoang cach > 0 ');
    } else {
      this._Khoangcach = khoangcach;
    }
  }

  double getKhoangcach() => this._Khoangcach;
  void Nhap_Khoangcach() {
    double? khoangcach = 0;
    while (true) {
      stdout.write('Nhap khoang cach cua khach hang ma ${getMaKh()} : ');
      khoangcach = double.tryParse(stdin.readLineSync() ?? '');
      if (khoangcach == null) {
        print('Khoang cach khong duoc de trong ! ');
        continue;
      } else if (khoangcach < 0) {
        print('Nhap khoang cach > 0 ');
        continue;
      }
      setKhoangcach(khoangcach);
      break;
    }
  }

  void Nhap() {
    super.Nhap();
    Nhap_Khoangcach();
  }

  void Hienthi() {
    super.Hienthi();
    print('Khoang cach cua khach hang ${getMaKh()} : ${getKhoangcach()}');
    print('Tro gia cho ${getMaKh()} : ${Trogia()}');
  }

  double Chietkhau() {
    double chietkhau = 0;
    if ((getSoluong() >= 3)) {
      chietkhau += ((1 / 20) * getGiaban() * getSoluong());
    }
    if (getKhoangcach() < 10) {
      chietkhau += 50000 * getSoluong();
    }
    return chietkhau;
  }

  double Thanhtien() {
    return getSoluong() * getGiaban() - Chietkhau() + VAT();
  }

  double Trogia() {
    double trogia = (1 / 50) * getGiaban() * getSoluong();
    if (getSoluong() > 2) {
      trogia += 100000;
    }
    return trogia;
  }
}
