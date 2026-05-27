void main() {
  String decodeString(String s) {
    var output = '';
    var numberIndexStack = [];
    var parenthesesIndexStack = [];
    var stringStack = [];

    var end = 0;
    while (end < s.length) {
      if (RegExp(r'^[0-9]$').hasMatch(s[end])) {
        var start = end;
        while (s[end] != '[') {
          end += 1;
        }
        numberIndexStack.add([start, end]);
        parenthesesIndexStack.add(end);
        start = end + 1;
      }
      if (s[end] == ']') {
        print('numberIndexStack: $numberIndexStack');
        print('parenthesesIndexStack: $parenthesesIndexStack');
        final countIndex = numberIndexStack.removeLast();
        final start = parenthesesIndexStack.removeLast();

        final count = int.parse(s.substring(countIndex.first, countIndex.last));
        var decoded = s.substring(start + 1, end) * count;

        print('decoded: $decoded');
        print('numberIndexStack: $numberIndexStack');
        print('parenthesesIndexStack: $parenthesesIndexStack');

        output += decoded;
        if (parenthesesIndexStack.isNotEmpty) {
          final prev = stringStack.removeLast();
          stringStack.add(prev + decoded);
        } else {
          output += decoded;
        }
      }
      end += 1;
    }
    return output;
  }

  /// CASE 1
  final input1 = '2[ax2[fw]]3[a]';
  print(decodeString(input1));
}
