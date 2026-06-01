import 'dart:collection';

void main() {
  int openLock(List<String> deadends, String target) {
    final n = 4;
    var deadendsSet = deadends.toSet();
    var digitsSet = <String>{};
    final queue = Queue<(String, int)>()..add((target, 0));
    for (var i = 0; i < n; i++) {
      (String, int)? digitsFound;
      while (queue.isNotEmpty) {
        final item = queue.removeFirst();
        final digits = item.$1;
        final count = item.$2;
        digitsSet.add(digits);
        if (digits[i] == '0') {
          digitsFound = (digits, count);
          queue.clear();
          break;
        }
        if (deadendsSet.contains(digits)) {
          continue;
        }
        final top =
            '${digits.substring(0, i)}${((int.parse(digits[i]) + 1) % 10).toString()}${digits.substring(i + 1, n)}';
        final bottom =
            '${digits.substring(0, i)}${((int.parse(digits[i]) - 1) % 10).toString()}${digits.substring(i + 1, n)}';
        if (!digitsSet.contains(top)) {
          queue.add((top, count + 1));
        }
        if (!digitsSet.contains(bottom)) {
          queue.add((bottom, count + 1));
        }
      }
      queue.clear();
      if (digitsFound != null) {
        queue.add(digitsFound);
      } else {
        return -1;
      }
    }
    return queue.removeFirst().$2;
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
}
