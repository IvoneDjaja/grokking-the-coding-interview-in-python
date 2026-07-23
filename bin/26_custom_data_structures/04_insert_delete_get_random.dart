import 'dart:math';

class RandomSet {
  RandomSet();

  final Map<int, int> numSet = {};
  final List<int> numList = [];
  final Random random = Random();

  bool insert(int val) {
    if (numSet.containsKey(val)) {
      return false;
    }
    numSet[val] = numList.length;
    numList.add(val);
    return true;
  }

  bool delete(int val) {
    if (!numSet.containsKey(val)) {
      return false;
    }
    final index = numSet[val]!;
    final lastVal = numList.last;
    numList[index] = lastVal;
    numSet[lastVal] = index;
    numList.removeLast();
    numSet.remove(val);

    return true;
  }

  int getRandom() {
    return numList[random.nextInt(numList.length)];
  }
}

void main() {
  /// CASE 1
  final randomSet1 = RandomSet();
  print(randomSet1.insert(20));
  print(randomSet1.getRandom());
  print(randomSet1.delete(20));
}
