class LinkedListNode {
  LinkedListNode({this.pair, this.next, this.prev});

  List<int>? pair;
  LinkedListNode? next;
  LinkedListNode? prev;

  int? get first => pair?.first;

  int? get second => pair?.last;
}

class LRUCache {
  LRUCache({required this.capacity});

  final int capacity;
  int length = 0;
  LinkedListNode? root;

  int get(int key) {
    if (length == 0 || root == null) {
      return -1;
    }
    int val = -1;
    LinkedListNode? node;
    if (root!.first == key) {
      val = root!.second ?? -1;
      node = root;
      if (root!.next == null) {
        return val;
      }
      root = root?.next;
      root!.prev = null;
    } else {
      var current = root;
      while (current != null) {
        if (current.first == key) {
          val = current.second!;
          node = current;
          if (current.next == null) {
            return val;
          }
          final prev = current.prev;
          final next = current.next;
          prev?.next = next;
          if (next != null) {
            next.prev = prev;
          }
          break;
        }
        current = current.next;
      }
    }

    if (node == null) {
      return -1;
    }
    node.next = null;
    node.prev = null;

    var current = root;
    if (root == null) {
      root = node;
    } else {
      while (current?.next != null) {
        current = current?.next;
      }
      current?.next = node;
      node.prev = current;
    }

    return val;
  }

  void set(int key, int value) {
    LinkedListNode? current = root;
    while (current != null) {
      if (current.first == key) {
        current.pair = [key, value];
        get(key);
        return;
      }
      current = current.next;
    }
    length += 1;
    final node = LinkedListNode(pair: [key, value]);
    if (root == null) {
      root = node;
      return;
    }
    current = root;
    while (current?.next != null) {
      current = current?.next;
    }
    current?.next = node;
    node.prev = current;

    if (length > capacity) {
      final next = root?.next;
      if (next != null) {
        root = next;
        root?.prev = null;
      } else {
        root = null;
      }
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
}
