import 'dart:math';

import 'package:benchmark_harness/benchmark_harness.dart';

class BenchmarkWhileUncached extends BenchmarkBase {
  BenchmarkWhileUncached() : super('');

  final list = List.generate(3000000, (i) => i);

  static void main() {
    BenchmarkWhileUncached().report();
  }

  @override
  void run() {
    int count = 0;
    while (count < list.length) {
      pow(list[count], 3);
      count++;
    }
  }
}

class BenchmarkWhileCached extends BenchmarkBase {
  BenchmarkWhileCached() : super('');

  final list = List.generate(3000000, (i) => i);

  static void main() {
    BenchmarkWhileCached().report();
  }

  @override
  void run() {
    int count = 0;
    final length = list.length;
    while (count < length) {
      pow(list[count], 3);
      count++;
    }
  }
}

class BenchmarkWhileReversed extends BenchmarkBase {
  BenchmarkWhileReversed() : super('');

  final list = List.generate(3000000, (i) => i);

  static void main() {
    BenchmarkWhileReversed().report();
  }

  @override
  void run() {
    int count = list.length - 1;
    while (count >= 0) {
      pow(list[count], 3);
      count--;
    }
  }
}

class BenchmarkForUncached extends BenchmarkBase {
  BenchmarkForUncached() : super('');

  final list = List.generate(3000000, (i) => i);

  static void main() {
    BenchmarkForUncached().report();
  }

  @override
  void run() {
    for (int i = 0; i < list.length; i++) {
      pow(list[i], 3);
    }
  }
}

class BenchmarkForCached extends BenchmarkBase {
  BenchmarkForCached() : super('');

  final list = List.generate(3000000, (i) => i);

  static void main() {
    BenchmarkForCached().report();
  }

  @override
  void run() {
    final length = list.length;
    for (int i = 0; i < length; i++) {
      pow(list[i], 3);
    }
  }
}

class BenchmarkForReversed extends BenchmarkBase {
  BenchmarkForReversed() : super('');

  final list = List.generate(3000000, (i) => i);

  static void main() {
    BenchmarkForReversed().report();
  }

  @override
  void run() {
    for (int i = list.length - 1; i >= 0; i--) {
      pow(list[i], 3);
    }
  }
}

class BenchmarkForIn extends BenchmarkBase {
  BenchmarkForIn() : super('');

  final list = List.generate(3000000, (i) => i);

  static void main() {
    BenchmarkForIn().report();
  }

  @override
  void run() {
    for (final element in list) {
      pow(element, 3);
    }
  }
}

class BenchmarkForEach extends BenchmarkBase {
  BenchmarkForEach() : super('');

  final list = List.generate(3000000, (i) => i);

  static void main() {
    BenchmarkForEach().report();
  }

  @override
  void run() {
    list.forEach((element) {
      pow(element, 3);
    });
  }
}

class BenchmarkMap extends BenchmarkBase {
  BenchmarkMap() : super('');

  final list = List.generate(3000000, (i) => i);

  static void main() {
    BenchmarkMap().report();
  }

  @override
  void run() {
    list.map((e) {
      pow(e, 3);
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
