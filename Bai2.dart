/*Một đơn vị sản xuất có các cán bộ gồm công nhân, kỹ sư và nhân viên.
   Mỗi cán bộ cần quản lý các thông tin cơ bản như họ tên, tuổi, giới tính (nam, nữ, khác) và địa chỉ. 
   Ngoài các thuộc tính chung đó, công nhân có thêm thuộc tính bậc (từ 1 đến 10), kỹ sư có
   thuộc tính ngành đào tạo, còn nhân viên có thuộc tính công việc. 
   Yêu cầu xây dựng lớp CanBo làm lớp cha, các lớp CongNhan, KySu và NhanVien kế thừa từ lớp CanBo.
  Đồng thời xây dựng lớp QLCB (Quản lý cán bộ) để quản lý danh sách cán bộ với các chức năng:
    thêm mới cán bộ, tìm kiếm cán bộ theo họ tên, hiển thị danh sách cán bộ và thoát khỏi chương trình.
  */
import 'dart:io';
import 'Bai1.dart';

class CongNhan extends CanBo {
  int _capBac = 0;
  CongNhan() : super();
  CongNhan.khaibao({
    String hoTen = '',
    int tuoi = 0,
    String gioiTinh = '',
    String dChi = '',
    int capBac = 0,
  }) : _capBac = capBac,
       super.khaibao(hoTen, tuoi, gioiTinh, dChi);
  void setcapBac(int capBac) {
    if (capBac > 0) {
      this._capBac = capBac;
    } else {
      print('Cap bac khong hop le!');
    }
  }

  int getcapBac() => this._capBac;
  void nhap() {
    super.nhap();
    do {
      stdout.write('Nhap cap bap cong nhan : ');
      setcapBac(int.tryParse(stdin.readLineSync() ?? '') ?? -1);
    } while (this._capBac <= 0);
  }

  void hienThi() {
    super.hienThi();
    stdout.write('Nhap cap bap cong nhan : ${getcapBac()}');
  }
}
