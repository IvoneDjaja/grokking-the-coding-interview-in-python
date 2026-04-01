void main() {
  bool findCycle(List<int> nums, int index) {
    int findIndex(int index) {
      return (index + nums[index]) % nums.length;
    }

    var slow = index;
    var fast = index;
    fast = findIndex(fast);
    var sum = 0;

    while (slow != fast) {
      sum += nums[slow];
      slow = findIndex(slow);
      fast = findIndex(findIndex(fast));
      if (sum >= 0 && nums[slow] < 0) {
        return false;
      }
      if (sum <= 0 && nums[slow] > 0) {
        return false;
      }
      if (slow == fast) {
        if (slow != findIndex(slow)) return true;
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
