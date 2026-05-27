void main() {
  List<int> exclusiveTime(int n, List<String> logs) {
    final times = List.generate(n, (_) => 0);
    final stack = <int>[];
    int prevTime = 0;

    for (var i = 0; i < logs.length; i++) {
      final log = logs[i].split(':');
      final id = int.parse(log.first);
      final event = log[1];
      final timestamp = int.parse(log.last);
      if (event == 'start') {
        if (stack.isNotEmpty) {
          times[stack.last] += timestamp - prevTime;
        }
        stack.add(id);
        prevTime = timestamp;
      } else if (event == 'end') {
        stack.removeLast();
        times[id] += timestamp - prevTime + 1;
        prevTime = timestamp + 1;
      }
    }
    return times;
  }

  /// CASE 1
  final input1 = [
    '0:start:0',
    '1:start:2',
    '1:end:3',
    '2:start:4',
    '2:end:7',
    '0:end:8',
  ];
  final n1 = 3;
  print(exclusiveTime(n1, input1));
}
