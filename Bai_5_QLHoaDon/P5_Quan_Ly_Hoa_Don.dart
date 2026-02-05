import 'P1_Hoadon.dart';
import 'dart:io';

import 'P2_Khach_hang_ca_nhan.dart';
import 'P3_Dai_Ly_Cap_1.dart';
import 'P4_Cong_Ty.dart';

class QuanLyHoaDon {
  List<Hoadon> _danhsachHoaDon = [];
  QuanLyHoaDon();
  bool kiemtraMatrung(String maKH) {
    for (var temp in _danhsachHoaDon) {
      if (temp.getMaKh() == maKH) {
        return true;
      }
    }
    return false;
  }

  bool Nhap_motlan() {
    print('+++++++++++++++++++++++++++++++++++');
    print('1.Khach hang ca nhan');
    print('2.Dai ly cap 1');
    print('3.Cong ty<----->Doanh nghiep');
    print('4.THOAT');
    print('+++++++++++++++++++++++++++++++++++');
    stdout.write('Nhap lua chon : ');
    int luachon = int.tryParse(stdin.readLineSync() ?? '') ?? -1;
    switch (luachon) {
      case 1:
        KhachHangCaNhan temp = KhachHangCaNhan();
        do {
          temp.Nhap_MaKh();
          if (kiemtraMatrung(temp.getMaKh())) {
            print('Ma khach hang da ton tai !');
          }
        } while (kiemtraMatrung(temp.getMaKh()));
        temp.Nhap();
        _danhsachHoaDon.add(temp);
        return true;
      case 2:
        DaiLyCap1 temp = DaiLyCap1();
        do {
          temp.Nhap_MaKh();
          if (kiemtraMatrung(temp.getMaKh())) {
            print('Ma khach hang da ton tai !');
          }
        } while (kiemtraMatrung(temp.getMaKh()));
        temp.Nhap();
        _danhsachHoaDon.add(temp);
        return true;
      case 3:
        CongTy temp = CongTy();
        do {
          temp.Nhap_MaKh();
          if (kiemtraMatrung(temp.getMaKh())) {
            print('Ma khach hang da ton tai !');
          }
        } while (kiemtraMatrung(temp.getMaKh()));
        temp.Nhap();
        _danhsachHoaDon.add(temp);
        return true;
      case 4:
        print('THOAT CHUONG TRINH !');
        return false;
      default:
        print('Lua chon khong ton tai !');
        return true;
    }
  }

  void Nhap() {
    while (Nhap_motlan()) {}
  }

  void HienThi() {
    print('---------------DANH SACH HOA DON---------------');
    for (var temp in _danhsachHoaDon) {
      temp.Hienthi();
    }
  }

  void Tongthanhtien() {
    double sum = 0;
    for (var temp in _danhsachHoaDon) {
      sum += temp.Thanhtien();
    }
    print('====> Tong thanh tien cac hoa don : ${sum}');
  }

  void Tongtrogia() {
    double sum = 0;
    for (var temp in _danhsachHoaDon) {
      sum += temp.Trogia();
    }
    print('====> Tong tro gia cac hoa don : ${sum}');
  }

  void Tongchietkhau() {
    double sum = 0;
    for (var temp in _danhsachHoaDon) {
      sum += temp.Chietkhau();
    }
    print('====> Tong chiet khau cac hoa don : ${sum}');
  }

  void Muanhieu() {
    Hoadon max = _danhsachHoaDon[0];
    for (int i = 0; i < _danhsachHoaDon.length; i++) {
      if (max.getSoluong() < _danhsachHoaDon[i].getSoluong()) {
        max = _danhsachHoaDon[i];
      }
    }
    print('====>Khach hang mua nhieu nhat<====');
    max.Hienthi();
  }

  void swap(int a, int b) {
    var temp = _danhsachHoaDon[a];
    _danhsachHoaDon[a] = _danhsachHoaDon[b];
    _danhsachHoaDon[b] = temp;
  }

  void Sapxep_theosoluong() {
    print(
      '-----------------------SAP XEP TANG DAN THEO SO LUONG-----------------------',
    );
    for (int i = 0; i < _danhsachHoaDon.length - 1; i++) {
      for (int j = i + 1; j < _danhsachHoaDon.length; j++) {
        if (_danhsachHoaDon[i].getSoluong() > _danhsachHoaDon[j].getSoluong()) {
          swap(i, j);
        } else if ((_danhsachHoaDon[i].getSoluong() ==
                _danhsachHoaDon[j].getSoluong()) &&
            (_danhsachHoaDon[i].Thanhtien() < _danhsachHoaDon[j].Thanhtien())) {
          swap(i, j);
        }
      }
    }
    HienThi();
  }

