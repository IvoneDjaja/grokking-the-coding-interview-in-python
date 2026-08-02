void main() {
  int singleNumber(List<int> nums) {
    var result = 0;
    for (var num in nums) {
      result = result ^ num;
    }
    return result;
  }

  /// CASE 1
  final input1 = [1, 2, 2, 3, 3, 1, 4];
  print(singleNumber(input1));
}
