void main() {
  String alienDictionary(List<String> words) {
    var resultList = [];

    for (var i = 0; i < words.length - 1; i++) {
      final word1 = words[i];
      final word2 = words[i + 1];
      var index1 = 0;
      var index2 = 0;
      while (word1[index1] == word2[index2]) {
        index1 += 1;
        index2 += 1;
      }
      if (resultList.contains(word1[index1]) &&
          resultList.contains(word2[index2])) {
        if (resultList.indexOf(word2[index2]) <
            resultList.indexOf(word1[index1])) {
          resultList.clear();
          break;
        }
      }
      if (index1 < word1.length && index2 < word2.length) {
        if (resultList.contains(word2[index2]) &&
            !resultList.contains(word1[index1])) {
          resultList.remove(word2[index2]);
        }
      }
      if (!resultList.contains(word1[index1])) {
        resultList.add(word1[index1]);
      }
      if (!resultList.contains(word2[index2])) {
        resultList.add(word2[index2]);
      }
    }
    return resultList.join('');
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
}