  void Docfile() {
    File file = File('hoadon.txt');
    if (!file.existsSync()) {
      print('File khong ton tai ! ');
      print(Directory.current.path);
    }
    List<String> line = file.readAsLinesSync();
    for (var lines in line) {
      if (lines.trim().isEmpty) continue;
      try {
        List<String> tach = lines.split('##');
        String maHD = tach[0];
        kiemtraMatrung(maHD);
        List<String> data = tach[1].split('#');
        if (maHD.startsWith('KH1')) {
          KhachHangCaNhan temp = KhachHangCaNhan();
          temp.setMaKH(maHD);
          temp.setTenKH(data[0]);
          temp.setSoluong(int.parse(data[1]));
          temp.setGiaban(double.parse(data[2]));
          temp.setKhoangcach(double.parse(data[3]));
          _danhsachHoaDon.add(temp);
        } else if (maHD.startsWith('KH2')) {
          DaiLyCap1 temp = DaiLyCap1();
          temp.setMaKH(maHD);
          temp.setTenKH(data[0]);
          temp.setSoluong(int.parse(data[1]));
          temp.setGiaban(double.parse(data[2]));
          temp.setTGhoptac(double.parse(data[3]));
          _danhsachHoaDon.add(temp);
        }
        if (maHD.startsWith('KH3')) {
          CongTy temp = CongTy();
          temp.setMaKH(maHD);
          temp.setTenKH(data[0]);
          temp.setSoluong(int.parse(data[1]));
          temp.setGiaban(double.parse(data[2]));
          temp.setSoluongNV(int.parse(data[3]));
          _danhsachHoaDon.add(temp);
        }
      } catch (e) {
        print('Dong loi ${lines}');
      }
    }
    print('Doc file thanh cong');
  }

  Hoadon? Kiemtra(String maKH) {
    for (var temp in _danhsachHoaDon) {
      if (maKH == temp.getMaKh()) {
        return temp;
      }
    }
    return null;
  }

  String Nhapmatimkiem() {
    String maKH = '';
    while (true) {
      stdout.write('Nhap ma khach can tim : ');
      maKH = stdin.readLineSync() ?? '';
      maKH = maKH.toUpperCase();
      if (maKH.isEmpty) {
        print('Khong duoc de ma khach hang trong!');
        continue;
      } else if (!maKH.startsWith('KH')) {
        print('Vui long nhap ma khach hang bat dau == (KH)');
        continue;
      } else if (!(maKH.length == 6)) {
        print('Vui long nhap ma can tim = 6');
        continue;
      } else {
        String input = maKH.substring(2);
        if (int.tryParse(input) == null) {
          continue;
        }
      }
      return maKH;
    }
  }

  void Timkiem() {
    String maKH = Nhapmatimkiem();
    Hoadon? check = Kiemtra(maKH);

    if (check == null) {
      print('KHACH HANG LA!');
    } else {
      print('=====>THONG TIN KHACH HANG MA : ${maKH}<=====');
      print(check);
      check.Hienthi();
    }
  }

  void Menu() {
    while (true) {
      print('------------------MENU------------------');
      print('1.Nhap danh sach hoa don ');
      print('2.In danh sach hoa don ');
      print('3.Tong thanh tien hoa don ');
      print('4.Tong tro gia hoa don ');
      print('5.thong tin khach hang co so luong mua nhieu nhat ');
      print('6.Tong so tien triet khau hoa don ');
      print('7.Sap xep danh sach tang dan theo so luong ');
      print('8.Tim kiem khach hang theo ma ');
      print('9.Doc file danh sach hoa don ');
      print('10.THOAT');
      print('------------------MENU------------------');
      stdout.write('Nhap lua chon : ');
      int luachon = int.tryParse(stdin.readLineSync() ?? '') ?? -1;
      switch (luachon) {
        case 1:
          Nhap();
          break;
        case 2:
          HienThi();
          break;
        case 3:
          Tongthanhtien();
          break;
        case 4:
          Tongtrogia();
          break;
        case 5:
          Muanhieu();
          break;
        case 6:
          Tongchietkhau();
          break;
        case 7:
          Sapxep_theosoluong();
          break;
        case 8:
          Timkiem();
          break;
        case 9:
          Docfile();
          break;
        case 10:
          print('THOAT CHUONG TRINH');
          return;
        default:
          print('Lua chon khong ton tai');
      }
    }
  }
}

void main() {
  QuanLyHoaDon qlhd = QuanLyHoaDon();
  qlhd.Menu();
}
