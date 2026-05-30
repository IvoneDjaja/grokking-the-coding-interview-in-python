import 'dart:math';

void main() {
  int networkDelayTime(List<List<int>> times, int n, int k) {
    if (times.length != n - 1) {
      return -1;
    }

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

    final queue = [
      [k, 0],
    ];
    var minTime = -1;
    var maxTime = -1;
    while (queue.isNotEmpty) {
      final node = queue.removeAt(0);
      final start = node.first;
      final time = node.last;
      final neighbors = edgeList[start]!;

      for (final neighbor in neighbors) {
        final neighborTime = time + neighbor.last;
        maxTime = max(maxTime, neighborTime);
        queue.add([neighbor.first, neighborTime]);
      }
      minTime = maxTime;
    }

    return minTime;
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
