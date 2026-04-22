import 'dart:math';

void main() {
  List<List<int>> insertInterval(
    List<List<int>> existingIntervals,
    List<int> newInterval,
  ) {
    var index = 0;
    var intervals = <List<int>>[];

    while (index < existingIntervals.length &&
        existingIntervals[index].last < newInterval.first) {
      intervals.add(existingIntervals[index]);
      index += 1;
    }

    while (index < existingIntervals.length &&
        existingIntervals[index].first <= newInterval.last) {
      newInterval[0] = min(existingIntervals[index].first, newInterval.first);
      newInterval[1] = max(existingIntervals[index].last, newInterval.last);
      index += 1;
    }
    intervals.add(newInterval);

    while (index < existingIntervals.length) {
      intervals.add(existingIntervals[index]);
      index += 1;
    }

    return intervals;
  }

  // CASE 1
  final existingIntervals1 = [
    [1, 3],
    [5, 7],
    [8, 9],
    [10, 13],
  ];
  final newInterval1 = [2, 6];
  print(insertInterval(existingIntervals1, newInterval1));

  // CASE 2
  final existingIntervals2 = [
    [1, 3],
    [6, 9],
  ];
  final newInterval2 = [2, 5];
  print(insertInterval(existingIntervals2, newInterval2));

  // CASE 3
  final existingIntervals3 = [
    [1, 2],
    [3, 4],
    [5, 8],
    [9, 15],
  ];
  final newInterval3 = [2, 5];
  print(insertInterval(existingIntervals3, newInterval3));

  // CASE 4
  final existingIntervals4 = [
    [1, 2],
    [3, 4],
    [5, 8],
    [9, 15],
  ];
  final newInterval4 = [16, 17];
  print(insertInterval(existingIntervals4, newInterval4));

  // CASE 5
  final existingIntervals5 = [
    [1, 6],
    [8, 9],
    [10, 15],
    [16, 18],
  ];
  final newInterval5 = [9, 10];
  print(insertInterval(existingIntervals5, newInterval5));

  // CASE 6
  final existingIntervals6 = [
    [1, 2],
    [3, 4],
    [5, 8],
    [9, 15],
  ];
  final newInterval6 = [16, 17];
  print(insertInterval(existingIntervals6, newInterval6));

  // CASE 7
  final existingIntervals7 = [
    [1, 4],
    [5, 6],
    [7, 8],
    [9, 10],
  ];
  final newInterval7 = [1, 5];
  print(insertInterval(existingIntervals7, newInterval7));

  // CASE 8
  final existingIntervals8 = [
    [1, 3],
    [4, 6],
    [7, 8],
    [9, 10],
  ];
  final newInterval8 = [1, 10];
  print(insertInterval(existingIntervals8, newInterval8));
}
