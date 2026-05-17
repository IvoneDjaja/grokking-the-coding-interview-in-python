void main() {
  int findMissingNumber(List<int> nums) {
    for (var num in nums) {
      final i = num.abs() - 1;
      if (i > 0) {
        nums[i] = -1 * nums[i];
      }
    }

    print(nums);

    var result = 0;
    for (var i = 0; i < nums.length; i++) {
      if (nums[i] > 0) {
        result = i + 1;
      }
    }

    return result;
  }

  /// CASE 1
  final nums2 = [5, 6, 4, 2, 1, 3, 0, 7, 9];
  print(findMissingNumber(nums2));

  /// CASE 2
  final nums1 = [5, 6, 10, 2, 1, 3, 0, 7, 9, 12, 11, 8];
  print(findMissingNumber(nums1));
}
