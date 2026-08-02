void main() {
  List<int> twoSingleNumbers(List<int> arr) {
    var xorAll = 0;
    for (var num in arr) {
      xorAll ^= num;
    }
    final diffBit = xorAll & -xorAll;
    var a = 0;
    var b = 0;

    for (var num in arr) {
      if (num & diffBit != 0) {
        a ^= num;
      } else {
        b ^= num;
      }
    }

    return [a, b];
  }

  /// CASE 1
  final input1 = [1, 2, 1, 3, 2, 5];
  print(twoSingleNumbers(input1));
}
