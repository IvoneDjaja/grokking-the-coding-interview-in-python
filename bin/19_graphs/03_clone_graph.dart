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

  Node? clone(Node root) {
    final output = null;

    final nodeMap = <int, Node>{};

    final queue = [root];
    while (queue.isNotEmpty) {
      final node = queue.removeAt(0);
      if (!nodeMap.containsKey(node.data)) {
        final neighbors = node.neighbors;
        final clone = Node(data: node.data);
      }
      if (node.neighbors.isNotEmpty) {}
    }

    return output;
  }

  /// CASE 1
  final input1 = [
    [2, 4],
    [1, 3],
    [2, 4],
    [1, 3],
  ];
  print(createGraph(input1)!.data);
}
