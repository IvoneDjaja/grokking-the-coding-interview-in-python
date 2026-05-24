void main() {
  List<List<int>> setMatrixZeros(List<List<int>> mat) {
    final m = mat.length;
    final n = mat.first.length;
    final zeroRow = <int>{};
    final zeroCol = <int>{};

    for (var i = 0; i < m; i++) {
      for (var j = 0; j < n; j++) {
        if (mat[i][j] == 0) {
          zeroRow.add(i);
          zeroCol.add(j);
        }
      }
    }

    for (var i in zeroRow) {
      for (var j = 0; j < n; j++) {
        mat[i][j] = 0;
      }
    }

    for (var j in zeroCol) {
      for (var i = 0; i < m; i++) {
        mat[i][j] = 0;
      }
    }

    return mat;
  }

  /// CASE 1
  final input1 = [
    [1, 1, 1],
    [1, 0, 1],
    [1, 1, 1],
  ];
  print(setMatrixZeros(input1));
}
