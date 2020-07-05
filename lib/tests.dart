import 'gender.dart';

class Test {
  final String name;
  final String range;
  final String units;

  Test(this.name, this.range, this.units);
}

List<Test> getTests(Gender gender) {
  return [
    Test("ALT (Alanine transaminase)", "0-41", "U/l"),
    Test("AST (Aspartate Transaminase)", gender.select("0-31", "0-35"), "U/l"),
    Test(
      "GGT (Gamma-Glutamyl Transpeptidase)",
      gender.select("18-100", "10-66"),
      "U/l",
    ),
    Test("Amylase", "28-100", "U/l"),
  ];
}

extension GenderExt on Gender {
  String select(String maleValue, String femaleValue) {
    if (this == Gender.male) {
      return maleValue;
    } else {
      return femaleValue;
    }
  }
}
