void main() {
  /// graph = {
  ///  A: [B, C]
  ///  B: [D]
  ///  C: [E]
  ///  D: []
  ///  E: []
  /// }

  const graph = <String, List<String>>{
    'A': ['B', 'C'],
    'B': ['D'],
    'C': ['E'],
    'D': [],
    'E': [],
  };

  List<String> topologicalSort(Map<String, List<String>> graph) {
    // 1. Initialize in-degree map
    final inDegreeMap = <String, int>{};
    for (final vertex in graph.keys) {
      inDegreeMap[vertex] = 0;
    }
    // 2. Calculate in-degrees of all nodes
    for (final vertex in graph.keys) {
      final edges = graph[vertex]!;
      for (final edge in edges) {
        //  a. Find the neighbors of each node in the given graph
        inDegreeMap[edge] = (inDegreeMap[edge] ?? 0) + 1;
      }
    }

    // 3. Add nodes with 0 in-degree to the queue
    List<String> queue = [];
    for (final vertex in inDegreeMap.keys) {
      if (inDegreeMap[vertex] == 0) {
        queue.add(vertex);
      }
    }
    // 4. Process nodes in topological order
    final result = <String>[];
    while (queue.isNotEmpty) {
      final head = queue.removeAt(0);
      final edges = graph[head]!;
      for (final edge in edges) {
        //  a. Reduce in-degree of neighbors and enqueue if they become 0
        inDegreeMap[edge] = (inDegreeMap[edge] ?? 0) - 1;
        if (inDegreeMap[edge] == 0) {
          queue.add(edge);
        }
      }
      result.add(head);
    }

    // 5. Check for cycles (If not all nodes are processed, a cycle exists)
    if (result.length != graph.keys.length) {
      return [];
    }
    return result;
  }

  print(topologicalSort(graph));
}
