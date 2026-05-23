import 'dart:math';

void main() {
  int hIndex(List<int> citations) {
    final n = citations.length;
    final countArray = List.generate(n + 1, (_) => 0);

    for (var i = 0; i < n; i++) {
      final citation = citations[i];
      final index = min(citation, citations.length);
      countArray[index] += 1;
    }
    var count = 0;
    for (var i = n; i > -1; i--) {
      count += countArray[i];

      if (count >= i) {
        return i;
      }
    }
    return -1;
  }

  /// CASE 1
  final input1 = [0, 1, 3, 5, 6];
  print(hIndex(input1));

  /// CASE 2
  final input2 = [10, 8, 5, 4, 3];
  print(hIndex(input2));

  /// CASE 3
  final input3 = [5, 5, 5, 5, 5];
  print(hIndex(input3));

  /// CASE 4
  final input4 = [1, 3, 1];
  print(hIndex(input4));
}
