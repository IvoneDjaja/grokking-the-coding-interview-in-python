void main() {
  List<int> sortArrayByParity(List<int> nums) {
    final n = nums.length;
    var i = 0;
    while (i < n) {
      if (i % 2 == 0 && nums[i] % 2 != 0) {
        var j = i;
        while (j < n) {
          if (nums[j] % 2 == 0) {
            final temp = nums[i];
            nums[i] = nums[j];
            nums[j] = temp;
          }
          j += 1;
        }
      } else if (i % 2 == 1 && nums[i] % 2 != 1) {
        var j = i;
        while (j < n) {
          if (nums[j] % 2 == 1) {
            final temp = nums[i];
            nums[i] = nums[j];
            nums[j] = temp;
          }
          j += 1;
        }
      } else {
        i += 1;
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
}
