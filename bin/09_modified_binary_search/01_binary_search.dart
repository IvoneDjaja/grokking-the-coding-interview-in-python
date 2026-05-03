void main() {
  int binarySearch(List<int> nums, int target) {
    var low = 0;
    var high = nums.length - 1;

    while (low <= high) {
      final mid = (low + high) ~/ 2;
      if (nums[mid] == target) {
        return mid;
      } else if (nums[mid] > target) {
        high = mid - 1;
      } else {
        low = mid + 1;
      }
    }

    return -1;
  }

  /// CASE 1
  final nums1 = [-5, 0, 2, 6, 12];
  final target1 = 6;
  print(binarySearch(nums1, target1));

  /// CASE 2
  final nums2 = [1, 6, 8, 10];
  final target2 = 1;
  print(binarySearch(nums2, target2));
}
