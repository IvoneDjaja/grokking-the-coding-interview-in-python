import 'package:collection/collection.dart';

void main() {
  List<int> mergeSorted(List<int> nums1, int m, List<int> nums2, int n) {
    var index = m + n - 1;
    var index1 = m - 1;
    var index2 = n - 1;
    while (index > -1) {
      if (index1 < 0 || index2 < 0) {
        break;
      }
      if (nums1[index1] > nums2[index2]) {
        nums1[index] = nums1[index1];
        index1 -= 1;
      } else if (nums1[index1] <= nums2[index2]) {
        nums1[index] = nums2[index2];
        index2 -= 1;
      }
      index -= 1;
    }
    while (index1 > -1) {
      nums1[index] = nums1[index1];
      index1 -= 1;
      index -= 1;
    }
    while (index2 > -1) {
      nums1[index] = nums2[index2];
      index2 -= 1;
      index -= 1;
    }
    return nums1;
  }

  /// CASE 1
  final nums1 = [3, 4, 9, 0, 0, 0];
  final nums2 = [1, 2, 7];
  final m = 3;
  final n = 3;
  print(mergeSorted(nums1, m, nums2, n));
}
