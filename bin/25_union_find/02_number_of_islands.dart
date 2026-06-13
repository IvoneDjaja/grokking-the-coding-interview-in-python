void main() {
  int numIslands(List<List<String>> grid) {
    final parentMap = <int, int>{};

    int findRoot(num) {
      if (num == parentMap[num]) {
        return num;
      }
      return parentMap[num] = findRoot(parentMap[num]);
    }

    void union(u, v) {
      final rootU = findRoot(u);
      final rootV = findRoot(v);
      if (rootU != rootV) {
        parentMap[rootU] = rootV;
      }
    }

    final m = grid.length;
    final n = grid.first.length;
    for (var i = 0; i < m; i++) {
      for (var j = 0; j < n; j++) {
        if (grid[i][j] == '1') {
          final id = i * n + j;
          parentMap[id] = id;
        }
      }
    }

    for (var id in parentMap.keys) {
      final i = id ~/ n;
      final j = id % n;

      final up = [i + 1, j];
      final down = [i - 1, j];
      final left = [i, j - 1];
      final right = [i, j + 1];

      for (var neighbor in [up, down, left, right]) {
        final neighborId = neighbor.first * n + neighbor.last;
        if (parentMap.containsKey(neighborId)) {
          union(neighborId, id);
        }
      }
    }

    final ids = <int>{};
    for (var id in parentMap.values) {
      ids.add(id);
    }

    return ids.length;
  }

  /// CASE 1
  final input1 = [
    ['1', '1', '1'],
    ['0', '1', '0'],
    ['1', '0', '0'],
    ['1', '0', '1'],
  ];
  print(numIslands(input1));
}
