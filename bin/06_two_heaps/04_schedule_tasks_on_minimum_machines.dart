// @dart = 3.0
// dart pub add collection (This is just a comment, but see below)

import 'package:collection/collection.dart';

void main() {
  int minimumMachines(List<List<int>> tasks) {
    final minStartHeap = HeapPriorityQueue<List<int>>((a, b) {
      if (a.first < b.first) {
        return -1;
      } else if (a.first == b.first) {
        return 0;
      } else {
        return 1;
      }
    });
    final minEndHeap = HeapPriorityQueue<List<int>>((a, b) {
      if (a.last < b.last) {
        return -1;
      } else if (a.last == b.last) {
        return 0;
      } else {
        return 1;
      }
    });

    minStartHeap.addAll(tasks);

    var time = 0;
    while (minStartHeap.isNotEmpty) {
      final task = minStartHeap.removeFirst();

      minEndHeap.add(task);
      time = task.first;
      while (minEndHeap.isNotEmpty &&
          (minEndHeap.first.last <= time ||
              (minStartHeap.isNotEmpty &&
                  minEndHeap.first.last < minStartHeap.first.first))) {
        minEndHeap.removeFirst();
      }
    }

    return minEndHeap.length;
  }

  // CASE 1
  final tasks1 = [
    [1, 7],
    [8, 13],
    [5, 6],
    [10, 14],
    [6, 7]
  ];
  print(minimumMachines(tasks1));

  // CASE 2
  final tasks2 = [
    [2, 5],
    [2, 5],
    [2, 5],
    [2, 5],
  ];
  print(minimumMachines(tasks2));

  // CASE 3
  final tasks3 = [
    [2, 3],
    [4, 7],
    [8, 18],
    [19, 25],
    [26, 30],
  ];
  print(minimumMachines(tasks3));

  // CASE 4
  final tasks4 = [
    [12, 13],
    [13, 15],
    [17, 20],
    [13, 14],
    [19, 21],
    [18, 20]
  ];
  print(minimumMachines(tasks4));

  // CASE 5
  final tasks5 = [
    [1, 4],
    [3, 5],
    [6, 8],
    [7, 8],
  ];
  print(minimumMachines(tasks5));

  // CASE 6
  final tasks6 = [
    [1, 3],
    [3, 5],
    [5, 9],
    [9, 12],
    [12, 13],
    [13, 16],
    [16, 17]
  ];
  print(minimumMachines(tasks6));
}
