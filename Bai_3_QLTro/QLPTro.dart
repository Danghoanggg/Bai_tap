/*
Tạo file phongthue.txt (hoặc file xml tương ứng) có nội dung như sau:
A001##4#30#10#2
A002##6#45#20#4
B001##4#50#20#32#4
B002##2#30#40#20#2
Hãy đọc nội dung file phongthue.txt vào danh sách phòng thuê.
In ra màn hình thông tin các phòng thuê có trong danh sách.
In ra danh sách các phòng có số người ở lớn hơn 2.
Tính tổng tiền phòng thu được từ các phòng.
Sắp xếp danh sách phòng thuê theo thứ tự giảm dần của số điện tiêu thụ.
In ra màn hình danh sách các phòng loại A.
*/
import 'P1.dart';
import 'P2_A.dart';
import 'P2_B.dart';
import 'dart:io';

class quanLitro {
  List<phongTro> danhSach = [];
  quanLitro();
  void nhap() {
    while (true) {
      print('---------------------==----------------------');
      print('1. Phong A : ');
      print('2. Phong B : ');
      print('3. Thoat!');
      print('---------------------==----------------------');
      stdout.write('Nhap lua chon : ');
      int luaChon = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
      switch (luaChon) {
        case 1:
          phongA phonga = phongA();
          phonga.nhap();
          danhSach.add(phonga);
          break;
        case 2:
          phongB phongb = phongB();
          phongb.nhap();
          danhSach.add(phongb);
          break;
        case 3:
          return;
        default:
          print('Lua chon khong hop le ! ');
      }
    }
  }

  void hienThi() {
    int i = 0;
    print('-------------------DANH SACH PHONG TRO-------------------');
    for (var ds in danhSach) {
      print('* Thong tin nguoi thue tro so ${i + 1} *');
      i++;
      ds.hienThi();
    }
  }

  void hienThi_nguoilonhon2() {
    int i = 0;
    print(
      '-------------------DANH SACH PHONG TRO CO SO NGUOI LON HON 2-------------------',
    );
    for (var ds in danhSach) {
      print('* Thong tin nguoi thue tro so ${i + 1} *');
      i++;
      if (ds.getsoNguoi() > 2) {
        ds.hienThi();
      }
    }
  }

  void tongTien() {
    double sum = 0;
    int i = 0;
    print('~~~~~~~~~~TONG TIEN~~~~~~~~~~');
    for (var ds in danhSach) {
      print('Tien phong ${i + 1} : ${ds.tienPhong()} VND');
      i++;
      sum += ds.tienPhong();
    }
    print('Tong tien phong : ${sum}');
  }

  void sapXep() {
    for (int i = 0; i < danhSach.length - 1; i++) {
      for (int j = 1; j < danhSach.length; j++) {
        if (danhSach[i].gettienDien() < danhSach[j].gettienDien()) {
          phongTro tempt = danhSach[i];
          danhSach[i] = danhSach[j];
          danhSach[j] = tempt;
        }
      }
    }
    hienThi();
  }
}

void main() {
  quanLitro ql = quanLitro();
  ql.nhap();
  ql.hienThi();
  ql.tongTien();
  ql.sapXep();
}
