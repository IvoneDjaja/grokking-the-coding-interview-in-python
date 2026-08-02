import 'dart:math';

void main() {
  int reverse(int num) {
    var digitCount = 0;
    var current = num;
    while (current > 0) {
      current ~/= 10;
      digitCount += 1;
    }
    var reversed = 0;
    var initial = pow(10, digitCount - 1).toInt();
    current = num;
    while (current > 0) {
      final remainder = current % 10;
      reversed += (remainder * initial);
      current ~/= 10;
      initial ~/= 10;
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
}
