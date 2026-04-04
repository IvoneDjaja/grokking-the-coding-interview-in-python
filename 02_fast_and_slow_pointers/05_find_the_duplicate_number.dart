void main() {
  int findDuplicate(List<int> nums) {
    var slow = nums[0];
    var fast = nums[0];

    while (true) {
      slow = nums[slow];
      fast = nums[nums[fast]];
      if (slow == fast) {
        break;
      }
    }

    slow = nums[0];
    while (slow != fast) {
      slow = nums[slow];
      fast = nums[fast];
    }

    return slow;
  }

  // CASE 1
  final nums1 = [1, 3, 3, 4, 2, 5];
  print(findDuplicate(nums1));

  // CASE 2
  final nums2 = [1, 5, 3, 4, 2, 5];
  print(findDuplicate(nums2));

  // CASE 3
  final nums3 = [1, 3, 2, 4, 5, 2, 2];
  print(findDuplicate(nums3));

  // CASE 4
  final nums4 = [6, 6, 6, 4, 6, 6, 6];
  print(findDuplicate(nums4));

  // CASE 5
  final nums5 = [1, 2, 3, 4, 5, 6, 6, 7];
  print(findDuplicate(nums5));
}
