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
    cache = <int, LinkedListNode>{};
  }

  final int capacity;
  int length = 0;
  LinkedListNode? start;
  LinkedListNode? end;
  late Map<int, LinkedListNode> cache;

  int get(int key) {
    if (!cache.containsKey(key)) {
      return -1;
    }
    var current = cache[key]!;
    final prev = current.prev;
    final next = current.next;
    prev?.next = next;
    next?.prev = prev;
    final last = end?.prev;
    last?.next = current;
    current.prev = last;
    current.next = end;
    end?.prev = current;
    return current.value!;
  }

  void set(int key, int value) {
    if (cache.containsKey(key)) {
      final current = cache[key];
      current?.pair = [key, value];
      final prev = current?.prev;
      final next = current?.next;
      prev?.next = next;
      next?.prev = prev;
      final last = end?.prev;
      last?.next = current;
      current?.prev = last;
      current?.next = end;
      end?.prev = current;
      return;
    }
    final last = end!.prev;
    final newNode = LinkedListNode(pair: [key, value], next: end, prev: last);
    last!.next = newNode;
    end!.prev = newNode;

    cache[key] = newNode;
    length += 1;

    if (length > capacity) {
      final first = start!.next;
      final next = first!.next;
      start!.next = next;
      next?.prev = start;
      cache.remove(first.key);
      length -= 1;
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

  /// CASE 2
  final lruCache2 = LRUCache(capacity: 2);
  print(lruCache2.get(10));
  lruCache2.set(10, 100);
  print(lruCache2.get(10));
  lruCache2.set(15, 50);
  print(lruCache2.get(10));
  lruCache2.set(30, 300);
  print(lruCache2.get(15));
  print(lruCache2.get(30));

  /// CASE 3 (151/156)
  // ["LRUCache","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get"]
  // ["LRUCache","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","set","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get","get"]
}
