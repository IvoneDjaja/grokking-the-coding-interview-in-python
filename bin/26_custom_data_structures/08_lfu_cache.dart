class Node {
  Node({required this.key, required this.val});

  final int key;
  final int val;
  int useCounter = 0;
  Node? next;
  Node? prev;
}

class LFUCache {
  LFUCache({required this.capacity})
    : start = Node(key: -1, val: -1),
      end = Node(key: -1, val: -1),
      valMap = <int, Node>{},
      countMap = <int, List<Node>>{} {
    start.next = end;
    end.prev = start;
  }

  final Node start;
  final Node end;
  final int capacity;
  final Map<int, Node> valMap;
  final Map<int, List<Node>> countMap;

  int get(int key) {
    final hasKey = valMap.containsKey(key);
    Node? node;

    if (hasKey) {
      node = valMap[key]!;
      Node? current = end;
      while (current?.prev != null) {
        current = current?.prev;
        if (current!.useCounter <= node.useCounter) {
          node.useCounter += 1;
          final next = current.next;
          current.next = node;
          node.prev = current;
          node.next = next;
          next!.prev = node;
          break;
        }
      }
    }

    return node?.val ?? -1;
  }

  void put(int key, int val) {
    late Node node;

    final hasKey = valMap.containsKey(key);

    if (hasKey) {
      node = valMap[key]!;
    } else {
      node = Node(key: key, val: val);
    }

    valMap[key] = node;
    node.useCounter += 1;

    Node? current = start;
    while (current?.next != null) {
      current = current?.next;
      if (current!.useCounter > node.useCounter) {
        final prev = current.prev;
        prev?.next = node;
        node.prev = prev;
        node.next = current;
        current.prev = node;
        break;
      }
    }

    if (valMap.length > capacity) {
      final current = start.next;
      final next = current?.next;
      start.next = next;
      next?.prev = start;
      valMap.remove(current!.key);
    }
  }
}

void main() {
  /// CASE 1
  final cache1 = LFUCache(capacity: 2);
  cache1.put(1, 1);
  cache1.put(2, 2);
  cache1.put(3, 3);
  print(cache1);
}
