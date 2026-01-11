import 'dart:io';
import 'Bai1.dart'; // CanBo
import 'Bai2.dart';
import 'Bai3.dart';
import 'Bai4.dart';

class QLCB {
  List<CanBo> _danhSach = [];

  // 1. Thêm cán bộ
  void themCanBo() {
    print('1. Cong nhan');
    print('2. Ky su');
    print('3. Nhan vien');
    stdout.write('Chon loai can bo: ');

    int chon = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
    CanBo? cb;

    switch (chon) {
      case 1:
        cb = CongNhan();
        break;
      case 2:
        cb = KySu();
        break;
      case 3:
        cb = NhanVien();
        break;
      default:
        print('Lua chon khong hop le');
        return;
    }

    cb.nhap();
    _danhSach.add(cb);
    print('Them thanh cong!');
  }

  // 2. Tìm theo tên
  void timTheoTen() {
    stdout.write('Nhap ten can tim: ');
    String ten = stdin.readLineSync() ?? '';

    for (var cb in _danhSach) {
      if (cb.getTen().contains(ten)) {
        cb.hienThi();
        print('----------------');
      }
    }
  }

  // 3. Hiển thị danh sách
  void hienThiDS() {
    if (_danhSach.isEmpty) {
      print('Danh sach rong');
      return;
    }
    for (var cb in _danhSach) {
      cb.hienThi();
      print('\n----------------');
    }
  }

  // 4. Menu
  void menu() {
    while (true) {
      print('\n===== MENU =====');
      print('1. Them can bo');
      print('2. Tim theo ten');
      print('3. Hien thi danh sach');
      print('4. Thoat');
      stdout.write('Chon: ');

      int chon = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

      switch (chon) {
        case 1:
          themCanBo();
          break;
        case 2:
          timTheoTen();
          break;
        case 3:
          hienThiDS();
          break;
        case 4:
          print('Thoat chuong trinh');
          return;
        default:
          print('Lua chon sai');
      }
    }
  }
}

void main() {
  QLCB qlcb = QLCB();
  qlcb.menu();
  print('Hello')
}
