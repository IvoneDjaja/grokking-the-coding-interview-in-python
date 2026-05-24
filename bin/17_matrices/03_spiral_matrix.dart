void main() {
  List<int> spiralOrder(List<List<int>> matrix) {
    final m = matrix.length;
    final n = matrix.first.length;

    var top = -1;
    var bottom = m;
    var left = -1;
    var right = n;

    final output = <int>[];
    var count = 0;
    var i = 0;
    var j = 0;
    while (count < m * n) {
      // right
      i = top + 1;
      j = left + 1;
      while (j < right) {
        output.add(matrix[i][j]);
        j += 1;
        count += 1;
      }
      top += 1;

      // bottom
      i = top + 1;
      j -= 1;
      while (i < bottom) {
        output.add(matrix[i][j]);
        i += 1;
        count += 1;
      }
      right -= 1;

      // left
      j = right - 1;
      i -= 1;
      while (j > left) {
        output.add(matrix[i][j]);
        j -= 1;
        count += 1;
      }
      bottom -= 1;

      // top
      i = bottom - 1;
      j = left + 1;
      while (i > top) {
        output.add(matrix[i][j]);
        i -= 1;
        count += 1;
      }
      left += 1;
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
