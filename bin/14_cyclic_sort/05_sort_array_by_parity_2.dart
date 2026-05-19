void main() {
  List<int> sortArrayByParity(List<int> nums) {
    final n = nums.length;
    var even = 0;
    var odd = 1;
    while (even < n && odd < n) {
      if (nums[even] % 2 == 0) {
        even += 2;
      } else if (nums[odd] % 2 != 0) {
        odd += 2;
      } else {
        final temp = nums[even];
        nums[even] = nums[odd];
        nums[odd] = temp;
        even += 2;
        odd += 2;
      }
    }
    return nums;
  }

  /// CASE 1
  final input1 = [3, 6, 1, 4];
  print(sortArrayByParity(input1));

  /// CASE 2
  final input2 = [10, 5, 8, 3];
  print(sortArrayByParity(input2));

  /// CASE 3
  final input3 = [1, 2];
  print(sortArrayByParity(input3));

  /// CASE 4
  final input4 = [1, 2, 3, 4, 5, 6];
  print(sortArrayByParity(input4));
}
