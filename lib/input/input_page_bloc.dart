import 'package:bloc/bloc.dart';
import 'package:blood_test/data/tests.dart';

abstract class InputPageEvent {}

class CalculateEvent extends InputPageEvent {
}

class TestValueChangedEvent extends InputPageEvent {
  final Test test;
  final String value;

  TestValueChangedEvent(this.test, this.value);
}

enum InputPageStatus { calculated, unknown }

class InputPageBloc extends Bloc<InputPageEvent, InputPageStatus> {
  final Map<Test, String> _map = Map();

  InputPageBloc() : super(InputPageStatus.unknown);

  @override
  Stream<InputPageStatus> mapEventToState(InputPageEvent event) async* {
    if (event is CalculateEvent) {
      print(_map);
      yield InputPageStatus.calculated;
    } else if (event is TestValueChangedEvent) {
      _map[event.test] = event.value;
    }
  }
}
