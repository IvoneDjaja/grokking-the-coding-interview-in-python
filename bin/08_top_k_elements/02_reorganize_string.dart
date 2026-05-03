import 'package:collection/collection.dart';

void main() {
  String reorganizeString(String str) {
    var output = '';

    Map<String, int> countMap = <String, int>{};

    for (var i = 0; i < str.length; i++) {
      final char = str[i];
      countMap[char] = (countMap[char] ?? 0) + 1;
    }

    final maxHeap = HeapPriorityQueue<(String, int)>(
      (a, b) => b.$2.compareTo(a.$2),
    );
    for (var entry in countMap.entries) {
      maxHeap.add((entry.key, entry.value));
    }

    while (maxHeap.isNotEmpty) {
      final firstChar = maxHeap.removeFirst();
      var firstCount = firstChar.$2;
      if (output.isNotEmpty && output[output.length - 1] == firstChar.$1) {
        if (maxHeap.isEmpty) {
          return '';
        }
        final secondChar = maxHeap.removeFirst();
        output = '$output${secondChar.$1}';
        if (secondChar.$2 - 1 > 0) {
          maxHeap.add((secondChar.$1, secondChar.$2 - 1));
        }
      } else {
        output = '$output${firstChar.$1}';
        firstCount -= 1;
      }
      if (firstCount > 0) {
        maxHeap.add((firstChar.$1, firstCount));
      }
    }

    return output;
  }

  /// CASE 1
  final input1 = 'aaabc';
  print(reorganizeString(input1));
}
