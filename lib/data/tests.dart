import 'package:blood_test/localization/localization.dart';
import 'package:flutter/material.dart';

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
  final String belowReason;
  final String aboveReason;

  Range(this.start, this.end, this.belowReason, this.aboveReason);

  @override
  String toString() {
    return "$start-$end";
  }
}

List<Test> getTests(BuildContext context, Gender gender) {
  return [
    Test(
      "ALT (Alanine transaminase)",
      Range(
        0,
        41,
        L.of(context).t('alt_below_reason'),
        L.of(context).t('alt_above_reason'),
      ),
      "U/l",
    ),
    Test(
      "AST (Aspartate Transaminase)",
      gender.select(
        Range(
          0,
          31,
          L.of(context).t('ast_below_reason'),
          L.of(context).t('ast_above_reason'),
        ),
        Range(
          0,
          35,
          L.of(context).t('ast_below_reason'),
          L.of(context).t('ast_above_reason'),
        ),
      ),
      "U/l",
    ),
    Test(
      "GGT (Gamma-Glutamyl Transpeptidase)",
      gender.select(
          Range(
            18,
            100,
            L.of(context).t('ggt_below_reason'),
            L.of(context).t('ggt_above_reason'),
          ),
          Range(
            10,
            66,
            L.of(context).t('ggt_below_reason'),
            L.of(context).t('ggt_above_reason'),
          )),
      "U/l",
    ),
    Test(
      "AMY (Amylase)",
      Range(
        25,
        125,
        L.of(context).t('amy_below_reason'),
        L.of(context).t('amy_above_reason'),
      ),
      "U/l",
    ),
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
