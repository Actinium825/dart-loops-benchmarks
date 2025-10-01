import 'dart:convert';

import 'package:benchmark_harness/benchmark_harness.dart';

import '../model/character.dart';
import '../model/simon_riley.dart';

void _parseCharacter() {
  final jsonData = jsonDecode(simonRiley);
  Character.fromJson(jsonData as Map<String, dynamic>);
}

class BenchmarkWhileUncached extends BenchmarkBase {
  BenchmarkWhileUncached() : super('');

  final list = List.generate(200, (i) => i);

  static void main() {
    BenchmarkWhileUncached().report();
  }

  @override
  void run() async {
    int count = 0;
    while (count < list.length) {
      _parseCharacter();
      count++;
    }
  }
}

class BenchmarkWhileCached extends BenchmarkBase {
  BenchmarkWhileCached() : super('');

  final list = List.generate(200, (i) => i);

  static void main() {
    BenchmarkWhileCached().report();
  }

  @override
  void run() {
    int count = 0;
    final length = list.length;
    while (count < length) {
      _parseCharacter();
      count++;
    }
  }
}

class BenchmarkWhileReversed extends BenchmarkBase {
  BenchmarkWhileReversed() : super('');

  final list = List.generate(200, (i) => i);

  static void main() {
    BenchmarkWhileReversed().report();
  }

  @override
  void run() {
    int count = list.length - 1;
    while (count >= 0) {
      _parseCharacter();
      count--;
    }
  }
}

class BenchmarkForUncached extends BenchmarkBase {
  BenchmarkForUncached() : super('');

  final list = List.generate(200, (i) => i);

  static void main() {
    BenchmarkForUncached().report();
  }

  @override
  void run() {
    for (int i = 0; i < list.length; i++) {
      _parseCharacter();
    }
  }
}

class BenchmarkForCached extends BenchmarkBase {
  BenchmarkForCached() : super('');

  final list = List.generate(200, (i) => i);

  static void main() {
    BenchmarkForCached().report();
  }

  @override
  void run() {
    final length = list.length;
    for (int i = 0; i < length; i++) {
      _parseCharacter();
    }
  }
}

class BenchmarkForReversed extends BenchmarkBase {
  BenchmarkForReversed() : super('');

  final list = List.generate(200, (i) => i);

  static void main() {
    BenchmarkForReversed().report();
  }

  @override
  void run() {
    for (int i = list.length - 1; i >= 0; i--) {
      _parseCharacter();
    }
  }
}

class BenchmarkForIn extends BenchmarkBase {
  BenchmarkForIn() : super('');

  final list = List.generate(200, (i) => i);

  static void main() {
    BenchmarkForIn().report();
  }

  @override
  void run() {
    for (final _ in list) {
      _parseCharacter();
    }
  }
}

class BenchmarkForEach extends BenchmarkBase {
  BenchmarkForEach() : super('');

  final list = List.generate(200, (i) => i);

  static void main() {
    BenchmarkForEach().report();
  }

  @override
  void run() {
    list.forEach((_) {
      _parseCharacter();
    });
  }
}

class BenchmarkMap extends BenchmarkBase {
  BenchmarkMap() : super('');

  final list = List.generate(200, (i) => i);

  static void main() {
    BenchmarkMap().report();
  }

  @override
  void run() {
    list.map((_) {
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
