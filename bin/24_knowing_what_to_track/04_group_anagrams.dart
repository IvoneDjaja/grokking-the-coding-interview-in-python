void main() {
  List<List<String>> groupAnagrams(List<String> strs) {
    final stringMap = <String, List<String>>{};
    for (var string in strs) {
      final chars = string.split('')..sort();
      final key = chars.join();
      stringMap.putIfAbsent(key, () => []).add(string);
    }

    return stringMap.values.toList();
  }

  /// CASE 1
  final input1 = ['duel', 'dule', 'speed', 'spede', 'deul', 'cars'];
  print(groupAnagrams(input1));
}
