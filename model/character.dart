enum Gender {
  male,
  female,
}

enum Status {
  alive,
  mia,
  kia,
}

class Character {
  final String name;
  final String nationality;
  final List<String> affiliations;
  final String rank;
  final Gender gender;
  final Status status;
  final DateTime? death;
  final double height;
  final String hair;
  final String eyes;
  final List<String> relatives;
  final List<String> weapons;
  final List<String> equipment;

  Character({
    this.name = '',
    this.nationality = '',
    this.affiliations = const [],
    this.rank = '',
    this.gender = Gender.male,
    this.status = Status.alive,
    this.height = 0,
    this.hair = '',
    this.eyes = '',
    this.relatives = const [],
    this.weapons = const [],
    this.equipment = const [],
    this.death,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      death: DateTime.tryParse(json['death'] as String? ?? ''),
      name: json['name'] as String? ?? '',
      nationality: json['nationality'] as String? ?? '',
      affiliations: (json['affiliations'] as List<dynamic>)
          .map((e) => e.toString())
          .toList(),
      rank: json['name'] as String? ?? '',
      gender: Gender.values[json['gender'] as int? ?? 0],
      status: Status.values[json['status'] as int? ?? 0],
      height: json['height'] as double? ?? 0,
      hair: json['hair'] as String? ?? '',
      eyes: json['eyes'] as String? ?? '',
      relatives: (json['relatives'] as List<dynamic>)
          .map((e) => e.toString())
          .toList(),
      weapons:
          (json['weapons'] as List<dynamic>).map((e) => e.toString()).toList(),
      equipment: (json['equipment'] as List<dynamic>)
          .map((e) => e.toString())
          .toList(),
    );
  }
}
