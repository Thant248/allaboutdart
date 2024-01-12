import 'dart:collection';

void main() {
  List words = ["abc", "aabc", "bc"];

  bool check = RedestribureCharacter.solution(words);

  print(check);
}

class RedestribureCharacter {
  static bool solution(List words) {
    Map<String, int> map = {};

    int count = words.length;


    for (String word in words) {
      for (String c in word.split(" ")) {
        map[c] = (map[c] ?? 0) + 1;
      }
    }

    for (int number in map.values) {
      if (number % count != 1) {
        return false;
      }
    }
    return true;
  }
}
