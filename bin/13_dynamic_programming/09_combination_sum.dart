void main() {
  List<List<int>> combinationSum(List<int> nums, int target) {
    final output = <List<int>>[];

    void backtrack(int total, int start, List<int> combination) {
      if (total == target) {
        output.add(List.from(combination));
      }
      if (total > target) {
        return;
      }

      for (var i = start; i < nums.length; i++) {
        final num = nums[i];
        combination.add(num);
        backtrack(total + num, i, combination);
        combination.removeLast();
      }
    }

    backtrack(0, 0, []);

    return output;
  }

  /// CASE 1
  final nums1 = [2, 3, 6, 7];
  final target1 = 7;
  print(combinationSum(nums1, target1));

  /// CASE 2
  final nums2 = [2, 4, 6];
  final target2 = 6;
  print(combinationSum(nums2, target2));
}
