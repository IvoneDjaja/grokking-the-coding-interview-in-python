void main() {
  int gasStationJourneys(List<int> gas, List<int> cost) {
    var startIndexes = [];
    final n = gas.length;

    for (var i = 0; i < n; i++) {
      if (gas[i] >= cost[i]) {
        startIndexes.add(i);
      }
    }

    for (var startIndex in startIndexes) {
      var hasReturned = false;
      var totalGas = gas[startIndex] - cost[startIndex];
      var index = startIndex;
      while (totalGas >= 0) {
        index = (index + 1) % n;
        if (index == startIndex) {
          hasReturned = true;
          break;
        }
        totalGas = totalGas + gas[index] - cost[index];
      }
      final output = hasReturned ? startIndex : -1;
      if (output != -1) {
        return output;
      }
    }
    return -1;
  }

  /// CASE 1
  final gas1 = [1, 2, 3, 4, 5];
  final cost1 = [3, 4, 5, 1, 2];
  print(gasStationJourneys(gas1, cost1));

  /// CASE 2
  final gas2 = [1, 2, 3, 3];
  final cost2 = [2, 1, 5, 1];
  print(gasStationJourneys(gas2, cost2));

  /// CASE 3
  final gas3 = [2, 3, 4];
  final cost3 = [3, 4, 3];
  print(gasStationJourneys(gas3, cost3));
}
