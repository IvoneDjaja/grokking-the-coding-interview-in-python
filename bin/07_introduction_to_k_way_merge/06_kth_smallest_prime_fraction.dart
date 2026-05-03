import 'package:collection/collection.dart';

void main() {
  List<int> kthSmallestPrimeFraction(List<int> arr, int k) {
    late List<int> result;
    final minHeap = HeapPriorityQueue<List<int>>(
      (a, b) => (a.first / a[1]).compareTo(b.first / b[1]),
    );

    for (var i = 0; i < arr.length; i++) {
      for (var j = arr.length - 1; j > i; j--) {
        minHeap.add([arr[i], arr[j], i, j]);
        if (minHeap.length == k) {
          result = [arr[i], arr[j]];
        }
      }
    }
    return result;
  }

  /// CASE 1
  final arr1 = [1, 2, 3, 5, 7];
  final k1 = 4;
  print(kthSmallestPrimeFraction(arr1, k1));
}
