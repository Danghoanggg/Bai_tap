import 'P1_Monhoc.dart';
import 'dart:io';

import 'P2_Lythuyet.dart';
import 'P3_Doan.dart';
import 'P3_Thuchanh.dart';

class QLMH {
  List<Monhoc> _danhsachMonhoc = [];
  QLMH();
  bool kiemtraMa(String Mamon) {
    for (var tempt in _danhsachMonhoc) {
      if (tempt.getMaMon() == Mamon) {
        return true;
      }
    }
    return false;
  }

  void Nhap() {
    while (Nhap_MotLan()) {}
  }

  void HienThi() {
    print('______________________DANH SACH MON HOC______________________');
    for (var tempt in _danhsachMonhoc) {
      tempt.HienThi();
    }
  }

  void Sapxep() {
    print('\t \t _______SAP XEP THEO TIN CHI_______ ');
    for (int i = 0; i < _danhsachMonhoc.length - 1; i++) {
      for (int j = i + 1; j < _danhsachMonhoc.length; j++) {
        if (_danhsachMonhoc[i].getSotinChi() >
            _danhsachMonhoc[j].getSotinChi()) {
          var tempt = _danhsachMonhoc[i];
          _danhsachMonhoc[i] = _danhsachMonhoc[j];
          _danhsachMonhoc[j] = tempt;
        }
      }
    }
    HienThi();
  }

  bool Nhap_MotLan() {
    print('++++++++++++++++++++++++++++++');
    print('1.Nhap mon hoc li thuyet');
    print('2.Nhap mon hoc thuc hanh');
    print('3.Nhap mon hoc do an');
    print('4.THOAT');
    print('++++++++++++++++++++++++++++++');
    stdout.write('Nhap lua chon : ');
    int luachon = int.tryParse(stdin.readLineSync() ?? '') ?? -1;
    switch (luachon) {
      case 1:
        Lythuyet lythuyet = Lythuyet();
        do {
          lythuyet.nhap_Mamon();
          if (kiemtraMa(lythuyet.getMaMon())) {
            print('Ma mon da ton tai ! ');
          }
        } while (kiemtraMa(lythuyet.getMaMon()));
        lythuyet.nhap();
        _danhsachMonhoc.add(lythuyet);
        return true;
      case 2:
        Thuchanh thuchanh = Thuchanh();
        do {
          thuchanh.nhap_Mamon();
          if (kiemtraMa(thuchanh.getMaMon())) {
            print('Ma mon da ton tai ! ');
          }
        } while (kiemtraMa(thuchanh.getMaMon()));
        thuchanh.nhap();
        _danhsachMonhoc.add(thuchanh);
        return true;
      case 3:
        Doan doan = Doan();
        do {
          doan.nhap_Mamon();
          if (kiemtraMa(doan.getMaMon())) {
            print('Ma mon da ton tai ! ');
          }
        } while (kiemtraMa(doan.getMaMon()));
        doan.nhap();
        _danhsachMonhoc.add(doan);
        return true;
      case 4:
        print('THOAT CHUONG TRINH!');
        return false;
      default:
        print('Lua chon khong ton tai !');
        return true;
    }
  }

  // bool Kiemtra(String search) {
  //   for (var temp in _danhsachMonhoc) {
  //     if (search == temp.getTenMon()) {
  //       print('=> Ten mon ton tai ! ');
  //       temp.HienThi();
  //       return true;
  //     }
  //   }
  //   return false;
  // }

  // void Timkiem() {
  //   String search = '';
  //   do {
  //     stdout.write('Nhap ten mon hoc can tim : ');
  //     search = stdin.readLineSync() ?? '';
  //     search = search.trim();
  //     if (search.isEmpty) print('Nhap lai mon can tim kiem');
  //   } while (search.isEmpty);
  //   if (!Kiemtra(search)) {
  //     print('Ten mon khong ton tai ! ');
  //     print('=> Them mon vao danh sach');
  //     Nhap_MotLan();
  //   }
  // }

  Monhoc? Kiemtra(String tenMon) {
    for (var temp in _danhsachMonhoc) {
      if (tenMon.toLowerCase().trim() ==
          temp.getTenMon().toLowerCase().trim()) {
        return temp;
      }
    }
    return null;
  }

