import 'package:collection/collection.dart';

void main() {
  List<int> mergeSorted(List<int> nums1, int m, List<int> nums2, int n) {
    final minHeap = HeapPriorityQueue<int>((a, b) => a.compareTo(b));

    minHeap.addAll(nums1.slice(0, m));
    minHeap.addAll(nums2);

    return minHeap.toList();
  }

  /// CASE 1
  final nums1 = [3, 4, 9, 0, 0, 0];
  final nums2 = [1, 2, 7];
  final m = 3;
  final n = 3;
  print(mergeSorted(nums1, m, nums2, n));
}
