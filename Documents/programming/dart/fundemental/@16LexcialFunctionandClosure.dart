void main() {
  //Dart is a lexically scoped language.
  // Lexically scoped means that as we move downwards to the latest variable declaration,
  //the variable value will depend on the innermost scope in which the variable is present.
  var language = 'Dart';
  void printLanguage() {
    language = 'DartLang';
    print("Language is ${language}");
  }

  printLanguage();
  anotherfunction();
}
//another function

void anotherfunction() {
  String language = "Dart";
  void outerFunction() {
    String level = 'one';
    String ex = "scope";
    void innerFunction() {
      Map level = {'count': "Two"};
      print('ex: $ex, level: $level');
      print('Language: $language');
    }

    innerFunction();
    print('ex: $ex, level: $level');
  }

  outerFunction();
}
