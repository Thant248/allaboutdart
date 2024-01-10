void main() {
  3.parsee();
  List<int> t = [1, 2, 4];
  print(t.doubleLength);
  print(t.split(1));
  print(t.reversed);
}

//Extension methods add functionality to existing libraries.
//You might use extension methods without even knowing it.
// For example, when you use code completion in an IDE,
// it suggests extension methods alongside regular methods.

extension NumParsin on num {
  void parsee() {
    if (this == 1) {
      print("一番");
    } else if (this == 2) {
      print("二番");
    } else if (this == 3) {
      print("三番");
    } else if (this == 4) {
      print("四番");
    } else if (this == 5) {
      print("五番");
    } else if (this == 6) {
      print("六月");
    } else if (this == 7) {
      print("七番");
    } else if (this == 8) {
      print("八番");
    } else if (this == 9) {
      print("九番");
    } else {
      print("十番");
    }
  }
}

extension MyFancyList<T> on List<T> {
  int get doubleLength => length * 2;
  List<T> operator -() => reversed.toList();
  List<List<T>> split(int at) => [sublist(0, at), sublist(at)];
}
