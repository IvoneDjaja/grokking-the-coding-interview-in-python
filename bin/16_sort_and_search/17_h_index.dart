void main() {
  int hIndex(List<int> citations) {
    citations.sort();

    for (var i = 0; i < citations.length; i++) {
      if (citations[i] == citations.length - i) {
        return citations[i];
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
