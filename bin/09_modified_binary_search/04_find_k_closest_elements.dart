void main() {
  List<int> findClosestElements(List<int> nums, int k, int target) {
    var low = 0;
    var high = nums.length - k;

    while (low < high) {
      var mid = low + (high - low) ~/ 2;
      if (target - nums[mid] > nums[mid + k] - target) {
        low = mid + 1;
      } else {
        high = mid;
      }
    }

    return nums.sublist(low, low + k);
  }

  /// CASE 1
  final input1 = [1, 2, 3, 4, 5];
  final k1 = 4;
  final target1 = 3;
  print(findClosestElements(input1, k1, target1));

  /// CASE 2
  final input2 = [1, 2, 3, 4, 5];
  final k2 = 3;
  final target2 = 6;
  print(findClosestElements(input2, k2, target2));

  /// CASE 2
  final input3 = [1, 2, 3, 4, 5];
  final k3 = 2;
  final target3 = -1;
  print(findClosestElements(input3, k3, target3));
}
