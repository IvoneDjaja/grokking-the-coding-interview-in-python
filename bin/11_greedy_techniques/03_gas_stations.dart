void main() {
  int gasStationJourneys(List<int> gas, List<int> cost) {
    if (gas.fold(0, (prev, curr) => prev + curr) <
        cost.fold(0, (prev, curr) => prev + curr)) {
      return -1;
    }

    var totalGas = 0;
    var startIndex = 0;

    for (var i = 0; i < gas.length; i++) {
      totalGas += gas[i] - cost[i];

      if (totalGas < 0) {
        startIndex = i + 1;
        totalGas = 0;
      }
    }

    return startIndex;
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
