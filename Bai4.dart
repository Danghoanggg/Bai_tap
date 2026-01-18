/*Một đơn vị sản xuất có các cán bộ gồm công nhân, kỹ sư và nhân viên.
   Mỗi cán bộ cần quản lý các thông tin cơ bản như họ tên, tuổi, giới tính (nam, nữ, khác) và địa chỉ. 
   Ngoài các thuộc tính chung đó, công nhân có thêm thuộc tính bậc (từ 1 đến 10), kỹ sư có
   thuộc tính ngành đào tạo, còn nhân viên có thuộc tính công việc. 
   Yêu cầu xây dựng lớp CanBo làm lớp cha, các lớp CongNhan, KySu và NhanVien kế thừa từ lớp CanBo.
  Đồng thời xây dựng lớp QLCB (Quản lý cán bộ) để quản lý danh sách cán bộ với các chức năng:
    thêm mới cán bộ, tìm kiếm cán bộ theo họ tên, hiển thị danh sách cán bộ và thoát khỏi chương trình.
  */
import 'Bai1.dart';
import 'dart:io';

class NhanVien extends CanBo {
  String _congViec = '';
  NhanVien() : super();
  NhanVien.khaibao({
    String hoTen = '',
    int tuoi = 0,
    String gioiTinh = '',
    String dChi = '',
    String congViec = '',
  }) : _congViec = congViec,
       super.khaibao(hoTen, tuoi, gioiTinh, dChi);
  void setcongViec(String congViec) {
    this._congViec = congViec;
  }

  String getcongViec() => this._congViec;
  void nhap() {
    super.nhap();
    stdout.write('Nhap cong viec nhan vien : ');
    setcongViec(stdin.readLineSync() ?? '');
  }

  void hienThi() {
    super.hienThi();
    stdout.write('Cong viec : ${getcongViec()}');
  }
}

void main() {
  NhanVien n = NhanVien();
  n.nhap();
  n.hienThi();
}
