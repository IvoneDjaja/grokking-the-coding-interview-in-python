import 'dart:math';

class RandomSet {
  RandomSet();

  final Set<int> nums = {};

  bool insert(int val) {
    if (nums.contains(val)) {
      return false;
    }
    nums.add(val);
    return true;
  }

  bool delete(int val) {
    if (!nums.contains(val)) {
      return false;
    }
    nums.remove(val);
    return true;
  }

  int getRandom() {
    final range = Random();

    late int result;

    var i = 0;
    for (var num in nums) {
      i++;
      if (range.nextInt(i) == 0) {
        result = num;
      }
    }

    return result;
  }
}

void main() {
  /// CASE 1
  final randomSet1 = RandomSet();
  print(randomSet1.insert(20));
  print(randomSet1.getRandom());
  print(randomSet1.delete(20));
}
