import 'dart:math';

import 'package:collection/collection.dart';

class TrieNode {
  TrieNode() : children = <String, TrieNode>{}, searchWords = [];

  Map<String, TrieNode> children;
  List<String> searchWords;
}

void main() {
  List<List<String>> suggestedProducts(List<String> products, String word) {
    products.sort();
    final output = List.generate(word.length, (_) => <String>[]);

    void insert(TrieNode root) {
      for (var product in products) {
        var current = root;
        for (var i = 0; i < product.length; i++) {
          final char = product[i];
          final children = current.children;
          if (!children.containsKey(char)) {
            final node = TrieNode();
            children[char] = node;
          }
          current = children[char]!;
          if (current.searchWords.length < 3) {
            current.searchWords.add(product);
          }
        }
      }
    }

    void search(TrieNode root) {
      var current = root;
      for (var i = 0; i < word.length; i++) {
        final char = word[i];
        final children = current.children;
        if (children.containsKey(char)) {
          current = children[char]!;
          output[i] = current.searchWords;
        } else {
          break;
        }
      }
    }

    final trieNode = TrieNode();
    insert(trieNode);

    search(trieNode);

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
