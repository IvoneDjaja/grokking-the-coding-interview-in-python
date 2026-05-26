void main() {
  List<List<int>> rotateImage(List<List<int>> matrix) {
    final n = matrix.length;

    var topLeft = [0, 0];
    var topRight = [0, n - 1];
    var bottomLeft = [n - 1, 0];
    var bottomRight = [n - 1, n - 1];

    while (topLeft.last < topRight.last && bottomLeft.first > topLeft.first) {
      while (topLeft.last < topRight.last) {
        var topLeftVal = matrix[topLeft.first][topLeft.last];
        matrix[topLeft.first][topLeft.last] =
            matrix[bottomLeft.first][bottomLeft.last];
        var topRightVal = matrix[topRight.first][topRight.last];
        matrix[topRight.first][topRight.last] = topLeftVal;
        var bottomRightVal = matrix[bottomRight.first][bottomRight.last];
        matrix[bottomRight.first][bottomRight.last] = topRightVal;
        matrix[bottomLeft.first][bottomLeft.last] = bottomRightVal;

        topLeft[1] = topLeft.last + 1;
        topRight[0] = topRight.first + 1;
        bottomRight[1] = bottomRight.last - 1;
        bottomLeft[0] = bottomLeft.first - 1;
      }

      if (topLeft.last + 1 <= topRight.last &&
          topLeft.first + 1 <= bottomLeft.first) {
        topLeft[0] = topLeft.first + 1;
      }
      if (topRight.last - 1 >= topLeft.last &&
          topRight.first + 1 <= bottomRight.first) {
        topRight[1] = topRight.last - 1;
      }
      if (bottomRight.first - 1 >= topRight.first &&
          bottomRight.last - 1 >= bottomLeft.last) {
        bottomRight[0] = bottomRight.first - 1;
      }
      if (bottomLeft.first - 1 >= topLeft.first &&
          bottomLeft.last + 1 <= topLeft.last) {
        bottomLeft[1] = bottomLeft.last + 1;
      }
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
