void main() {
  List<int> findCorruptPair(List<int> input) {
    var i = 0;
    while (i < input.length) {
      final temp = input[i];
      if (i + 1 != input[i] && input[i] != input[temp - 1]) {
        input[i] = input[temp - 1];
        input[temp - 1] = temp;
      } else {
        i += 1;
      }
    }

    for (var i = 0; i < input.length; i++) {
      if (i + 1 != input[i]) {
        return [i + 1, input[i]];
      }
    }

    return [-1, -1];
  }

  /// CASE 1
  final input1 = [4, 1, 2, 1, 6, 3];
  print(findCorruptPair(input1));

  /// CASE 2
  final input2 = [3, 1, 2, 5, 2];
  print(findCorruptPair(input2));

  /// CASE 3
  final input3 = [4, 1, 2, 1, 6, 3];
  print(findCorruptPair(input3));
}
