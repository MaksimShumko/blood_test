import 'package:bloc/bloc.dart';
import 'package:blood_test/data/tests.dart';

abstract class InputPageEvent {}

class CalculateEvent extends InputPageEvent {}

class TestValueChangedEvent extends InputPageEvent {
  final Test test;
  final String value;

  TestValueChangedEvent(this.test, this.value);
}

abstract class InputPageStatus {}

class InputPageStatusCalculated extends InputPageStatus {
  final Map<Test, double> tests;

  InputPageStatusCalculated(this.tests);
}

class InputPageStatusUnknown extends InputPageStatus {}

class InputPageBloc extends Bloc<InputPageEvent, InputPageStatus> {
  final Map<Test, double> _tests = Map();

  InputPageBloc() : super(InputPageStatusUnknown());

  @override
  Stream<InputPageStatus> mapEventToState(InputPageEvent event) async* {
    if (event is CalculateEvent) {
      yield InputPageStatusCalculated(_tests);
    } else if (event is TestValueChangedEvent) {
      final value = double.tryParse(event.value);
      if (value != null) {
        _tests[event.test] = value;
      }
    }
  }
}
