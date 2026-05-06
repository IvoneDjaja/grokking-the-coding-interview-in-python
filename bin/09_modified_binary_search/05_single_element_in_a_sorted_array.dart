/// Retry: 1
void main() {
  //
  int singleNonDuplicate(List<int> nums) {
    var low = 0;
    var high = nums.length - 1;

    while (low < high) {
      var mid = low + (high - low) ~/ 2;
      if (mid % 2 == 1) {
        mid -= 1;
      }
      if (nums[mid] == nums[mid + 1]) {
        low = mid + 2;
      } else {
        high = mid - 1;
      }
    }
    return nums[low];
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
