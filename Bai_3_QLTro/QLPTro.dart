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
  bool ktraMaphong(String maPhong) {
    for (var check in danhSach) {
      if (check.getmaPhong() == maPhong) {
        return true;
      }
    }
    return false;
  }

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
          do {
            phonga.nhap_maPhong();
            if (ktraMaphong(phonga.getmaPhong())) {
              print('Ma phong da ton tai !!');
            }
          } while (ktraMaphong(phonga.getmaPhong()));
          phonga.nhap_soNguoi();
          phonga.nhap_tienDien();
          phonga.nhap_soNuoc();
          phonga.nhap_nguoithan();
          danhSach.add(phonga);
          break;
        case 2:
          phongB phongb = phongB();
          do {
            phongb.nhap_maPhong();
            if (ktraMaphong(phongb.getmaPhong())) {
              print('Ma phong da ton tai !');
            }
          } while (ktraMaphong(phongb.getmaPhong()));
          phongb.nhap_soNguoi();
          phongb.nhap_tienDien();
          phongb.nhap_soNuoc();
          phongb.nhap_giatUi();
          phongb.nhap_soMay();
          danhSach.add(phongb);
          break;
        case 3:
          print('Thoat nhap phong');
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
      if (ds.getsoNguoi() > 2) {
        print('* Thong tin nguoi thue tro so ${i + 1} *');
        i++;
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
      for (int j = i + 1; j < danhSach.length; j++) {
        if (danhSach[i].gettienDien() < danhSach[j].gettienDien()) {
          phongTro tempt = danhSach[i];
          danhSach[i] = danhSach[j];
          danhSach[j] = tempt;
        }
      }
    }
    print(
      '------------------------------SAP XEP------------------------------',
    );
    hienThi();
  }

  void Aphong() {
    print(
      '------------------------------DANH SACH PHONG A------------------------------',
    );
    for (var check in danhSach) {
      if (check is phongA) {
        check.hienThi();
      }
    }
  }

  void docFile() {
    File file = File('phongthue.txt');
    if (!file.existsSync()) {
      print('File khong ton tai ! ');
      print(Directory.current.path);
      return;
    }
    List<String> lines = file.readAsLinesSync();
    for (var line in lines) {
      if (line.trim().isEmpty) continue;
      List<String> tach = line.split('##');
      String maPhong = tach[0];
      List<String> data = tach[1].split('#');
      if (maPhong.startsWith('A')) {
        phongA p = phongA();
        p.setmaPhong(maPhong);
        p.setsoNguoi(int.parse(data[0]));
        p.setsoNuoc(double.parse(data[1]));
        p.settienDien(double.parse(data[2]));
        p.setngThan(int.parse(data[3]));
        danhSach.add(p);
      } else if (maPhong.startsWith('B')) {
        phongB p = phongB();
        p.setmaPhong(maPhong);
        p.setsoNguoi(int.parse(data[0]));
        p.setsoNuoc(double.parse(data[1]));
        p.settienDien(double.parse(data[2]));
        p.setgiatUi(double.parse(data[3]));
        p.setsoMay(int.parse(data[4]));
        danhSach.add(p);
      }
    }
    print('Doc file thanh cong');
  }

  void menu() {
    while (true) {
      print('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++');
      print('1. Nhap danh sach phong tro');
      print('2. In danh sach phong tro');
      print('3. Danh sach phong tro co so nguoi > 2 ');
      print('4. Tong tien phong tro');
      print('5. Sap xep phong tro giam dan theo tien dien');
      print('6. Doc file phong tro');
      print('7. THOAT!!');
      print('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++');
      print('Nhap lua chon : ');
      int luachon = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
      switch (luachon) {
        case 1:
          nhap();
          break;
        case 2:
          hienThi();
          break;
        case 3:
          hienThi_nguoilonhon2();
          break;
        case 4:
          tongTien();
          break;
        case 5:
          sapXep();
          break;
        case 6:
          docFile();
          break;
        case 7:
          print('Thoat chuong trinh');
          return;
        default:
          print('Vui long chon lai !! ');
      }
    }
  }
}

void main() {
  quanLitro ql = quanLitro();
  ql.menu();
}
