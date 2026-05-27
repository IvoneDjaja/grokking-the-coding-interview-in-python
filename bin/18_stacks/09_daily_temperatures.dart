void main() {
  List<int> dailyTemperatures(List<int> temperatures) {
    final n = temperatures.length;
    final output = List.generate(n, (_) => 0);
    final stack = [];

    for (var i = n - 1; i > -1; i--) {
      var temperature = temperatures[i];
      if (i < n - 1) {
        while (stack.isNotEmpty) {
          if (stack.last[0] > temperature) {
            output[i] = stack.last[1] - i;
            break;
          } else {
            stack.removeLast();
          }
        }
      }
      stack.add([temperature, i]);
    }

    return output;
  }

  /// CASE 1
  final input1 = [73, 74, 75, 71, 69, 72];
  print(dailyTemperatures(input1));
}
