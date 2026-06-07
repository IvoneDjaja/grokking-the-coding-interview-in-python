void main() {
  bool isValidSudoku(List<List<String>> board) {
    final length = 9;
    final rowSet = <int, Set<String>>{};
    final colSet = <int, Set<String>>{};
    final boxSet = <int, Set<String>>{};

    for (var i = 0; i < length; i++) {
      rowSet[i] = {};
      colSet[i] = {};
      boxSet[i] = {};
    }

    for (var i = 0; i < length; i++) {
      for (var j = 0; j < length; j++) {
        final digit = board[i][j];
        if (digit == '.') {
          continue;
        }
        final b = (i ~/ 3) * 3 + (j ~/ 3);

        final row = rowSet[i]!;
        final col = colSet[j]!;
        final box = boxSet[b]!;
        if (row.contains(digit)) {
          return false;
        }
        if (col.contains(digit)) {
          return false;
        }
        if (box.contains(digit)) {
          return false;
        }
        rowSet[i]!.add(digit);
        colSet[j]!.add(digit);
        boxSet[b]!.add(digit);
      }
    }

    return true;
  }

  /// CASE 1
  final board1 = [
    [".", ".", ".", ".", ".", ".", ".", "7", "."],
    ["2", "7", "5", ".", ".", ".", "3", "1", "4"],
    [".", ".", ".", ".", "2", "7", ".", "5", "."],
    ["9", "8", ".", ".", ".", ".", ".", "3", "1"],
    [".", "3", "1", "8", ".", "4", ".", ".", "."],
    [".", ".", ".", "1", ".", ".", "8", ".", "5"],
    ["7", ".", "6", "2", ".", ".", "1", "8", "."],
    [".", "9", ".", "7", ".", ".", ".", ".", "."],
    ["4", "1", ".", ".", ".", "5", ".", ".", "7"],
  ];
  print(isValidSudoku(board1));
}
