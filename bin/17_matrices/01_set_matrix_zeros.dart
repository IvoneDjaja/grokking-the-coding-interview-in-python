void main() {
  List<List<int>> setMatrixZeros(List<List<int>> mat) {
    final m = mat.length;
    final n = mat.first.length;

    var isFirstColZero = false;
    for (var i = 0; i < m; i++) {
      if (mat[i][0] == 0) {
        isFirstColZero = true;
      }
      for (var j = 1; j < n; j++) {
        if (mat[i][j] == 0) {
          mat[i][0] = 0;
          mat[0][j] = 0;
        }
      }
    }

    for (var i = 1; i < m; i++) {
      for (var j = 1; j < n; j++) {
        if (mat[i][0] == 0 || mat[0][j] == 0) {
          mat[i][j] = 0;
        }
      }
    }

    if (mat[0][0] == 0) {
      for (var j = 0; j < n; j++) {
        mat[0][j] = 0;
      }
    }

    if (isFirstColZero) {
      for (var i = 0; i < m; i++) {
        mat[i][0] = 0;
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
