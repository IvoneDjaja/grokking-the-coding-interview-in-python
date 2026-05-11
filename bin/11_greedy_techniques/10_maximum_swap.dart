import 'dart:math';

void main() {
  int maximumSwap(int num) {
    var numList = num.toString().split('');

    var maxIndex = -1;
    var maxNum = '0';
    var swapFirst = -1;
    var swapSecond = -1;
    for (var i = numList.length - 1; i > -1; i--) {
      if (numList[i].compareTo(maxNum) == 1) {
        maxNum = numList[i];
        maxIndex = i;
      }
      if (numList[i].compareTo(maxNum) == -1) {
        swapFirst = i;
        swapSecond = maxIndex;
      }
    }

    if (swapFirst != -1 && swapSecond != -1) {
      final temp = numList[swapFirst];
      numList[swapFirst] = numList[swapSecond];
      numList[swapSecond] = temp;
    }
    return int.parse(numList.join(''));
  }

  /// CASE 1
  final input1 = 3541;
  print(maximumSwap(input1));

  /// CASE 2
  final input2 = 555;
  print(maximumSwap(input2));

  /// CASE 3
  final input3 = 2511928;
  print(maximumSwap(input3));

  /// CASE 4
  final input4 = 854;
  print(maximumSwap(input4));
}
