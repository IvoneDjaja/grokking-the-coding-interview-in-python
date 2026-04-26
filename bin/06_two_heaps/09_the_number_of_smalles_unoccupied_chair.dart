import 'package:collection/collection.dart';

void main() {
  int smallestChair(List<List<int>> times, int targetFriend) {
    final targetArrival = times[targetFriend][0];
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
}
