void main() {
  List<int> numIslands2(int m, int n, List<List<int>> positions) {
    final parentMap = <int, int>{};
    var islandCount = 0;

    int findRoot(int id) {
      if (id == parentMap[id]) {
        return id;
      }
      return parentMap[id] = findRoot(parentMap[id]!);
    }

    void union(int u, int v) {
      final rootU = findRoot(u);
      final rootV = findRoot(v);
      if (rootU != rootV) {
        parentMap[rootU] = rootV;
        islandCount -= 1;
      }
    }

    final directions = [
      [1, 0],
      [-1, 0],
      [0, 1],
      [0, -1],
    ];

    final output = <int>[];

    for (var position in positions) {
      final row = position.first;
      final col = position.last;
      final id = row * n + col;

      // Handle duplicate position drops safely
      if (parentMap.containsKey(id)) {
        output.add(islandCount);
        continue;
      }

      parentMap[id] = id;
      islandCount += 1;

      for (var direction in directions) {
        final nr = row + direction.first;
        final nc = col + direction.last;
        if (nr >= 0 && nr < m && nc >= 0 && nc < n) {
          final nid = nr * n + nc;
          if (parentMap.keys.contains(nid)) {
            union(id, nid);
          }
        }
      }
      output.add(islandCount);
    }

    return output;
  }

  /// CASE 1
  final m1 = 3;
  final n1 = 3;
  final input1 = [
    [0, 0],
    [0, 1],
    [1, 2],
    [2, 1],
    [1, 1],
  ];
  print(numIslands2(m1, n1, input1));

  /// CASE 2
  final m2 = 1;
  final n2 = 3;
  final input2 = [
    [0, 0],
    [0, 1],
    [0, 2],
  ];
  print(numIslands2(m2, n2, input2));

  /// CASE 3
  final m3 = 3;
  final n3 = 3;
  final input3 = [
    [0, 0],
    [2, 2],
  ];
  print(numIslands2(m3, n3, input3));

  /// CASE 4
  final m4 = 3;
  final n4 = 3;
  final input4 = [
    [0, 0],
    [1, 0],
    [2, 0],
    [1, 1],
    [1, 2],
  ];
  print(numIslands2(m4, n4, input4));
}
