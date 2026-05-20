/// Retry: 1
void main() {
  List<String> compilationOrder(List<List<String>> dependencies) {
    final inDegreeMap = <String, int>{};
    final prerequisiteMap = <String, List<String>>{};

    for (var dependency in dependencies) {
      final dependent = dependency.first;
      final dependee = dependency.last;
      inDegreeMap[dependent] = 0;
      inDegreeMap[dependee] = 0;
      prerequisiteMap[dependent] = [];
      prerequisiteMap[dependee] = [];
    }

    for (var dependency in dependencies) {
      final dependent = dependency.first;
      final dependee = dependency.last;
      if (prerequisiteMap[dependee] == null) {
        prerequisiteMap[dependee] = [];
      }
      inDegreeMap[dependent] = inDegreeMap[dependent]! + 1;
      prerequisiteMap[dependee]!.add(dependent);
    }

    final queue = <String>[];
    for (var course in inDegreeMap.keys) {
      if (inDegreeMap[course] == 0) {
        queue.add(course);
      }
    }

    final output = <String>[];
    while (queue.isNotEmpty) {
      final course = queue.removeAt(0);
      output.add(course);

      final dependents = prerequisiteMap[course]!;
      for (var dependent in dependents) {
        inDegreeMap[dependent] = inDegreeMap[dependent]! - 1;
        if (inDegreeMap[dependent] == 0) {
          queue.add(dependent);
        }
      }
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

  // print('CASE 2');
  // print(
  //   compilationOrder([
  //     ["B", "A"],
  //     ["C", "A"],
  //     ["D", "B"],
  //     ["E", "B"],
  //     ["E", "D"],
  //     ["E", "C"],
  //     ["F", "D"],
  //     ["F", "E"],
  //     ["F", "C"],
  //   ]),
  // );

  // print('CASE 3');
  // print(
  //   compilationOrder([
  //     ["A", "B"],
  //     ["B", "A"],
  //   ]),
  // );

  // print('CASE 4');
  // print(
  //   compilationOrder([
  //     ["B", "C"],
  //     ["C", "A"],
  //     ["A", "F"],
  //   ]),
  // );

  // print('CASE 5');
  // print(
  //   compilationOrder([
  //     ["C", "C"],
  //   ]),
  // );
}
