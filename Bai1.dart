import 'dart:io';

/*Một đơn vị sản xuất có các cán bộ gồm công nhân, kỹ sư và nhân viên.
   Mỗi cán bộ cần quản lý các thông tin cơ bản như họ tên, tuổi, giới tính (nam, nữ, khác) và địa chỉ. 
   Ngoài các thuộc tính chung đó, công nhân có thêm thuộc tính bậc (từ 1 đến 10), kỹ sư có
   thuộc tính ngành đào tạo, còn nhân viên có thuộc tính công việc. 
   Yêu cầu xây dựng lớp CanBo làm lớp cha, các lớp CongNhan, KySu và NhanVien kế thừa từ lớp CanBo.
  Đồng thời xây dựng lớp QLCB (Quản lý cán bộ) để quản lý danh sách cán bộ với các chức năng:
    thêm mới cán bộ, tìm kiếm cán bộ theo họ tên, hiển thị danh sách cán bộ và thoát khỏi chương trình.
  */
class CanBo {
  String _hoTen = '', _gioiTinh = '', _dChi = '';
  int _tuoi = 0;
  // CanBo(this._hoTen, this._tuoi, this._gioiTinh, this._dChi);
  CanBo();
  void setTen(String hoTen) {
    this._hoTen = hoTen;
  }

  void settuoi(int tuoi) {
    if (tuoi >= 0) {
      this._tuoi = tuoi;
    } else {
      print('Tuoi khong hop le');
    }
  }

  void setgTinh(String gioiTinh) {
    this._gioiTinh = gioiTinh;
  }

  void setdchi(String dChi) {
    this._dChi = dChi;
  }

  void nhap() {
    stdout.write('Nhap ho va ten : ');
    this._hoTen = stdin.readLineSync() ?? '';
    do {
      stdout.write('Nhap tuoi : ');
      settuoi(int.parse(stdin.readLineSync() ?? '0'));
    } while (_tuoi <= 0);

    stdout.write('Nhap gioi tinh : ');
    this._gioiTinh = stdin.readLineSync() ?? '';
    stdout.write('Nhap dia chi : ');
    this._dChi = stdin.readLineSync() ?? '';
  }
}

void main() {
  CanBo c = CanBo();
  c.nhap();
}
