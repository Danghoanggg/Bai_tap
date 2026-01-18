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

class KySu extends CanBo {
  String _daoTao = '';
  KySu() : super();
  KySu.khaibao({
    String hoTen = '',
    int tuoi = 0,
    String gioiTinh = '',
    String dChi = '',
    String daoTao = '',
  }) : _daoTao = daoTao,
       super.khaibao(hoTen, tuoi, gioiTinh, dChi);
  void setdaoTao(String daoTao) {
    this._daoTao = daoTao;
  }

  String getdaoTao() => this._daoTao;
  void nhap() {
    super.nhap();
    stdout.write('Nhap chuong trinh dao tao : ');
    setdaoTao(stdin.readLineSync() ?? '');
  }

  void hienThi() {
    super.hienThi();
    stdout.write('Chuong trinh dao tao : ${getdaoTao()}');
  }
}

void main() {
  KySu k = KySu();
  k.nhap();
  k.hienThi();
}
