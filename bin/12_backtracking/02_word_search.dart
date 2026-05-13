void main() {
  bool wordSearch(List<List<String>> grid, String word) {
    final m = grid.length;
    final n = grid.first.length;

    bool backtrack(int i, int j, int index) {
      if (i < 0 || i > m - 1 || j < 0 || j > n - 1) {
        return false;
      } else if (index == word.length) {
        return true;
      } else if (grid[i][j] != word[index]) {
        return false;
      } else {
        final result =
            backtrack(i + 1, j, index + 1) ||
            backtrack(i, j + 1, index + 1) ||
            backtrack(i - 1, j, index + 1) ||
            backtrack(i, j - 1, index + 1);
        return result;
      }
    }

    final starts = <List<int>>[];
    for (var i = 0; i < m; i++) {
      for (var j = 0; j < n; j++) {
        if (grid[i][j] == word[0]) {
          starts.add([i, j]);
        }
      }
    }

    for (var start in starts) {
      final i = start.first;
      final j = start.last;
      var index = 0;
      if (backtrack(i, j, index)) {
        return true;
      }
    }
    return false;
  }

  /// CASE 1
  final board1 = [
    ['E', 'D', 'X', 'I', 'W'],
    ['P', 'U', 'F', 'M', 'Q'],
    ['I', 'C', 'A', 'T', 'E'],
    ['M', 'A', 'L', 'C', 'A'],
    ['J', 'T', 'I', 'V', 'E'],
  ];
  print(wordSearch(board1, 'EDUCATIVE'));

  /// CASE 2
  final board2 = [
    ['O', 'Y', 'O', 'I'],
    ['B', 'I', 'N', 'A'],
    ['D', 'Y', 'P', 'M'],
    ['M', 'T', 'W', 'I'],
    ['Z', 'I', 'T', 'C'],
  ];
  print(wordSearch(board2, 'DYNAMIC'));

  /// CASE 3
  final board3 = [
    ['H', 'E', 'C', 'M', 'L'],
    ['W', 'L', 'I', 'E', 'U'],
    ['A', 'R', 'R', 'S', 'N'],
    ['S', 'I', 'I', 'O', 'R'],
  ];
  print(wordSearch(board3, 'WARRIOR'));

  /// CASE 4
  final board4 = [
    ['A', 'S', 'D'],
    ['S', 'S', 'S'],
    ['A', 'S', 'D'],
  ];
  print(wordSearch(board4, 'ASDSA'));
}
