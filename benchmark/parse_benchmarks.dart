import 'dart:convert';

import 'package:benchmark_harness/benchmark_harness.dart';

import '../model/character.dart';
import '../model/simon_riley.dart';

void _parseCharacter() {
  final jsonData = jsonDecode(simonRiley);
  Character.fromJson(jsonData as Map<String, dynamic>);
}

// Create a new benchmark by extending BenchmarkBase
class BenchmarkWhileUncached extends BenchmarkBase {
  BenchmarkWhileUncached() : super('');
  final List<int> list = List.generate(200, (i) => i);
  static void main() {
    BenchmarkWhileUncached().report();
  }

  // The benchmark code.
  @override
  void run() async {
    var count = 0;
    while (count < list.length) {
      _parseCharacter();
      count++;
    }
  }
}

class BenchmarkWhileCached extends BenchmarkBase {
  BenchmarkWhileCached() : super('');
  final List<int> list = List.generate(200, (i) => i);
  static void main() {
    BenchmarkWhileCached().report();
  }

  // The benchmark code.
  @override
  void run() {
    var count = 0;
    var length = list.length;
    while (count < length) {
      _parseCharacter();
      count++;
    }
  }
}

class BenchmarkWhileReversed extends BenchmarkBase {
  BenchmarkWhileReversed() : super('');
  final List<int> list = List.generate(200, (i) => i);
  static void main() {
    BenchmarkWhileReversed().report();
  }

  // The benchmark code.
  @override
  void run() {
    var count = list.length - 1;
    num eachElement = 0;
    while (count >= 0) {
      _parseCharacter();
      count--;
    }
  }
}

class BenchmarkForUncached extends BenchmarkBase {
  BenchmarkForUncached() : super('');
  final List<int> list = List.generate(200, (i) => i);
  static void main() {
    BenchmarkForUncached().report();
  }

  // The benchmark code.
  @override
  void run() {
    for (var i = 0; i < list.length; i++) {
      _parseCharacter();
    }
  }
}

class BenchmarkForCached extends BenchmarkBase {
  BenchmarkForCached() : super('');
  final List<int> list = List.generate(200, (i) => i);
  static void main() {
    BenchmarkForCached().report();
  }

  // The benchmark code.
  @override
  void run() {
    var length = list.length;
    for (var i = 0; i < length; i++) {
      _parseCharacter();
    }
  }
}

class BenchmarkForReversed extends BenchmarkBase {
  BenchmarkForReversed() : super('');
  final List<int> list = List.generate(200, (i) => i);
  static void main() {
    BenchmarkForReversed().report();
  }

  // The benchmark code.
  @override
  void run() {
    num eachElement = 0;
    for (var i = list.length - 1; i >= 0; i--) {
      _parseCharacter();
    }
  }
}

class BenchmarkForIn extends BenchmarkBase {
  BenchmarkForIn() : super('');
  final List<int> list = List.generate(200, (i) => i);
  static void main() {
    BenchmarkForIn().report();
  }

  // The benchmark code.
  @override
  void run() {
    for (var element in list) {
      _parseCharacter();
    }
  }
}

class BenchmarkForEach extends BenchmarkBase {
  BenchmarkForEach() : super('');
  final List<int> list = List.generate(200, (i) => i);
  static void main() {
    BenchmarkForEach().report();
  }

  // The benchmark code.
  @override
  void run() {
    list.forEach((element) {
      _parseCharacter();
    });
  }
}

class BenchmarkMap extends BenchmarkBase {
  BenchmarkMap() : super('');
  final List<int> list = List.generate(200, (i) => i);
  static void main() {
    BenchmarkMap().report();
  }

  // The benchmark code.
  @override
  void run() {
    list.map((e) {
      _parseCharacter();
    }).toList();
  }
}

void main(List<String> arguments) {
  print('while uncached');
  BenchmarkWhileUncached.main();
  print('while cached');
  BenchmarkWhileCached.main();
  print('while reversed');
  BenchmarkWhileReversed.main();
  print('for uncached');
  BenchmarkForUncached.main();
  print('for cached');
  BenchmarkForCached.main();
  print('for reversed');
  BenchmarkForReversed.main();
  print('for...in');
  BenchmarkForIn.main();
  print('forEach');
  BenchmarkForEach.main();
  print('map');
  BenchmarkMap.main();
}
