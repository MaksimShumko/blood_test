import 'gender.dart';

class Test {
  final String name;
  final Range range;
  final String units;

  Test(this.name, this.range, this.units);
}

class Range {
  final int start;
  final int end;

  Range(this.start, this.end);

  @override
  String toString() {
    return "$start-$end";
  }
}

List<Test> getTests(Gender gender) {
  return [
    Test("ALT (Alanine transaminase)", Range(0, 41), "U/l"),
    Test(
      "AST (Aspartate Transaminase)",
      gender.select(Range(0, 31), Range(0, 35)),
      "U/l",
    ),
    Test(
      "GGT (Gamma-Glutamyl Transpeptidase)",
      gender.select(Range(18, 100), Range(10, 66)),
      "U/l",
    ),
    Test("Amylase", Range(28, 100), "U/l"),
  ];
}

extension GenderExt on Gender {
  Range select(Range maleValue, Range femaleValue) {
    if (this == Gender.male) {
      return maleValue;
    } else {
      return femaleValue;
    }
  }
}
