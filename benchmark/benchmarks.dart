import 'dart:math';

import 'package:benchmark_harness/benchmark_harness.dart';

// Create a new benchmark by extending BenchmarkBase
class BenchmarkWhileUncached extends BenchmarkBase {
  BenchmarkWhileUncached() : super('');
  final List<int> list = List.generate(3000000, (i) => i);
  static void main() {
    BenchmarkWhileUncached().report();
  }

  // The benchmark code.
  @override
  void run() {
    var count = 0;
    num eachElement = 0;
    while (count < list.length) {
      eachElement = pow(list[count], 3);
      count++;
    }
  }
}

class BenchmarkWhileCached extends BenchmarkBase {
  BenchmarkWhileCached() : super('');
  final List<int> list = List.generate(3000000, (i) => i);
  static void main() {
    BenchmarkWhileCached().report();
  }

  // The benchmark code.
  @override
  void run() {
    var count = 0;
    num eachElement = 0;
    var length = list.length;
    while (count < length) {
      eachElement = pow(list[count], 3);
      count++;
    }
  }
}

class BenchmarkWhileReversed extends BenchmarkBase {
  BenchmarkWhileReversed() : super('');
  final List<int> list = List.generate(3000000, (i) => i);
  static void main() {
    BenchmarkWhileReversed().report();
  }

  // The benchmark code.
  @override
  void run() {
    var count = list.length - 1;
    num eachElement = 0;
    while (count >= 0) {
      eachElement = pow(list[count], 3);
      count--;
    }
  }
}

class BenchmarkForUncached extends BenchmarkBase {
  BenchmarkForUncached() : super('');
  final List<int> list = List.generate(3000000, (i) => i);
  static void main() {
    BenchmarkForUncached().report();
  }

  // The benchmark code.
  @override
  void run() {
    num eachElement = 0;
    for (var i = 0; i < list.length; i++) {
      eachElement = pow(list[i], 3);
    }
  }
}

class BenchmarkForCached extends BenchmarkBase {
  BenchmarkForCached() : super('');
  final List<int> list = List.generate(3000000, (i) => i);
  static void main() {
    BenchmarkForCached().report();
  }

  // The benchmark code.
  @override
  void run() {
    num eachElement = 0;
    var length = list.length;
    for (var i = 0; i < length; i++) {
      eachElement = pow(list[i], 3);
    }
  }
}

class BenchmarkForReversed extends BenchmarkBase {
  BenchmarkForReversed() : super('');
  final List<int> list = List.generate(3000000, (i) => i);
  static void main() {
    BenchmarkForReversed().report();
  }

  // The benchmark code.
  @override
  void run() {
    num eachElement = 0;
    for (var i = list.length - 1; i >= 0; i--) {
      eachElement = pow(list[i], 3);
    }
  }
}

class BenchmarkForIn extends BenchmarkBase {
  BenchmarkForIn() : super('');
  final List<int> list = List.generate(3000000, (i) => i);
  static void main() {
    BenchmarkForIn().report();
  }

  // The benchmark code.
  @override
  void run() {
    num eachElement = 0;
    for (var element in list) {
      eachElement = pow(element, 3);
    }
  }
}

class BenchmarkForEach extends BenchmarkBase {
  BenchmarkForEach() : super('');
  final List<int> list = List.generate(3000000, (i) => i);
  static void main() {
    BenchmarkForEach().report();
  }

  // The benchmark code.
  @override
  void run() {
    num eachElement = 0;
    list.forEach((element) {
      eachElement = pow(element, 3);
    });
  }
}

class BenchmarkMap extends BenchmarkBase {
  BenchmarkMap() : super('');
  final List<int> list = List.generate(3000000, (i) => i);
  static void main() {
    BenchmarkMap().report();
  }

  // The benchmark code.
  @override
  void run() {
    num eachElement = 0;
    list.map((e) {
      eachElement = pow(e, 3);
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
