String encode(List<String> strings) {
  var output = '';
  for (var string in strings) {
    final length = string.length;
    output += '${length.toString()}#$string';
  }
  return output;
}

List<String> decode(String string) {
  final decoded = <String>[];
  final n = string.length;
  var start = 0;
  var i = 0;
  while (i < n) {
    i += 1;
    if (string[i] == '#') {
      final length = int.parse(string.substring(start, i));
      final word = string.substring(i + 1, i + 1 + length);
      decoded.add(word);
      i = i + length + 1;
      start = i;
    }
  }

  return decoded;
}

void main() {
  /// CASE 1
  final input1 = ['I', 'love', 'educative'];
  final encoded = encode(input1);
  print(encoded);
  print(decode(encoded));
}
