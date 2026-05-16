void main() {
  List<List<int>> combine(int n, int k) {
    final output = <List<int>>[];

    void backtrack(List<int> combination, int i) {
      if (combination.length == k) {
        output.add(List.from(combination));
        return;
      }
      for (var j = i; j < n; j++) {
        combination.add(j + 1);
        backtrack(combination, j + 1);
        combination.removeLast();
      }
      return;
    }

    for (var i = 0; i < k; i++) {
      final combination = <int>[i + 1];
      backtrack(combination, i);
    }

    return output;
  }

  /// CASE 1
  print(combine(1, 1));

  /// CASE 2
  print(combine(2, 2));
}
