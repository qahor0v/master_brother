bool paymentStatus({
  required String price,
  required String payed,
  required int count,
}) {
  int price0 = int.parse(price);
  int payed0 = int.parse(payed);

  try {
    return price0 * count == payed0 || price0 * count > payed0;
  } catch (e) {
    return false;
  }
}
