import 'dart:math';

void main() {
  List<List<int>> intervalIntersections(
    List<List<int>> intervalListA,
    List<List<int>> intervalListB,
  ) {
    final intersections = <List<int>>[];

    var indexA = 0;
    var indexB = 0;

    while (indexA < intervalListA.length && indexB < intervalListB.length) {
      final intervalA = intervalListA[indexA];
      final intervalB = intervalListB[indexB];
      if ((intervalA.first >= intervalB.first &&
              intervalA.first <= intervalB.last) ||
          intervalB.first >= intervalA.first &&
              intervalB.first <= intervalA.last) {
        intersections.add([
          max(intervalA.first, intervalB.first),
          min(intervalA.last, intervalB.last),
        ]);
      }
      if (intervalA.last > intervalB.last) {
        indexB += 1;
      } else {
        indexA += 1;
      }
    }
    return intersections;
  }

  // CASE 1
  final interval1a = [
    [3, 9],
    [20, 31],
  ];
  final interval1b = [
    [1, 8],
    [10, 20],
    [25, 37],
  ];
  print(intervalIntersections(interval1a, interval1b));

  // CASE 2
  final interval2a = [
    [5, 12],
    [16, 25],
    [28, 36],
  ];
  final interval2b = [
    [0, 40],
  ];
  print(intervalIntersections(interval2a, interval2b));

  // CASE 3
  final interval3a = [
    [2, 9],
    [18, 29],
    [38, 48],
  ];
  final interval3b = [
    [4, 14],
    [20, 26],
    [34, 44],
  ];
  print(intervalIntersections(interval3a, interval3b));

  // CASE 4
  final interval4a = [
    [5, 13],
    [25, 36],
  ];
  final interval4b = [
    [13, 25],
    [40, 50],
  ];
  print(intervalIntersections(interval4a, interval4b));

  // CASE 5
  final interval5a = [
    [1, 12],
    [29, 38],
  ];
  final interval5b = [
    [16, 27],
    [40, 48],
  ];
  print(intervalIntersections(interval5a, interval5b));
}
