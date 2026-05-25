void main() {
  List<int> spiralOrder(List<List<int>> matrix) {
    final m = matrix.length;
    final n = matrix.first.length;

    var top = 0;
    var bottom = m - 1;
    var left = 0;
    var right = n - 1;

    final output = <int>[];

    while (top <= bottom && left <= right) {
      for (var j = left; j < right + 1; j++) {
        output.add(matrix[top][j]);
      }
      top += 1;

      for (var i = top; i < bottom + 1; i++) {
        output.add(matrix[i][right]);
      }
      right -= 1;

      if (top <= bottom) {
        for (var j = right; j > left - 1; j--) {
          output.add(matrix[bottom][j]);
        }
        bottom -= 1;
      }

      if (left <= right) {
        for (var i = bottom; i > top - 1; i--) {
          output.add(matrix[i][left]);
        }
        left += 1;
      }
    }

    return output;
  }

  /// CASE 1
  final input1 = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
  ];
  print(spiralOrder(input1));

  /// CASE 2
  final input2 = [
    [-5, 95, -8, 64, 12],
  ];
  print(spiralOrder(input2));
}
