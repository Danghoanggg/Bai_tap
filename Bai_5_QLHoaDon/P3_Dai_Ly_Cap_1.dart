import 'P1_Hoadon.dart';
import 'dart:io';

class DaiLyCap1 extends Hoadon {
  double _TGhoptac = 0;
  DaiLyCap1() : super();
  DaiLyCap1.constructor(
    String MaKh,
    String TenKh,
    int Soluong,
    double Giaban,
    this._TGhoptac,
  ) : super.constructor(MaKh, TenKh, Soluong, Giaban);
  void setTGhoptac(double TGhoptac) {
    this._TGhoptac = TGhoptac;
  }

  double getTGhoptac() => this._TGhoptac;
  void Nhap_TGhoptac() {
    double? tghoptac = 0;
    while (true) {
      stdout.write('Nhap thoi gian hop tac cua ${getMaKh()} : ');
      tghoptac = double.tryParse(stdin.readLineSync() ?? '');
      if (tghoptac == null) {
        print('Khong duoc de thoi gian hop tac trong !');
        continue;
      } else if (tghoptac < 0) {
        print('Nhap thoi gian hop tac > 0');
        continue;
      }
      setTGhoptac(tghoptac);
      break;
    }
  }

  double Chietkhau() {
    double tyLeCK = 0.30; // 30% cơ bản

    if (getTGhoptac() > 5) {
      tyLeCK += (getTGhoptac() - 5) * 0.01;
    }
    if (tyLeCK > 0.35) {
      tyLeCK = 0.35;
    }
    return tyLeCK * getGiaban() * getSoluong();
  }

  double Thanhtien() {
    return getSoluong() * getGiaban() - Chietkhau() + VAT();
  }

  void Nhap() {
    super.Nhap();
    Nhap_TGhoptac();
  }

  void Hienthi() {
    super.Hienthi();
    print('Thoi gian hop tac cua ${getMaKh()} : ${getTGhoptac()}');
  }

  double Trogia() => 0;
}
