void main() {
  List<String> compilationOrder(List<List<String>> dependencies) {
    final output = <String>[];

    final inDegreeMap = <String, int>{};
    final prerequisitesMap = <String, List<String>>{};

    for (final dependency in dependencies) {
      final course1 = dependency.first;
      final course2 = dependency.last;
      inDegreeMap[course1] = 0;
      inDegreeMap[course2] = 0;
    }

    for (final course in inDegreeMap.keys) {
      prerequisitesMap[course] = [];
    }

    for (final dependency in dependencies) {
      final course1 = dependency.first;
      final course2 = dependency.last;
      inDegreeMap[course1] = (inDegreeMap[course1] ?? 0) + 1;
      prerequisitesMap[course2]!.add(course1);
    }

    final queue = [];
    for (final course in inDegreeMap.keys) {
      if (inDegreeMap[course] == 0) {
        queue.add(course);
      }
    }

    while (queue.isNotEmpty) {
      final head = queue.removeAt(0);
      output.add(head);
      for (final neighbor in prerequisitesMap[head]!) {
        inDegreeMap[neighbor] = (inDegreeMap[neighbor] ?? 0) - 1;
        if (inDegreeMap[neighbor] == 0) {
          queue.add(neighbor);
        }
      }
    }

    if (output.length != inDegreeMap.keys.length) {
      return [];
    }

    return output;
  }

  print('CASE 1');
  print(
    compilationOrder([
      ["B", "A"],
      ["C", "A"],
      ["D", "C"],
      ["E", "D"],
      ["E", "B"],
    ]),
  );

  print('CASE 2');
  print(
    compilationOrder([
      ["B", "A"],
      ["C", "A"],
      ["D", "B"],
      ["E", "B"],
      ["E", "D"],
      ["E", "C"],
      ["F", "D"],
      ["F", "E"],
      ["F", "C"],
    ]),
  );

  print('CASE 3');
  print(
    compilationOrder([
      ["A", "B"],
      ["B", "A"],
    ]),
  );

  print('CASE 4');
  print(
    compilationOrder([
      ["B", "C"],
      ["C", "A"],
      ["A", "F"],
    ]),
  );

  print('CASE 5');
  print(
    compilationOrder([
      ["C", "C"],
    ]),
  );
}
