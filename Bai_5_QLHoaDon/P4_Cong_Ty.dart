import 'P1_Hoadon.dart';
import 'dart:io';

class CongTy extends Hoadon {
  int _SoluongNV = 0;
  CongTy() : super();
  CongTy.constructor(
    String MaKh,
    String TenKh,
    int Soluong,
    double Giaban,
    this._SoluongNV,
  ) : super.constructor(MaKh, TenKh, Soluong, Giaban);
  void setSoluongNV(int soluongnv) {
    this._SoluongNV = soluongnv;
  }

  int getSoluongNV() => this._SoluongNV;
  void Nhap_SoluongNV() {
    int? soluong;
    while (true) {
      stdout.write('Nhap so luong nhan vien ma ${getMaKh()} : ');
      soluong = int.tryParse(stdin.readLineSync() ?? '');
      if (soluong == null) {
        print('So luong nhan vien khong duoc de trong !');
        continue;
      } else if (soluong < 0) {
        print('Nhap so luong nhan vien > 0');
        continue;
      }
      setSoluongNV(soluong);
      break;
    }
  }

  void Nhap() {
    super.Nhap();
    Nhap_SoluongNV();
  }

  void Hienthi() {
    super.Hienthi();
    print('So luong nhan vien cua ${getMaKh()} : ${getSoluongNV()}');
    print('Tro gia cho ${getMaKh()} : ${Trogia()}');
  }

  double Chietkhau() {
    if (getSoluongNV() > 5000) {
      return 0.07 * getGiaban() * getSoluong();
    } else if (getSoluongNV() > 1000) {
      return 0.05 * getGiaban() * getSoluong();
    } else {
      return 0;
    }
  }

  double Thanhtien() {
    return getSoluong() * getGiaban() - Chietkhau() + VAT() - Trogia();
  }

  double Trogia() {
    double sum = 0;
    sum += 120000 * getSoluong();
    return sum;
  }
}
