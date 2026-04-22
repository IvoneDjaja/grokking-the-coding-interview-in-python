void main() {
  List<List<int>> threeSum(List<int> numbers) {
    numbers.sort((a, b) => a.compareTo(b));
    final output = <List<int>>[];
    var index = 0;
    while (index < numbers.length - 2) {
      final number1 = numbers[index];
      final number2 = numbers[index + 1];

      var twoSumStartIndex = index + 1;
      var twoSumEndIndex = numbers.length - 1;
      while (twoSumStartIndex < twoSumEndIndex) {
        final number2 = numbers[twoSumStartIndex];
        final number3 = numbers[twoSumEndIndex];
        final twoSum = number2 + number3;
        if (twoSum == -number1) {
          output.add([number1, number2, number3]);
          while (twoSumStartIndex < twoSumEndIndex &&
              numbers[twoSumStartIndex] == number2) {
            twoSumStartIndex += 1;
          }
          while (twoSumStartIndex < twoSumEndIndex &&
              numbers[twoSumEndIndex] == number3) {
            twoSumEndIndex -= 1;
          }
        } else if (twoSum < -number1) {
          twoSumStartIndex += 1;
        } else {
          twoSumEndIndex -= 1;
        }
      }

      while (index < numbers.length - 2 && numbers[index] == number1) {
        index += 1;
      }
    }
    return output;
  }

  // CASE 1
  print(threeSum([-2, 0, 2, -2, 1, -1]));
  // CASE 2
  print(threeSum([-3, -1, -1, 0, 1, 2, 3, 3]));
  // CASE 3
  print(threeSum([0, 0, 0, 0]));
  // CASE 3
  print(threeSum([3, 5, 7, 8]));
}
