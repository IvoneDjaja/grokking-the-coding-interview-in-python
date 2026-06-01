import 'dart:collection';

void main() {
  int openLock(List<String> deadends, String target) {
    final n = 4;
    var deadendsSet = deadends.toSet();
    final queue = Queue<(String, int)>()..add(('0000', 0));
    var visited = <String>{'0000'};
    while (queue.isNotEmpty) {
      final current = queue.removeFirst();
      final combo = current.$1;
      final count = current.$2;
      if (combo == target) {
        return count;
      }
      for (var i = 0; i < n; i++) {
        final digit = int.parse(combo[i]);
        final up = (digit + 1) % 10;
        final down = (digit - 1) % 10;

        final prefix = combo.substring(0, i);
        final suffix = combo.substring(i + 1);
        final neighbors = [
          '$prefix${up.toString()}$suffix',
          '$prefix${down.toString()}$suffix',
        ];
        for (var neighbor in neighbors) {
          if (visited.contains(neighbor) || deadendsSet.contains(neighbor)) {
            continue;
          }
          visited.add(neighbor);
          queue.add((neighbor, count + 1));
        }
      }
    }
    return -1;
  }

  /// CASE 1
  final deadends1 = ['1234', '2234', '3234', '4234', '5234'];
  final target1 = '1235';
  print(openLock(deadends1, target1));

  /// CASE 2
  final deadends2 = ['0001', '0010', '0100', '1000'];
  final target2 = '9999';
  print(openLock(deadends2, target2));

  /// CASE 3
  final deadends3 = [
    '1110',
    '1112',
    '1101',
    '1121',
    '1011',
    '1211',
    '0111',
    '2111',
  ];
  final target3 = '1111';
  print(openLock(deadends3, target3));

  /// CASE 4
  final deadends4 = ['5555'];
  final target4 = '0001';
  print(openLock(deadends4, target4));

  /// CASE 5
  final deadends5 = ['0010', '0090'];
  final target5 = '0020';
  print(openLock(deadends5, target5));

  /// CASE 5
  final deadends6 = ["7626", "0000", "5113", "5717"];
  final target6 = '8954';
  print(openLock(deadends6, target6));
}
