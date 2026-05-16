void main() {
  List<List<int>> combine(int n, int k) {
    final output = <List<int>>[];

    void backtrack(int start, List<int> combination) {
      if (combination.length == k) {
        output.add(List.from(combination));
        return;
      }
      for (var i = start; i < n; i++) {
        combination.add(i + 1);
        backtrack(i + 1, combination);
        combination.removeLast();
      }
      return;
    }

    backtrack(0, []);

    return output;
  }

  /// CASE 1
  print(combine(1, 1));

  /// CASE 2
  print(combine(2, 2));

  /// CASE 3
  print(combine(3, 3));

  /// CASE 4
  print(combine(3, 1));

  /// CASE 5
  print(combine(5, 3));
}
