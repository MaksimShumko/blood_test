import 'package:bloc/bloc.dart';
import 'package:blood_test/data/tests.dart';

abstract class ResultPageEvent {}

class CalculateEvent extends ResultPageEvent {}

class TestValueChangedEvent extends ResultPageEvent {
  final Test test;
  final String value;

  TestValueChangedEvent(this.test, this.value);
}

abstract class ResultPageStatus {}

class ResultPageStatusCalculated extends ResultPageStatus {
  final String result;

  ResultPageStatusCalculated(this.result);
}

class ResultPageBloc extends Bloc<ResultPageEvent, ResultPageStatus> {
  final Map<Test, double> _tests;

  ResultPageBloc(this._tests)
      : super(ResultPageStatusCalculated(_calculate(_tests)));

  static String _calculate(Map<Test, double> tests) {
    String result = "";
    tests.forEach((key, value) {
      if (value < key.range.start) {
        result += key.range.belowReason;
      } else if (value > key.range.end) {
        result += key.range.aboveReason;
      }
    });
    return result;
  }

  @override
  Stream<ResultPageStatus> mapEventToState(ResultPageEvent event) async* {}
}
