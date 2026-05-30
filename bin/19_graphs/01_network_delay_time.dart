import 'dart:math';

import 'package:collection/collection.dart';

void main() {
  int networkDelayTime(List<List<int>> times, int n, int k) {
    final edgeList = <int, List<List<int>>>{};
    for (var i = 1; i < n + 1; i++) {
      edgeList[i] = [];
    }

    for (final edge in times) {
      final source = edge.first;
      final destination = edge[1];
      final time = edge.last;
      edgeList[source]!.add([destination, time]);
    }

    final minHeap = HeapPriorityQueue<List<int>>(
      (a, b) => a.first.compareTo(b.first),
    );
    minHeap.add([0, k]);
    final minTimes = <int, int>{};
    while (minHeap.isNotEmpty) {
      final node = minHeap.removeFirst();
      final start = node.last;
      final time = node.first;

      if (minTimes.containsKey(start)) {
        continue;
      }

      minTimes[start] = time;
      final neighbors = edgeList[start]!;
      for (final neighbor in neighbors) {
        final node = neighbor.first;
        final weight = neighbor.last;
        if (!minTimes.containsKey(node)) {
          final neighborTime = time + weight;
          minHeap.add([neighborTime, node]);
        }
      }
    }

    if (minTimes.length == n) {
      return minTimes.values.reduce((current, next) => max(current, next));
    }
    return -1;
  }

  /// CASE 1
  final times1 = [
    [2, 1, 1],
    [3, 2, 1],
    [3, 4, 2],
  ];
  final n1 = 4;
  final k1 = 3;
  print(networkDelayTime(times1, n1, k1));

  /// CASE 2
  final times2 = [
    [1, 2, 1],
    [2, 3, 1],
    [3, 5, 2],
  ];
  final n2 = 5;
  final k2 = 1;
  print(networkDelayTime(times2, n2, k2));

  /// CASE 3
  final times3 = [
    [1, 2, 2],
  ];
  final n3 = 2;
  final k3 = 2;
  print(networkDelayTime(times3, n3, k3));

  /// CASE 4
  final times4 = [
    [1, 2, 5],
    [1, 3, 5],
    [1, 4, 5],
    [2, 4, 5],
    [3, 4, 5],
  ];
  final n4 = 4;
  final k4 = 1;
  print(networkDelayTime(times4, n4, k4));

  /// CASE 5
  final times5 = [
    [1, 2, 1],
    [2, 3, 2],
    [3, 4, 3],
    [4, 1, 4],
  ];
  final n5 = 4;
  final k5 = 2;
  print(networkDelayTime(times5, n5, k5));
}
