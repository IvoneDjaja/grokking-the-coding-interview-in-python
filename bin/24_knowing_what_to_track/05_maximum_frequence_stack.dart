import 'dart:math';

class FreqStack {
  late Map<int, int> valCountMap = {};
  late Map<int, List<int>> countValsMap = {};
  late int maxFrequency = 0;

  void push(int value) {
    final count = (valCountMap[value] ?? 0) + 1;
    valCountMap[value] = count;
    maxFrequency = max(maxFrequency, count);
    countValsMap.putIfAbsent(count, () => []).add(value);
  }

  int pop() {
    final vals = countValsMap[maxFrequency];
    final val = vals!.removeLast();
    if (vals.isEmpty) {
      countValsMap.remove(maxFrequency);
      maxFrequency -= 1;
    }

    final count = valCountMap[val]! - 1;
    if (count == 0) {
      valCountMap.remove(val);
    } else {
      valCountMap[val] = count;
    }

    return val;
  }
}

void main() {
  /// CASE 1
  final freqStack1 = FreqStack();
  freqStack1.push(2);
  freqStack1.push(4);
  freqStack1.push(5);
  freqStack1.push(4);
  freqStack1.push(2);
  freqStack1.push(4);
  print(freqStack1.pop());

  /// CASE 2
  final freqStack2 = FreqStack();
  freqStack2.push(6);
  freqStack2.push(8);
  freqStack2.push(9);
  freqStack2.push(4);
  freqStack2.push(8);
  freqStack2.push(6);
  print(freqStack2.pop());

  /// CASE 3
  final freqStack3 = FreqStack();
  freqStack3.push(5);
  freqStack3.push(5);
  freqStack3.push(7);
  print(freqStack3.pop());
  print(freqStack3.pop());
}
