void main() {
  bool findCycle(List<int> nums, int index) {
    int getNext(int index) {
      return (index + nums[index]) % nums.length;
    }

    bool isValidStep(isForward, index) {
      if (isForward && nums[index] <= 0) {
        return false;
      }
      if (!isForward && nums[index] >= 0) {
        return false;
      }
      return true;
    }

    var slow = index;
    var fast = index;
    var isForward = nums[slow] > 0;

    while (true) {
      final nextSlow = getNext(slow);
      if (!isValidStep(isForward, nextSlow)) {
        break;
      }
      slow = nextSlow;

      final nextFast = getNext(fast);
      if (!isValidStep(isForward, nextFast)) {
        break;
      }
      final nextNextFast = getNext(nextFast);
      if (!isValidStep(isForward, nextNextFast)) {
        break;
      }
      fast = nextNextFast;

      if (slow == fast) {
        if (slow == getNext(slow)) {
          break;
        }
        return true;
      }
    }
    return false;
  }

  bool circularArrayLoop(List<int> nums) {
    for (var i = 0; i < nums.length; i++) {
      if (findCycle(nums, i)) {
        return true;
      }
    }
    return false;
  }

  // CASE 1
  final nums1 = [3, 1, 2];
  print(circularArrayLoop(nums1));

  // CASE 2
  final nums2 = [-2, -1, -3];
  print(circularArrayLoop(nums2));

  // CASE 3
  final nums3 = [2, 1, -1, -2];
  print(circularArrayLoop(nums3));

  // CASE 4
  final nums4 = [3, -3, 1, 1];
  print(circularArrayLoop(nums4));

  // CASE 5
  final nums5 = [5, 4, -2, -1, 3];
  print(circularArrayLoop(nums5));
}
