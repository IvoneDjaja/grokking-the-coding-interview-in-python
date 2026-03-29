void main() {
  bool courseSchedule(int numCourses, List<List<int>> prerequisites) {
    final prerequisitesMap = <int, List<int>>{};
    final inDegreeMap = <int, int>{};
    for (var i = 0; i < numCourses; i++) {
      prerequisitesMap[i] = [];
      inDegreeMap[i] = 0;
    }

    for (final prerequiste in prerequisites) {
      final vertex1 = prerequiste.first;
      final vertex2 = prerequiste.last;
      prerequisitesMap[vertex1]!.add(vertex2);
      inDegreeMap[vertex2] = (inDegreeMap[vertex2] ?? 0) + 1;
    }

    final queue = <int>[];
    for (final vertex in prerequisitesMap.keys) {
      if (inDegreeMap[vertex] == 0) {
        queue.add(vertex);
      }
    }

    final result = <int>[];
    while (queue.isNotEmpty) {
      final vertex = queue.removeAt(0);
      final edges = prerequisitesMap[vertex]!;
      for (final edge in edges) {
        inDegreeMap[edge] = (inDegreeMap[edge] ?? 0) - 1;
        if (inDegreeMap[edge] == 0) {
          queue.add(edge);
        }
      }
      result.add(vertex);
    }

    return result.length == numCourses;
  }

  print('CASE 1');
  final numCourses = 2;
  final prerequisites = [
    [1, 0],
  ];
  print(courseSchedule(numCourses, prerequisites));
}
