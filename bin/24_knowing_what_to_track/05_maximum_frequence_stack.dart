class FreqStack {
  late List<List<int>> maxStack;
  late Map<int, int> countMap;
  void init() {
    maxStack = [];
    countMap = {};
  }

  void push(int value) {
    final count = (countMap[value] ?? 0) + 1;
    countMap[value] = count;
    if (maxStack.isNotEmpty) {
      final prev = maxStack.last;
      if (prev.last > count) {
        maxStack.add([prev.first, prev.last]);
      } else {
        maxStack.add([value, count]);
      }
    } else {
      maxStack.add([value, count]);
    }
  }

  int pop() {
    final current = maxStack.removeLast();
    final value = current.first;
    countMap[value] = countMap[value]! - 1;
    return value;
  }
}

void main() {
  /// CASE 1
  final freqStack1 = FreqStack()..init();
  freqStack1.push(2);
  freqStack1.push(4);
  freqStack1.push(5);
  freqStack1.push(4);
  freqStack1.push(2);
  freqStack1.push(4);
  print(freqStack1.pop());

  /// CASE 2
  final freqStack2 = FreqStack()..init();
  freqStack2.push(6);
  freqStack2.push(8);
  freqStack2.push(9);
  freqStack2.push(4);
  freqStack2.push(8);
  freqStack2.push(6);
  print(freqStack2.pop());

  /// CASE 3
  final freqStack3 = FreqStack()..init();
  freqStack3.push(5);
  freqStack3.push(5);
  freqStack3.push(7);
  print(freqStack3.pop());
  print(freqStack3.pop());
}
