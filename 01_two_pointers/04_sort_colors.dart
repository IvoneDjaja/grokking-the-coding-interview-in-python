void main() {
  List<int> sortColors(List<int> colors) {
    var startIndex = 0;
    var endIndex = colors.length - 1;
    var index = 0;

    while (index <= endIndex) {
      if (colors[index] == 0) {
        var temp = colors[startIndex];
        colors[startIndex] = colors[index];
        colors[index] = temp;
        startIndex += 1;
        index += 1;
      } else if (colors[index] == 2) {
        var temp = colors[endIndex];
        colors[endIndex] = colors[index];
        colors[index] = temp;
        endIndex -= 1;
      } else {
        index += 1;
      }
    }
    return colors;
  }

  // CASE 1
  final colors1 = [1, 0, 2, 1, 2, 2];
  print(sortColors(colors1));

  // CASE 2
  final colors2 = [1, 0];
  print(sortColors(colors2));

  // CASE 3
  final colors3 = [2, 0, 2, 0, 2, 0];
  print(sortColors(colors3));

  // CASE 4
  final colors4 = [2];
  print(sortColors(colors4));

  // CASE 5
  final colors5 = [1, 1, 1, 1, 1, 1];
  print(sortColors(colors5));

  // CASE 6
  final colors6 = [2, 2, 1, 1, 0, 0];
  print(sortColors(colors6));
}
