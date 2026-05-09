void main() {
  List<String> generateCombinations(int n) {
    final output = <String>[];
    final stack = <String>[];

    void backtrack(int open, int closed) {
      if (open == n && closed == n) {
        output.add(stack.join(''));
        return;
      }
      if (open < n) {
        stack.add('(');
        backtrack(open + 1, closed);
        stack.removeLast();
      }
      if (open > closed) {
        stack.add(')');
        backtrack(open, closed + 1);
        stack.removeLast();
      }
    }

    backtrack(0, 0);

    return output;
  }

  /// CASE 1
  print(generateCombinations(3));
}
