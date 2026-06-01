import 'dart:math';

import 'package:collection/collection.dart';

class TrieNode {
  TrieNode() : children = <String, TrieNode>{}, searchWords = [];

  Map<String, TrieNode> children;
  List<String> searchWords;
}

void main() {
  List<List<String>> suggestedProducts(List<String> products, String word) {
    final output = <List<String>>[];

    void insert(TrieNode current, int index, String product) {
      current.searchWords.add(product);
      if (index == product.length) {
        return;
      }

      final char = product[index];
      final children = current.children;

      if (!children.containsKey(char)) {
        final node = TrieNode();
        children[char] = node;
      }
      insert(children[char]!, index + 1, product);
    }

    void search(TrieNode current, int index, String word) {
      if (index > 0) {
        output.add(
          current.searchWords.sublist(0, min(current.searchWords.length, 3)),
        );
      }
      if (index >= word.length) {
        return;
      }
      final char = word[index];
      if (!current.children.containsKey(char)) {
        return;
      }
      final node = current.children[char];
      search(node!, index + 1, word);
    }

    final trieNode = TrieNode();
    for (final product in products) {
      insert(trieNode, 0, product);
    }

    search(trieNode, 0, word);

    return output;
  }

  /// CASE 1
  final products1 = ['razer', 'blade', 'knife', 'cutter', 'games'];
  final word1 = 'game';
  print(suggestedProducts(products1, word1));

  /// CASE 2
  final products2 = ['bags', 'baggage', 'banner', 'box', 'clothes'];
  final word2 = 'bags';
  print(suggestedProducts(products2, word2));

  /// CASE 3
  final products3 = ['mobile', 'mouse'];
  final word3 = 'mon';
  print(suggestedProducts(products3, word3));
}
