import 'dart:math';

import 'package:collection/collection.dart';

/// Retry: 1
void main() {
  int smallestChair(List<List<int>> times, int targetFriend) {
    final targetArrival = times[targetFriend].first;
    times.sort((a, b) => a.first.compareTo(b.first));

    final emptyChairs = HeapPriorityQueue<int>((a, b) => a.compareTo(b));
    for (int i = 0; i < times.length; i++) {
      emptyChairs.add(i);
    }

    final occupied = HeapPriorityQueue<List<int>>(
      (a, b) => a.first.compareTo(b.first),
    );

    for (final time in times) {
      final arrival = time.first;
      final leave = time.last;

      while (occupied.isNotEmpty && occupied.first.first <= arrival) {
        emptyChairs.add(occupied.removeFirst().last);
      }

      final currentChair = emptyChairs.removeFirst();
      if (arrival == targetArrival) {
        return currentChair;
      }
      occupied.add([leave, currentChair]);
    }

    return 0;
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

  // CASE 4
  final times4 = [
    [9, 16],
    [16, 21],
    [21, 24],
    [24, 30],
    [30, 40],
    [40, 44],
    [44, 54],
  ];
  final targetFriend4 = 3;
  print(smallestChair(times4, targetFriend4));

  // CASE 5
  final times5 = [
    [1, 5],
    [6, 7],
    [8, 16],
    [17, 19],
    [20, 25],
    [26, 31],
    [32, 39],
  ];
  final targetFriend5 = 4;
  print(smallestChair(times5, targetFriend5));

  // CASE 6
  final times6 = [
    [88734, 94568],
    [47668, 55499],
    [8353, 55582],
  ];
  final targetFriend6 = 0;
  print(smallestChair(times6, targetFriend6));

  // CASE 7
  final times7 = [
    [2, 4],
  ];
  final targetFriend7 = 0;
  print(smallestChair(times7, targetFriend7));

  // CASE 8
  final times8 = [
    [1, 10],
    [2, 3],
    [4, 20],
    [11, 30],
    [12, 40],
  ];
  final targetFriend8 = 4;
  print(smallestChair(times8, targetFriend8));
}
