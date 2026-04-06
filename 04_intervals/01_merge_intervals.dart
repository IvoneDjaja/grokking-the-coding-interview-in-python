import 'dart:math';

void main() {
  List<List<int>> mergeIntervals(List<List<int>> intervals) {
    intervals..sort((a, b) => a.first < b.first ? -1 : 1);
    final stack = <List<int>>[];

    for (var interval in intervals) {
      if (stack.length == 0) {
        stack.add(interval);
      } else {
        if (interval.first <= stack.last.last) {
          final lastInterval = stack.removeLast();
          stack.add([
            lastInterval.first,
            max(lastInterval.last, interval.last),
          ]);
        } else {
          stack.add(interval);
        }
      }
    }
    return stack;
  }

  // CASE 1
  final intervals1 = [
    [10, 12],
    [12, 15],
  ];
  print(mergeIntervals(intervals1));

  // CASE 2
  final intervals2 = [
    [14, 20],
  ];
  print(mergeIntervals(intervals2));

  // CASE 3
  final intervals3 = [
    [1, 5],
    [4, 6],
    [3, 7],
    [6, 8],
  ];
  print(mergeIntervals(intervals3));

  // CASE 4
  final intervals4 = [
    [1, 3],
    [2, 6],
    [15, 18],
    [8, 10],
    [18, 20],
  ];
  print(mergeIntervals(intervals4));
}
