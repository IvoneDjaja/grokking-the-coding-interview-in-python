import 'package:collection/priority_queue.dart';

void main() {
  int smallestChair(List<List<int>> times, int targetFriend) {
    final minStartHeap = HeapPriorityQueue<List<int>>((a, b) {
      if (a.first < b.first) {
        return -1;
      } else if (a.first == b.first) {
        return 0;
      } else {
        return 1;
      }
    });

    for (var i = 0; i < times.length; i++) {
      final time = times[i];
      minStartHeap.add([time.first, time.last, i]);
    }

    final endHeap = HeapPriorityQueue<List<int>>((a, b) {
      if (a[1] < b[1]) {
        return -1;
      } else if (a[1] == b[1]) {
        return 0;
      } else {
        return 1;
      }
    });

    endHeap.add(minStartHeap.removeFirst());
    var smallestChair = endHeap.length;
    while (minStartHeap.isNotEmpty) {
      final time = minStartHeap.removeFirst();

      if (endHeap.first[1] <= time.first) {
        final removed = endHeap.removeFirst();
        smallestChair = removed.last;
        final index = time.last;
        if (index == targetFriend) {
          break;
        }
        endHeap.add([time[0], time[1], smallestChair]);
      } else {
        smallestChair = endHeap.length;
        endHeap.add([time[0], time[1], time.last]);
      }
    }
    return smallestChair;
  }

  // CASE 1
  final times1 = [
    [1, 3],
    [3, 4],
    [4, 7],
    [5, 7],
  ];
  final targetFriend1 = 1;
  print(smallestChair(times1, targetFriend1));

  // CASE 2
  final times2 = [
    [3, 6],
    [1, 6],
    [4, 5],
    [2, 4],
    [5, 7],
  ];
  final targetFriend2 = 4;
  print(smallestChair(times2, targetFriend2));

  // CASE 3
  final times3 = [
    [3, 5],
    [2, 6],
    [1, 7],
  ];
  final targetFriend3 = 0;
  print(smallestChair(times3, targetFriend3));
}
