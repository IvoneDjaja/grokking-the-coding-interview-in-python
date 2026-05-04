void main() {
  int binarySearchRotated(List<int> nums, int target) {
    var low = 0;
    var high = nums.length - 1;

    while (low <= high) {
      final mid = (low + high) ~/ 2;
      if (nums[mid] == target) {
        return mid;
      } else if (nums[mid] > target) {
        if (nums[low] < nums[mid]) {
          high = mid - 1;
        } else {
          low = mid + 1;
        }
      } else {
        if (nums[mid] < nums[high]) {
          low = mid + 1;
        } else {
          high = mid - 1;
        }
      }
    }

    return -1;
  }

  /// CASE 1
  final nums1 = [6, 7, 1, 2, 3, 4, 5];
  final target1 = 2;
  print(binarySearchRotated(nums1, target1));

  /// CASE 2
  final nums2 = [176, 188, 199, 200, 1, 2, 3];
  final target2 = 199;
  print(binarySearchRotated(nums2, target2));

  /// CASE 3
  final nums3 = [1, 2, 3, 4, 5, 6, 7];
  final target3 = 8;
  print(binarySearchRotated(nums3, target3));

  /// CASE 4
  final nums4 = [6, 7, 1, 2, 3, 4, 5];
  final target4 = 6;
  print(binarySearchRotated(nums4, target4));
}
