import 'dart:math';

void main() {
  int reverse(int num) {
    var reversed = 0;
    var current = num;
    while (current > 0) {
      final remainder = current % 10;
      reversed = (reversed * 10) + remainder;
      if (reversed > pow(2, 31) - 1 || reversed < -pow(2, 31)) {
        return 0;
      }
      current ~/= 10;
    }

    return reversed;
  }

  /// CASE 1
  print(reverse(345));

  /// CASE 2
  print(reverse(-8765));

  /// CASE 3
  print(reverse(1254));

  /// CASE 4
  print(reverse(0));

  /// CASE 5
  print(reverse(1534536429));
}
