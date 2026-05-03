import 'package:collection/collection.dart';

void main() {
  List<int> kthSmallestPrimeFraction(List<int> arr, int k) {
    final minHeap = HeapPriorityQueue<List<int>>(
      (a, b) => (a.first / a[1]).compareTo(b.first / b[1]),
    );

    for (var i = 0; i < arr.length; i++) {
      minHeap.add([arr[i], arr[arr.length - 1], i, arr.length - 1]);
    }

    for (var i = 0; i < k - 1; i++) {
      final smallest = minHeap.removeFirst();
      final row = smallest[2];
      final col = smallest.last;

      if (col - 1 > row) {
        minHeap.add([arr[row], arr[col - 1], row, col - 1]);
      }
    }

    final smallest = minHeap.removeFirst();
    return [smallest.first, smallest[1]];
  }

  /// CASE 1
  final arr1 = [1, 2, 3, 5, 7];
  final k1 = 4;
  print(kthSmallestPrimeFraction(arr1, k1));

  /// CASE 2
  final arr2 = [1, 2, 3, 5];
  final k2 = 3;
  print(kthSmallestPrimeFraction(arr2, k2));
}