  void Timkiem() {
    String tenMon = '';
    do {
      stdout.write('Nhap ten mon can tim : ');
      tenMon = stdin.readLineSync() ?? '';
      tenMon = tenMon.trim();
      if (tenMon.isEmpty) {
        print('Nhap lai ! ');
      }
    } while (tenMon.isEmpty);
    Monhoc? check = Kiemtra(tenMon);
    if (check == null) {
      print('Ten mon khong ton tai ! ');
      print('=> Them mon vao danh sach');
      Nhap_MotLan();
    } else {
      print('=> Ten mon ton tai ! ');
      check.HienThi();
    }
  }

  void Docfile() {
    File file = File('monhoc.txt');
    if (!file.existsSync()) {
      print('File khong ton tai !');
      print(Directory.current.path);
      return;
    }
    List<String> lines = file.readAsLinesSync();
    for (var line in lines) {
      if (line.trim().isEmpty) continue;
      List<String> tach = line.split('##');
      String maMon = tach[0];
      if (kiemtraMa(maMon)) continue;
      List<String> data = tach[1].split('#');
      if (maMon.startsWith('L')) {
        Lythuyet l = Lythuyet();
        l.setMaMon(maMon);
        l.setTenMon(data[0]);
        l.setSotiinChi(int.parse(data[1]));
        l.setDiemTieuluan(double.parse(data[2]));
        l.setDiemCuoiki(double.parse(data[3]));
        _danhsachMonhoc.add(l);
      }
      if (maMon.startsWith('T')) {
        Thuchanh l = Thuchanh();
        l.setMaMon(maMon);
        l.setTenMon(data[0]);
        l.setSotiinChi(int.parse(data[1]));
        l.setDiemkiemtra(double.parse(data[2]));
        l.setDiemkiemtra(double.parse(data[3]));
        l.setDiemkiemtra(double.parse(data[4]));
        _danhsachMonhoc.add(l);
      }
      if (maMon.startsWith('D')) {
        Doan l = Doan();
        l.setMaMon(maMon);
        l.setTenMon(data[0]);
        l.setSotiinChi(int.parse(data[1]));
        l.setDiemGVHD(double.parse(data[2]));
        l.setDiemGVPB(double.parse(data[3]));
        _danhsachMonhoc.add(l);
      }
    }
  }

  void TB_tinchi() {
    int sum = 0;
    if (_danhsachMonhoc.isEmpty) {
      print('Danh sach rong!');
      return;
    }
    for (var temp in _danhsachMonhoc) {
      print('So tin chi mon ${temp.getMaMon()} : ${temp.getSotinChi()}');
      sum += temp.getSotinChi();
    }
    print('So tin chi trung binh cac mon : ${sum / _danhsachMonhoc.length}');
  }

  void HienThi_lythuyet() {
    print('-----------CAC MON LY THUYET-----------');
    for (var temp in _danhsachMonhoc) {
      if (temp.getMaMon().startsWith('L')) {
        temp.HienThi();
      }
    }
  }

  void HienThi_thuchanh() {
    print('-----------CAC MON THUC HANH-----------');
    for (var temp in _danhsachMonhoc) {
      if (temp.getMaMon().startsWith('T')) {
        temp.HienThi();
      }
    }
  }

  void HienThi_doan() {
    print('-----------CAC MON DO AN-----------');
    for (var temp in _danhsachMonhoc) {
      if (temp.getMaMon().startsWith('D')) {
        temp.HienThi();
      }
    }
  }

  void Menu() {
    while (true) {
      print('=======================MENU=======================');
      print('1.Nhap danh sach mon hoc');
      print('2.Hien thi danh sach mon hoc');
      print('3.Sap xep danh sach theo so tin chi');
      print('4.Tim kiem mon hoc');
      print('5.Doc file danh sach mon hoc');
      print('6.Tinh tin chi trung binh mon hoc');
      print('7.Hien thi danh sach mon hoc ly thuyet');
      print('8.Hien thi danh sach mon hoc thuc hanh');
      print('9.Hien thi danh sach mon hoc do an');
      print('10.THOAT!');
      print('=======================MENU=======================');
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
          Sapxep();
          break;
        case 4:
          Timkiem();
          break;
        case 5:
          Docfile();
          break;
        case 6:
          TB_tinchi();
          break;
        case 7:
          HienThi_lythuyet();
          break;
        case 8:
          HienThi_thuchanh();
          break;
        case 9:
          HienThi_doan();
          break;
        case 10:
          print('THOAT CHUONG TRINH');
          return;
        default:
          print('Lua chon khong ton tai ! ');
      }
    }
  }
}

void main() {
  QLMH qlmh = QLMH();
  qlmh.Menu();
}
