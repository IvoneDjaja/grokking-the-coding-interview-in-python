void main() {
  List<String> generateCombinations(int n) {
    final output = <String>[];

    void backtrack(String path, int i, int j) {
      if (path.length == n * 2) {
        output.add(path);
        return;
      }
      if (i <= j) {
        final newPath = '$path(';
        backtrack(newPath, i + 1, j);
      } else {
        final newPath = '$path)';
        backtrack(newPath, i, j + 1);
      }
    }

    backtrack("", 0, 0);

    return output;
  }

  /// CASE 1
  print(generateCombinations(3));
}
