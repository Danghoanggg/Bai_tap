import 'dart:io';

abstract class Hoadon {
  String _MaKh = '', _TenKh = '';
  int _Soluong = 0;
  double _Giaban = 0;
  Hoadon();
  Hoadon.constructor(this._MaKh, this._TenKh, this._Soluong, this._Giaban);
  void setMaKH(String makh) {
    makh = makh.trim();
    if (makh.isEmpty) {
      print('Vui long nhap ma khach hang ! ');
    } else {
      this._MaKh = makh;
    }
  }

  void setTenKH(String tenkh) {
    tenkh = tenkh.trim();
    if (tenkh.isEmpty) {
      print('Khong duoc de trong ten khach hang ! ');
    } else {
      this._TenKh = tenkh;
    }
  }

  void setSoluong(int soluong) {
    this._Soluong = soluong;
  }

  void setGiaban(double giaban) {
    if (giaban < 0) {
      print('Vui long nhap gia ban > 0');
    } else {
      this._Giaban = giaban;
    }
  }

  String getMaKh() => this._MaKh;
  String getTenKh() => this._TenKh;
  int getSoluong() => this._Soluong;
  double getGiaban() => this._Giaban;

  void Nhap_MaKh() {
    String maKh = '';
    while (true) {
      stdout.write('Nhap ma khach hang : ');
      maKh = stdin.readLineSync() ?? '';
      maKh = maKh.toUpperCase();
      if (maKh.isEmpty) {
        print('Ma khach hang khong duoc bo trong ! ');
        continue;
      } else if (!maKh.startsWith('KH')) {
        print('Vui long nhap ma khach hang bat dau == (KH)');
        continue;
      } else if (!(maKh.length == 6)) {
        print('Vui long nhap ma khach hang == 6');
        continue;
      } else {
        String so = maKh.substring(2);
        if (int.tryParse(so) == null) {
          print('Nhap 4 so cuoi la so nguyen!');
          continue;
        }
      }
      setMaKH(maKh);
      break;
    }
  }

  void Nhap_TenKh() {
    do {
      stdout.write('Nhap ten khach hang : ');
      setTenKH(stdin.readLineSync() ?? '');
    } while (getTenKh().isEmpty);
  }

  void Nhap_Soluong() {
    String input = '';
    while (true) {
      stdout.write('Nhap so luong san pham ma ${getMaKh()} : ');
      input = stdin.readLineSync() ?? '';
      int? Soluong = int.tryParse(input);
      if (Soluong == null) {
        print('Vui long nhap so luong la so nguyen ! ');
        continue;
      } else if (Soluong < 0) {
        print('Nhap so luong > 0 ');
        continue;
      } else {
        setSoluong(Soluong);
        break;
      }
    }
  }

  void Nhap_Giaban() {
    do {
      stdout.write('Nhap gia ban 1 san pham ma ${getMaKh()} : ');
      setGiaban(double.tryParse(stdin.readLineSync() ?? '') ?? -1);
    } while (getGiaban() < 0);
  }

  void Nhap() {
    Nhap_TenKh();
    Nhap_Soluong();
    Nhap_Giaban();
  }

  void Hienthi() {
    print('***** Ma khach hang : ${getMaKh()} *****');
    print('Ten khach hang : ${getTenKh()}');
    print('So luong san pham ma ${getMaKh()} : ${getSoluong()}');
    print('Gia ban 1 san pham ma ${getMaKh()} : ${getGiaban()} VND');
    print('Thue VAT cua ${getSoluong()} san pham : ${VAT()}');
    print('Chiet khau cho khach hang ${getMaKh()} : ${Chietkhau()}');
    print('Tro gia cho khach hang ${getMaKh()} : ${Trogia()}');
    print('Thanh tien cua ${getSoluong()} san pham : ${Thanhtien()}');
  }

  double VAT() {
    return (1 / 10) * (getSoluong() * getGiaban());
  }

  double Thanhtien();
  double Chietkhau();
  double Trogia();
}
