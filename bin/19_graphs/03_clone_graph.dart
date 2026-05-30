class Node {
  Node({required this.data});

  final int data;
  final List<Node> neighbors = [];
}

void main() {
  Node? createGraph(List<List<int>> adjList) {
    final n = adjList.length;
    final nodeMap = <int, Node>{};
    for (var i = 1; i < n + 1; i++) {
      nodeMap[i] = Node(data: i);
    }
    for (var i = 0; i < n; i++) {
      final node = nodeMap[i + 1];
      for (var j = 0; j < adjList[i].length; j++) {
        final neighborNode = nodeMap[adjList[i][j]]!;
        node!.neighbors.add(neighborNode);
      }
    }
    return nodeMap[1];
  }

  Node? clone(Node? root) {
    final nodeMap = <int, Node>{};

    Node? dfs(Node? node) {
      if (node == null) {
        return null;
      } else if (nodeMap.containsKey(node.data)) {
        return nodeMap[node.data];
      }
      final clone = Node(data: node.data);
      nodeMap[node.data] = clone;
      for (var neighbor in node.neighbors) {
        final neighborClone = dfs(neighbor);
        clone.neighbors.add(neighborClone!);
      }
      return clone;
    }

    return dfs(root);
  }

  /// CASE 1
  final input1 = [
    [2, 4],
    [1, 3],
    [2, 4],
    [1, 3],
  ];
  final graph1 = createGraph(input1)!;
  print(clone(graph1)!.data);
}
