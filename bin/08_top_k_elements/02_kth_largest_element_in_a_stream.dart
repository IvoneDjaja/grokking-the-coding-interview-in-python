import 'package:collection/collection.dart';

class KthLargest {
  KthLargest({required List<int> nums, required this.k}) {
    for (var num in nums) {
      add(num);
    }
  }

  final HeapPriorityQueue<int> minHeap = HeapPriorityQueue<int>(
    (a, b) => a.compareTo(b),
  );
  final int k;

  int add(int val) {
    minHeap.add(val);

    if (minHeap.length > k) {
      minHeap.removeFirst();
    }

    return minHeap.first;
  }
}

void main() {
  /// CASE 1
  final class1 = KthLargest(k: 2, nums: [3, 4, 5]);
  print(class1.add(40));
  print(class1.add(50));
  print(class1.add(30));
}
