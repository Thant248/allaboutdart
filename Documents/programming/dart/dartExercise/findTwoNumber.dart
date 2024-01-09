void main() {
  List number = [1, 2, 3, 4, 5];
  int target = 9;

  List<List<int?>> answer = [];

  for (int i = 0; i < number.length; i++) {
    for (int j = i; j < number.length; j++) {
      if (number[i] + number[j] == target) {
        answer.add([number[i], number[j]]);
      }
    }
  }

  for (int i = 0; i < answer.length; i++) {
    print("Pair ${i + 1}: ${answer[i][0]} + ${answer[i][1]} = $target");
  }
}
