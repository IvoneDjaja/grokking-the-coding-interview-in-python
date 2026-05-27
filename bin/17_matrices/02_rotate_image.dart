void main() {
  List<List<int>> rotateImage(List<List<int>> matrix) {
    final n = matrix.length;

    var left = 0;
    var right = n - 1;

    while (left < right) {
      var top = left;
      var bottom = right;
      for (int i = 0; i < right - left; i++) {
        var topLeftVal = matrix[top][left + i];
        matrix[top][left + i] = matrix[bottom - i][left];
        matrix[bottom - i][left] = matrix[bottom][right - i];
        matrix[bottom][right - i] = matrix[top + i][right];
        matrix[top + i][right] = topLeftVal;
      }
      left += 1;
      right -= 1;
    }
    return matrix;
  }

  /// CASE 1
  final input1 = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
  ];
  print(rotateImage(input1));

  /// CASE 2
  final input2 = [
    [3, 6, 7, 2, 4],
    [3, 3, 7, 5, 2],
    [4, 7, 9, 3, 3],
    [9, 10, 5, 7, 3],
    [9, 9, 7, 7, 4],
  ];
  print(rotateImage(input2));

  /// CASE 2
  final input3 = [
    [3],
  ];
  print(rotateImage(input3));
}
