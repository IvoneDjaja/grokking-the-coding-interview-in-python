import 'dart:math';

void main() {
  String alienDictionary(List<String> words) {
    final inDegreeMap = <String, int>{};
    final edges = <String, List<String>>{};
    for (final word in words) {
      for (var i = 0; i < word.length; i++) {
        inDegreeMap[word[i]] = 0;
        edges[word[i]] = [];
      }
    }

    for (var i = 0; i < words.length - 1; i++) {
      final word1 = words[i];
      final word2 = words[i + 1];
      final minLength = min(word1.length, word2.length);

      for (var j = 0; j < minLength; j++) {
        if (j == minLength - 1 && word1.length > word2.length) {
          return "";
        }
        if (word1[j] != word2[j]) {
          if (!(edges[word1[j]]!.contains(word2[j]))) {
            edges[word1[j]]!.add(word2[j]);
            inDegreeMap[word2[j]] = (inDegreeMap[word2[j]] ?? 0) + 1;
          }
          break;
        }
      }
    }

    final queue = <String>[];
    final result = <String>[];
    for (final key in inDegreeMap.keys) {
      if (inDegreeMap[key] == 0) {
        queue.add(key);
      }
    }

    while (queue.isNotEmpty) {
      final char = queue.removeAt(0);
      result.add(char);
      for (final edge in edges[char]!) {
        inDegreeMap[edge] = (inDegreeMap[edge] ?? 0) - 1;
        if (inDegreeMap[edge] == 0) {
          queue.add(edge);
        }
      }
    }

    if (result.length != inDegreeMap.keys.length) {
      return "";
    }
    return result.join("");
  }

  print('CASE 1');
  final words1 = ['ca', 'aa', 'ab'];
  print(alienDictionary(words1));

  print('CASE 2');
  final words2 = ['ac', 'ab', 'zc', 'zb'];
  print(alienDictionary(words2));

  print('CASE 3');
  final words3 = ['baa', 'abcd', 'abca', 'cab', 'cad'];
  print(alienDictionary(words3));

  print('CASE 4');
  final words4 = ['mdx', 'mars', 'avgd', 'dxae'];
  print(alienDictionary(words4));

  print('CASE 5');
  final words5 = ['m', 'a', 'b', 's'];
  print(alienDictionary(words5));

  print('CASE 6');
  final words6 = [
    "m",
    "mx",
    "mxe",
    "mxer",
    "mxerl",
    "mxerlo",
    "mxerlos",
    "mxerlost",
    "mxerlostr",
    "mxerlostrpq",
    "mxerlostrp",
  ];
  print(alienDictionary(words6));
}
