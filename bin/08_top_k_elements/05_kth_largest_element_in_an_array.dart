import 'package:collection/collection.dart';

void main() {
  int findKthLargest(List<int> nums, int k) {
    final minHeap = HeapPriorityQueue<int>((a, b) => a.compareTo(b));

    for (var num in nums) {
      minHeap.add(num);
      if (minHeap.length > k) {
        minHeap.removeFirst();
      }
    }
    return minHeap.first;
  }

  /// CASE 1
  final nums1 = [6, 8, 7, 9, 5, 4, 2, 3];
  final k1 = 6;
  print(findKthLargest(nums1, k1));

  /// CASE 2
  final nums2 = [2, 2, 2, 2, 2, 2, 2, 2];
  final k2 = 63;
  print(findKthLargest(nums2, k2));
}
