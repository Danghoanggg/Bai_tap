/*
Bài tập 1. Thiết kế và xây dựng lớp cho chương trình tính tiền phòng hàng tháng cho một cơ sở cho thuê phòng trọ.
Biết rằng mỗi phòng đều có thông tin sau: Mã số phòng, số người ở, số điện và số nước sử dụng. Cơ sở chia phòng ra làm 2 loại khác nhau:
Phòng loại B: Có thêm thông tin khối lượng giặt ủi (giatui), và số máy sử dụng internet (somay).
Tiền phòng = 2000 + 2*Số điện + 8*Số nước + Giatui*5 + Somay*100
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
import 'dart:io';
import 'P2_A.dart';
import 'P2_B.dart';

abstract class phongTro {
  String _maPhong = '';
  int _soNguoi = 0;
  double _tienDien = 0.0, _soNuoc = 0.0;
  phongTro();
  phongTro.construction(
    this._maPhong,
    this._soNguoi,
    this._soNuoc,
    this._tienDien,
  );
  String getmaPhong() => this._maPhong;
  int getsoNguoi() => this._soNguoi;
  double gettienDien() => this._tienDien;
  double getsoNuoc() => this._soNuoc;
  void setmaPhong(String maPhong) {
    if ((maPhong.isEmpty) && (maPhong == maPhong)) {
      print('Vui long nhap ma phong ! ');
    } else {
      this._maPhong = maPhong;
    }
  }

  void setsoNguoi(int soNguoi) {
    if (soNguoi <= 0) {
      print('So nguoi khong hop le ! ');
    } else {
      this._soNguoi = soNguoi;
    }
  }

  void settienDien(double tienDien) {
    if (tienDien <= 0) {
      print('So tien dien khong hop le ! ');
    } else {
      this._tienDien = tienDien;
    }
  }

  void setsoNuoc(double soNuoc) {
    if (soNuoc <= 0) {
      print('So nuoc khong hop le ! ');
    } else {
      this._soNuoc = soNuoc;
    }
  }

  void nhap_maPhong() {
    do {
      stdout.write('Nhap ma phong tro : ');
      setmaPhong(stdin.readLineSync() ?? '');
    } while (this._maPhong == '');
  }

  void nhap_soNguoi() {
    do {
      stdout.write('Nhap so nguoi : ');
      setsoNguoi(int.tryParse(stdin.readLineSync() ?? '') ?? 0);
    } while (this._soNguoi <= 0);
  }

  void nhap_tienDien() {
    do {
      stdout.write('Nhap so tien dien : ');
      settienDien(double.tryParse(stdin.readLineSync() ?? '') ?? 0);
    } while (this._tienDien <= 0);
  }

  void nhap_soNuoc() {
    do {
      stdout.write('Nhap so nuoc : ');
      setsoNuoc(double.tryParse(stdin.readLineSync() ?? '') ?? 0);
    } while (this._soNuoc <= 0);
  }

  void nhap() {
    nhap_maPhong();
    nhap_soNguoi();
    nhap_tienDien();
    nhap_soNuoc();
  }

  void hienThi() {
    print('Ma phong tro : ${getmaPhong()}');
    print('So nguoi thue : ${getsoNguoi()}');
    print('Tien dien : ${gettienDien()}');
    print('So nuoc : ${getsoNuoc()}');
  }

  double tienPhong();
}
