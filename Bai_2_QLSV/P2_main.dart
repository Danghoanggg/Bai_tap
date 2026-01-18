import 'P1.dart';
import 'dart:io';

class QLNV {
  List<NhanVien> _danhsach = [];
  void themNV() {
    NhanVien nv = NhanVien();
    nv.nhap();
    _danhsach.add(nv);
    print('Them moi thanh cong !!');
  }

  void inNV() {
    if (_danhsach.isEmpty) {
      print('Danh sach rong');
      return;
    } else {
      print('Tong so nhan vien : ${_danhsach.length}');
      for (var nv in _danhsach) {
        nv.hienThi();
      }
    }
  }

  void bangLuong() {
    print('---------------Bang Luong--------------');
    for (var nv in _danhsach) {
      print('Luong cua ${nv.getmaNV()} : ${nv.tinhLuong()}');
    }
  }

  void meNu() {
    while (true) {
      print('----------------------------------------------');
      print('1.Them nhan vien');
      print('2.In nhan vien');
      print('3.Luong nhan vien');
      print('4.Thoat');
      print('----------------------------------------------');
      int chon = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
      switch (chon) {
        case 1:
          themNV();
          break;
        case 2:
          inNV();
          break;
        case 3:
          bangLuong();
          break;
        case 4:
          print('Thoat chuong trinh');
          return;
        default:
          print('Lua chon sai!!');
      }
    }
  }
}

void main() {
  QLNV qlnv = QLNV();
  qlnv.meNu();
}
