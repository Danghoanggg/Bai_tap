import 'P1.dart';
import 'dart:io';
/* 
Phòng loại A: Có thêm thông tin về số lần người thân thăm và ở lại qua đêm (SoNguoithan) và tiền phòng được tính như sau:
Tiền phòng = 1400 + 2*Số điện + 8*Số nước + 50*SoNguoithan
*/

class phongA extends phongTro {
  int _ngThan = 0;
  phongA() : super();
  phongA.constructor(
    String maPhong,
    int soNguoi,
    double tienDien,
    double soNuoc,
    this._ngThan,
  ) : super.construction(maPhong, soNguoi, soNuoc, tienDien);
  void setngThan(int ngThan) {
    if (ngThan < 0) {
      print('Nhap so nguoi tham khong hop le ! ');
    } else {
      this._ngThan = ngThan;
    }
  }

  int getngThan() => this._ngThan;

  void nhap() {
    super.nhap();
    do {
      stdout.write('Nhap so nguoi than den tham : ');
      setngThan(int.tryParse(stdin.readLineSync() ?? '') ?? 0);
    } while (this._ngThan < 0);
  }

  void hienThi() {
    super.hienThi();
    print('So nguoi than den tham : ${getngThan()}');
    print('Tien phong cua ${getmaPhong()} : ${tienPhong()}');
  }

  double tienPhong() {
    return 1400 + 2 * gettienDien() + 8 * getsoNuoc() + 50 * getngThan();
  }
}

void main() {
  phongA a1 = phongA();
  a1.nhap();
  a1.hienThi();
}
