class OrderStatus {
  static const int success = 100;
  static const int cancelled = 0;
  static const int progress = 1;
  static const int not = -1;

  String status(int code) {
    if (code == 100) {
      return "Bajarilgan";
    } else if (code == 0) {
      return "Bekor qilingan";
    } else if (code == 1) {
      return "Jarayonda";
    } else {
      return "Tovar Omborda mavjud emas";
    }
  }
}
