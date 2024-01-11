//

void main() async {
  countSecond(4);
  print(await fetchUserOrder());
}

Future<String> fetchUserOrder() {
  return Future.delayed(Duration(seconds: 4), () => "Large Latte");
}

Future<String> userOrder() async {
  print("Await userOrder....");
  var order = await fetchUserOrder();
  return "Your Order is : $order";
}

void countSecond(int i) {
  for (int j = 0; j <= i; j++) {
    Future.delayed(Duration(seconds: j), () => print(j));
  }
}
