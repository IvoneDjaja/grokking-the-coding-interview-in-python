void main() {
  int sumSquareDigits(int n) {
    var sum = 0;
    while (n > 0) {
      final remainder = n % 10;
      n = n ~/ 10;
      sum += remainder * remainder;
    }
    return sum;
  }

  bool isHappyNumber(int n) {
    int slow = n;
    int fast = n;

    while (fast != 1) {
      slow = sumSquareDigits(slow);
      fast = sumSquareDigits(sumSquareDigits(fast));
      if (slow == fast) {
        break;
      }
    }
    return fast == 1;
  }

  // CASE 1
  print(isHappyNumber(7));
  // CASE 2
  print(isHappyNumber(4));
}
