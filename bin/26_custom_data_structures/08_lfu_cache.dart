class Node {
  Node({required this.key, required this.val});

  final int key;
  int val;
  int useCounter = 0;
  Node? next;
  Node? prev;
}

class DoublyLinkedList {
  DoublyLinkedList()
    : start = Node(key: -1, val: -1),
      end = Node(key: -1, val: -1),
      size = 0 {
    start.next = end;
    end.prev = start;
  }

  final Node start;
  final Node end;
  int size;

  void addToTail(Node node) {
    final prev = end.prev;
    prev!.next = node;
    node.prev = prev;
    node.next = end;
    end.prev = node;
    size += 1;
  }

  void remove(Node node) {
    final next = node.next;
    final prev = node.prev;
    prev!.next = next;
    next!.prev = prev;
    size -= 1;
  }

  Node? removeHead() {
    if (size == 0) {
      return null;
    }
    final head = start.next;
    remove(head!);
    return head;
  }
}

class LFUCache {
  LFUCache({required this.capacity})
    : keyMap = <int, Node>{},
      countMap = <int, DoublyLinkedList>{};

  final int capacity;
  final Map<int, Node> keyMap;
  final Map<int, DoublyLinkedList> countMap;
  var minFrequency = 0;

  int get(int key) {
    final hasKey = keyMap.containsKey(key);

    if (hasKey) {
      final node = keyMap[key]!;
      _update(node);
      return node.val;
    }

    return -1;
  }

  void _update(Node node) {
    var frequency = node.useCounter;
    countMap[frequency]!.remove(node);
    if (minFrequency == frequency && countMap[frequency]!.size == 0) {
      minFrequency += 1;
    }
    node.useCounter += 1;
    if (!countMap.containsKey(node.useCounter)) {
      countMap[node.useCounter] = DoublyLinkedList();
    }
    countMap[node.useCounter]!.addToTail(node);
  }

  void put(int key, int val) {
    if (capacity == 0) {
      return;
    }
    final hasKey = keyMap.containsKey(key);

    if (hasKey) {
      final node = keyMap[key]!;
      node.val = val;
      _update(node);
    } else {
      if (keyMap.length + 1 > capacity) {
        final deletedNode = countMap[minFrequency]?.removeHead();
        if (deletedNode != null) {
          keyMap.remove(deletedNode.key);
        }
      }
      final node = Node(key: key, val: val);
      node.useCounter += 1;
      keyMap[node.key] = node;
      if (!countMap.containsKey(node.useCounter)) {
        countMap[1] = DoublyLinkedList();
      }
      countMap[1]!.addToTail(node);
      minFrequency = 1;
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
  print(cache1.countMap);
  print(cache1.keyMap);
}
