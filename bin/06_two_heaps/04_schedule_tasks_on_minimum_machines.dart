// @dart = 3.0
// dart pub add collection (This is just a comment, but see below)

import 'package:collection/collection.dart';

/// Retry: 2
void main() {
  int minimumMachines(List<List<int>> tasks) {
    tasks.sort((a, b) => a.first.compareTo(b.first));

    final minEndHeap =
        HeapPriorityQueue<List<int>>((a, b) => a.last.compareTo(b.last));

    minEndHeap.add(tasks.first);
    for (var i = 1; i < tasks.length; i++) {
      final task = tasks[i];
      if (minEndHeap.first.last <= task.first) {
        minEndHeap.removeFirst();
      }
      minEndHeap.add(task);
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
