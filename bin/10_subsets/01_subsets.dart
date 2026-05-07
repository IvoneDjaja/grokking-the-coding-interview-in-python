void main() {
  /// backtrack
  List<List<int>> findAllSubsets1(List<int> nums) {
    final result = <List<int>>[];

    void backtrack(int start, List<int> path) {
      result.add(path.toList());
      for (var i = start; i < nums.length; i++) {
        path.add(nums[i]);
        backtrack(i + 1, path);
        path.removeLast();
      }
    }

    backtrack(0, []);
    return result;
  }

  /// cascading
  List<List<int>> findAllSubsets2(List<int> nums) {
    var result = <List<int>>[[]];

    for (var num in nums) {
      final newResult = result.toList();
      for (var current in result) {
        newResult.add(current.toList()..add(num));
      }
      result = newResult;
    }

    return result;
  }

  /// CASE 1
  final input1 = [3, 6, 9];
  print(findAllSubsets1(input1));
  print(findAllSubsets2(input1));
}
