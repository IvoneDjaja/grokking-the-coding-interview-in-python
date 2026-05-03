import 'package:collection/collection.dart';

void main() {
  List<int> topKFrequent(List<int> arr, int k) {
    final minHeap = HeapPriorityQueue<List<int>>(
      (a, b) => a.last.compareTo(b.last),
    );

    final countList = {};

    for (var num in arr) {
      if (countList[num] == null) {
        countList[num] = 0;
      }
      countList[num] += 1;
    }

    for (var key in countList.keys) {
      final count = countList[key];
      minHeap.add([key, count]);
      if (minHeap.length > k) {
        minHeap.removeFirst();
      }
    }

    return minHeap.toList().map((key) => key.first).toList();
  }

  /// CASE 1
  final k1 = 2;
  final arr1 = [1, 3, 5, 14, 18, 14, 5];
  print(topKFrequent(arr1, k1));

  /// CASE 1
  final k2 = 1;
  final arr2 = [1, 1, 1, 3, 3, 4, 5];
  print(topKFrequent(arr2, k2));
}
