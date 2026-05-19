void main() {
  List<int> findCorruptPair(List<int> nums) {
    var i = 0;
    while (i < nums.length) {
      final temp = nums[i];
      if (i + 1 != nums[i] && nums[i] != nums[temp - 1]) {
        nums[i] = nums[temp - 1];
        nums[temp - 1] = temp;
      } else {
        i += 1;
      }
    }

    for (var i = 0; i < nums.length; i++) {
      if (i + 1 != nums[i]) {
        return [i + 1, nums[i]];
      }
    }

    return [-1, -1];
  }

  /// CASE 1
  final input1 = [4, 1, 2, 1, 6, 3];
  print(findCorruptPair(input1));

  /// CASE 2
  final input2 = [3, 1, 2, 5, 2];
  print(findCorruptPair(input2));

  /// CASE 3
  final input3 = [4, 1, 2, 1, 6, 3];
  print(findCorruptPair(input3));
}
