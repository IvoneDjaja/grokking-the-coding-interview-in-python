import 'dart:math';

void main() {
  int maxProduct(List<int> nums) {
    final n = nums.length;

    var maxProduct = nums.first;
    var product = 1;
    for (var i = 0; i < n; i++) {
      if (nums[i] == 0) {
        product = 1;
        continue;
      }
      product = product * nums[i];
      maxProduct = max(maxProduct, product);
    }

    product = 1;
    for (var i = n - 1; i > -1; i--) {
      if (nums[i] == 0) {
        product = 1;
        continue;
      }
      product = product * nums[i];
      maxProduct = max(maxProduct, product);
    }

    return maxProduct;
  }

  /// CASE 1
  final nums1 = [1, 2, 3, 4];
  print(maxProduct(nums1));

  /// CASE 2
  final nums2 = [2, 3, -2, 4];
  print(maxProduct(nums2));

  /// CASE 3
  final nums3 = [-2, 0, -1];
  print(maxProduct(nums3));

  /// CASE 4
  final nums4 = [2, -5, 3, 1, -4, 0, -10, 2];
  print(maxProduct(nums4));

  /// CASE 5
  final nums5 = [-9];
  print(maxProduct(nums5));

  /// CASE 6
  final nums6 = [-2, 0, 3, 0, 1];
  print(maxProduct(nums6));

  /// CASE 7
  final nums7 = [-2, 0, -1];
  print(maxProduct(nums7));
}
