void main() {
  List<List<String>> groupAnagrams(List<String> strs) {
    String createKey(String string) {
      final array = List.generate(26, (_) => 0);
      for (var i = 0; i < string.length; i++) {
        final char = string[i];
        array[char.codeUnitAt(0) - 97] += 1;
      }
      return array.toString();
    }

    final stringMap = <String, List<String>>{};
    for (var string in strs) {
      final key = createKey(string);
      stringMap.update(
        key,
        (list) => list..add(string),
        ifAbsent: () => [string],
      );
    }

    final output = <List<String>>[];
    for (final value in stringMap.values) {
      output.add(value);
    }

    return output;
  }

  /// CASE 1
  final input1 = ['duel', 'dule', 'speed', 'spede', 'deul', 'cars'];
  print(groupAnagrams(input1));
}
