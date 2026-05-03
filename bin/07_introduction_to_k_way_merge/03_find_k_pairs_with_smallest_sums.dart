import 'package:collection/collection.dart';

void main() {
  List<List<int>> kSmallestPairs(List<int> list1, List<int> list2, int k) {
    final minHeap = HeapPriorityQueue<List<int>>(
      (a, b) => (a.first + a.last).compareTo(b.first + b.last),
    );

    var count = 0;
    for (var i = 0; i < list1.length; i++) {
      for (var j = 0; j < list2.length; j++) {
        final num1 = list1[i];
        final num2 = list2[j];
        if (count == k) {
          break;
        }
        minHeap.add([num1, num2]);
        count += 1;
      }
    }

    return minHeap.toList();
  }

  /// CASE 1
  final list11 = [2, 8, 9];
  final list12 = [1, 3, 6];
  final k1 = 3;
  print(kSmallestPairs(list11, list12, k1));
}
