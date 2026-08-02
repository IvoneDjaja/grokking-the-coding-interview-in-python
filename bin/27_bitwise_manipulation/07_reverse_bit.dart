void main() {
  int reverseBit(int n) {
    var result = 0;
    for (var i = 0; i < 32; i++) {
      result = (result << 1) | (n & 1);
      n >>= 1;
    }
    return result;
  }

  /// CASE 1
  final input1 = 16;
  // 134217728
  print(reverseBit(input1));
}
