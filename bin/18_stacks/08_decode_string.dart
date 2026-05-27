void main() {
  String decodeString(String s) {
    final countStack = [];
    final stringStack = [];
    var currentString = StringBuffer();
    var currentCount = 0;

    for (var i = 0; i < s.length; i++) {
      final char = s[i];
      final codeUnit = char.codeUnitAt(0);

      if (codeUnit >= 48 && codeUnit <= 57) {
        currentCount = (currentCount * 10) + (codeUnit - 48);
      } else if (char == '[') {
        countStack.add(currentCount);
        stringStack.add(currentString);

        currentString = StringBuffer();
        currentCount = 0;
      } else if (char == ']') {
        final count = countStack.removeLast();
        final decoded = currentString.toString() * count;
        currentString = stringStack.removeLast();
        currentString.write(decoded);
      } else {
        currentString.write(char);
      }
    }
    return currentString.toString();
  }

  /// CASE 1
  final input1 = '2[ax2[fw]]3[a]';
  print(decodeString(input1));
}
