import 'package:collection/collection.dart';

class KthLargest {
  const KthLargest({required this.nums, required this.k});

  final List<int> nums;
  final int k;

  int add(int val) {
    nums.add(val);

    final maxHeap = HeapPriorityQueue<int>((a, b) => b.compareTo(a));

    for (var num in nums) {
      maxHeap.add(num);
    }

    for (var i = 0; i < k - 1; i++) {
      maxHeap.removeFirst();
    }

    return maxHeap.removeFirst();
  }
}

void main() {
  /// CASE 1
  final class1 = KthLargest(k: 2, nums: [3, 4, 5]);
  print(class1.add(40));
  print(class1.add(50));
  print(class1.add(30));
}
