void main() {
  int findMissingNumber(List<int> nums) {
    for (var num in nums) {
      final i = num.abs() - 1;
      if (i >= 0 && i < nums.length) {
        if (nums[i] > 0) {
          nums[i] = -1 * nums[i];
        }
      }
    }

    for (var i = 0; i < nums.length; i++) {
      if (nums[i] > 0) {
        return i + 1;
      }
    }

    return nums.length + 1;
  }

  /// CASE 1
  final nums1 = [5, 6, 4, 2, 1, 3, 0, 7, 9];
print(findMissingNumber(nums1));

  /// CASE 2
  final nums2 = [5, 6, 10, 2, 1, 3, 0, 7, 9, 12, 11, 8];
  print(findMissingNumber(nums2));

  /// CASE 3
  final nums3 = [0, 1, 2, 4];
  print(findMissingNumber(nums3));

  /// CASE 4
  final nums4 = [3, 0, 1, 4];
  print(findMissingNumber(nums4));

  /// CASE 5
  final nums5 = [1, 4, 5, 6, 8, 2, 0, 7];
  print(findMissingNumber(nums5));

  /// CASE 6
  final nums6 = [1, 0, 2, 3, 4, 5, 6, 8, 9, 7, 11];
  print(findMissingNumber(nums6));

  /// CASE 7
  final nums7 = [1];
  print(findMissingNumber(nums7));
}
