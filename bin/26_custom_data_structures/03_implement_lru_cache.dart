class LinkedListNode {
  LinkedListNode({this.pair, this.next, this.prev});

  List<int>? pair;
  LinkedListNode? next;
  LinkedListNode? prev;

  int? get key => pair?.first;

  int? get value => pair?.last;
}

class LRUCache {
  LRUCache({required this.capacity}) {
    start = LinkedListNode(pair: [-1, -1]);
    end = LinkedListNode(pair: [-1, -1]);
    start!.next = end!;
    end!.prev = start!;
  }

  final int capacity;
  int length = 0;
  LinkedListNode? start;
  LinkedListNode? end;

  int get(int key) {
    var current = start!.next;
    while (current!.key != -1) {
      if (current.key == key) {
        return current.value!;
      }
      current = current.next;
    }
    return -1;
  }

  void set(int key, int value) {
    final last = end!.prev;
    final newNode = LinkedListNode(pair: [key, value], next: end, prev: last);
    last!.next = newNode;
    end!.prev = newNode;

    length += 1;

    if (length > capacity) {
      final first = start!.next;
      final next = first!.next;
      start!.next = next;
    }
  }
}

void main() {
  /// CASE 1
  final lruCache1 = LRUCache(capacity: 10);
  lruCache1.set(2, 2);
  lruCache1.set(3, 3);
  lruCache1.set(4, 4);
  lruCache1.set(5, 5);
  print(lruCache1.get(1));
  print(lruCache1.get(3));
  print(lruCache1.get(2));
}
