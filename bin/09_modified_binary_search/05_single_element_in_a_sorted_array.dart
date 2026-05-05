void main() {
  int singleNonDuplicate(List<int> nums) {
    var low = 0;
    var high = nums.length - 1;

    while (low <= high) {
      print('while');
      final mid = (low + high) ~/ 2;
      print('low: $low');
      print('high: $high');
      print('mid: $mid');
      if (((mid - 1 > low && nums[mid] != nums[mid - 1]) || mid - 1 < 0) &&
          ((mid + 1 < high && nums[mid] != nums[mid + 1]) || mid + 1 >= high)) {
        print('if');
        return mid;
      } else if (mid - 1 > low && nums[mid] == nums[mid - 1]) {
        print('else if 1');
        low = mid + 1;
      } else {
        print('else if 2');
        high = mid - 1;
      }
    }

    return low;
  }

  /// CASE 1
  final arr1 = [1, 1, 2, 3, 3, 4, 4];
  print(singleNonDuplicate(arr1));
}
