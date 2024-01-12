import 'dart:math';

void main() {
  AboutErrorHandling error = AboutErrorHandling();

  try {
    // error.divided();
    NumberBetweenOneAndTen(9);
  } on OutOfMemoryError catch (e) {
    print("erro occur ${e.runtimeType}");
  } on IntegerDivisionByZeroException catch (e) {
    print("cannot divided by o ${e.runtimeType}\n");
  } on NumberGreaterThanTen catch (e) {
    print("your number is greater than $e");
  } on NumberLessThanOne catch (e) {
    print("your number is less than");
  } catch (e) {
    print(e.toString());
  } finally {
    error.minus();
    error.plus();
  }
}

//Your Dart code can throw and catch exceptions. Exceptions are errors indicating that something unexpected happened.
// If the exception isn’t caught, the isolate that raised the exception is suspended,
//and typically the isolate and its program are terminated.

//In contrast to Java, all of Dart’s exceptions are unchecked exceptions.
// Methods don’t declare which exceptions they might throw, and you aren’t required to catch any exceptions.

// Dart provides Exception and Error types, as well as numerous predefined subtypes.
// You can, of course, define your own exceptions. However,
// Dart programs can throw any non-null object—not just Exception and Error objects—as an exception.

class AboutErrorHandling {
  void divided() {
    int number = 2 ~/ 0;
    print(number);
  }

  void plus() {
    int number = 2 + 1;
    print(number);
  }

  void minus() {
    int number = 100 - 90;
    print(number);
  }
}

void NumberBetweenOneAndTen(int num) {
  if (num > 10) {
    throw new NumberGreaterThanTen("Your Number $num is Greater than 10");
  } else if (num < 0) {
    throw new NumberLessThanOne("Your Number $num is less than zero");
  } else {
    print(num);
  }
}

class NumberGreaterThanTen implements Exception {
  final String errorType;
  NumberGreaterThanTen(this.errorType) {}
}

class NumberLessThanOne implements Exception {
  final String errorType;
  NumberLessThanOne(this.errorType) {}
}
