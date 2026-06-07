void main() {
  int subarraySum(List<int> nums, int k) {
    var prefix = 0;
    var count = 0;
    final prefixSum = {0: 1};

    for (final num in nums) {
      prefix += num;
      if (prefixSum.containsKey(prefix - k)) {
        count += prefixSum[prefix - k]!;
      }
      prefixSum[prefix] = (prefixSum[prefix] ?? 0) + 1;
    }

    return count;
  }

  /// CASE 1
  List<int> nums1 = [0, 0, 0, 0];
  int k1 = 0;
  print(subarraySum(nums1, k1));

  /// CASE 2
  List<int> nums2 = [2, 3, 1, 2, 4, 3];
  int k2 = 6;
  print(subarraySum(nums2, k2));

  /// CASE 2
  List<int> nums3 = [3, -5, 2, -1, 4, -3, 1];
  int k3 = -2;
  print(subarraySum(nums3, k3));
}
