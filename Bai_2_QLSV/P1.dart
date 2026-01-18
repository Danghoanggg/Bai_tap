import 'dart:ffi';
import 'dart:io';

/*
a. Xây dựng lớp nhân viên với các thông tin: ma nhân viên, ten nhân viên, hệ so lương,
phòng ban, số ngày làm việc; Phương thức: Xếp loại, Tính thu nhập, toString lấy các
thông tin nhân viên: mã nhân viên, tên nhân viên, hệ số lương, số ngày làm việc, xếp
loại và lương.
Biết rằng xếp loại dựa vào số ngày làm việc theo điều kiện: Nếu số ngày làm việc >25
loại A, nếu số ngày làm việc >22 loại B, còn lại loại C.
Lương = 2340 * hệ số lương * hệ số thi đua. Trong đó hệ số thi đua là 1.00; 0.75 và
0.50 tương ứng với loại thi đua là A, B, C.
*/
enum XepLoai { A, B, C }

class NhanVien {
  String _maNv = '', _tenNv = '', phongBan = '';
  double _hesoLuong = 0.0;
  int soNgaylam = 0;
  NhanVien();
  NhanVien.construction(
    this._maNv,
    this._tenNv,
    this._hesoLuong,
    this.phongBan,
    this.soNgaylam,
  );
  String getmaNV() => this._maNv;
  String gettenNv() => this._tenNv;
  double gethesoLuong() => this._hesoLuong;
  String getphongBan() => this.phongBan;
  int getsoNgaylam() => this.soNgaylam;
  void setmaNv(String maNv) {
    if ((maNv == '') && (maNv == maNv)) {
      print('Vui long nhap ma nhan vien ');
    } else {
      this._maNv = maNv;
    }
  }

  void settenNv(String tenNv) {
    if (tenNv == '') {
      print('Vui long nhap ten nhan vien ');
    } else {
      this._tenNv = tenNv;
    }
  }

  void sethesoLuong(double hesoLuong) {
    if (hesoLuong < 0) {
      print('Vui long nhap he so luong > 0');
    } else {
      this._hesoLuong = hesoLuong;
    }
  }

  void setphongBan(String phongBan) {
    if (phongBan == '') {
      print('Vui long nhap ten nhan vien ');
    } else {
      this.phongBan = phongBan;
    }
  }

  void setsoNgaylam(int soNgaylam) {
    if (soNgaylam < 0) {
      print('Vui long nhap lai so ngay lam ! ');
    } else {
      this.soNgaylam = soNgaylam;
    }
  }

  void nhap() {
    do {
      stdout.write('Nhap ma nhan vien : ');
      setmaNv(stdin.readLineSync() ?? '');
    } while (this._maNv == '');
    do {
      stdout.write('Nhap ten nhan vien : ');
      settenNv(stdin.readLineSync() ?? '');
    } while (this._tenNv == '');
    do {
      stdout.write('Nhap he so luong : ');
      sethesoLuong(double.tryParse(stdin.readLineSync() ?? '') ?? 0.0);
    } while (this._hesoLuong == 0);
    do {
      stdout.write('Nhap phong ban : ');
      setphongBan(stdin.readLineSync() ?? '');
    } while (this.phongBan == '');
    do {
      stdout.write('Nhap so ngay lam viec cua ${this.getmaNV()} : ');
      setsoNgaylam(int.tryParse(stdin.readLineSync() ?? '') ?? 0);
    } while (this.soNgaylam == 0);
  }

  void hienThi() {
    print('Ma nhan vien : ${this.getmaNV()}');
    print('Ten nhan vien : ${this.gettenNv()}');
    print('He so luong : ${this.gethesoLuong()}');
    print('Phong ban : ${this.getphongBan()}');
    print('So ngay lam viec : ${this.getsoNgaylam()}');
  }

  XepLoai xepLoai() {
    int soNgayLam = this.getsoNgaylam();
    if (soNgayLam > 25) return XepLoai.A;
    if (soNgayLam >= 22) return XepLoai.B;
    return XepLoai.C;
  }

  double tinhLuong() {
    double heSoLuong = this.gethesoLuong();
    switch (xepLoai()) {
      case XepLoai.A:
        return 2340 * heSoLuong;
      case XepLoai.B:
        return 2340 * heSoLuong * 0.75;
      case XepLoai.C:
        return 2340 * heSoLuong * 0.5;
    }
  }
}
