void main() {
  int singleNonDuplicate(List<int> nums) {
    var low = 0;
    var high = nums.length - 1;

    while (low <= high) {
      final mid = low + ((high - low) ~/ 2);
      if ((mid - 1 < 0 || nums[mid] != nums[mid - 1]) &&
          ((mid + 1 > nums.length || nums[mid] != nums[mid + 1]) ||
              mid + 1 >= high)) {
        return nums[mid];
      }
      int leftSize;
      if (nums[mid - 1] == nums[mid]) {
        leftSize = mid - 1;
      } else {
        leftSize = mid;
      }

      if (leftSize % 2 == 1) {
        high = mid - 1;
      } else {
        low = mid + 1;
      }
    }

    return low;
  }

  /// CASE 1
  final arr1 = [1, 1, 2, 3, 3, 4, 4];
  print(singleNonDuplicate(arr1));

  /// CASE 2
  final arr2 = [1, 1, 2, 2, 3, 3, 4];
  print(singleNonDuplicate(arr2));

  /// CASE 3
  final arr3 = [1, 2, 2, 3, 3, 4, 4];
  print(singleNonDuplicate(arr3));
}
