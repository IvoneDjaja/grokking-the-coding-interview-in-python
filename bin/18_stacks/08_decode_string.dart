void main() {
  String decodeString(String s) {
    var stack = [];

    for (var i = 0; i < s.length; i++) {
      if (s[i] != ']') {
        stack.add(s[i]);
      } else {
        // get string
        var string = '';
        while (stack[stack.length - 1] != '[') {
          string = stack.removeLast() + string;
        }
        stack.removeLast();

        var countString = '';
        while (stack.isNotEmpty &&
            RegExp(r'^[0-9]').hasMatch(stack[stack.length - 1])) {
          countString = stack.removeLast() + countString;
        }
        var count = int.parse(countString);
        stack.add(string * count);
      }
    }
    return stack.join('');
  }

  /// CASE 1
  final input1 = '2[ax2[fw]]3[a]';
  print(decodeString(input1));
}
