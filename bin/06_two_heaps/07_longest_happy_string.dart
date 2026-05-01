import 'package:collection/collection.dart';

void main() {
  String longestDiverseString(int a, int b, int c) {
    var output = '';
    final maxHeap = HeapPriorityQueue<(int, String)>(
      (a, b) => b.$1.compareTo(a.$1),
    );

    if (a > 0) {
      maxHeap.add((a, 'a'));
    }
    if (b > 0) {
      maxHeap.add((b, 'b'));
    }
    if (c > 0) {
      maxHeap.add((c, 'c'));
    }

    while (maxHeap.isNotEmpty) {
      final firstCountChar = maxHeap.removeFirst();
      var firstCount = firstCountChar.$1;
      final char = firstCountChar.$2;
      final length = output.length;
      if (length > 1 &&
          output[length - 1] == char &&
          output[length - 2] == char) {
        if (maxHeap.isEmpty) {
          break;
        }
        final secondCountChar = maxHeap.removeFirst();
        var secondCount = secondCountChar.$1;
        final char = secondCountChar.$2;
        output = '$output$char';
        secondCount -= 1;
        if (secondCount > 0) {
          maxHeap.add((secondCount, char));
        }
      } else {
        output = '$output$char';
        firstCount -= 1;
      }
      if (firstCount > 0) {
        maxHeap.add((firstCount, char));
      }
    }
    return output;
  }

  /// CASE 1
  final output1 = longestDiverseString(2, 2, 2);
  print(output1);

  /// CASE 2
  final output2 = longestDiverseString(0, 5, 5);
  print(output2);

  /// CASE 3
  final output3 = longestDiverseString(6, 3, 0);
  print(output3);

  /// CASE 4
  final output4 = longestDiverseString(3, 3, 1);
  print(output4);

  /// CASE 5
  final output5 = longestDiverseString(2, 2, 1);
  print(output5);

  /// CASE 6
  final output6 = longestDiverseString(5, 1, 0);
  print(output6);

  /// CASE 7
  final output7 = longestDiverseString(7, 2, 0);
  print(output7);

  /// CASE 8
  final output8 = longestDiverseString(1, 1, 7);
  print(output8);
}
