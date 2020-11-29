import 'package:bloc/bloc.dart';

enum InputPageEvent { calculate }

enum InputPageStatus { authenticated, unauthenticated, unknown }

class InputPageBloc extends Bloc<InputPageEvent, InputPageStatus> {
  InputPageBloc() : super(InputPageStatus.unknown);

  @override
  Stream<InputPageStatus> mapEventToState(InputPageEvent event) async* {
    switch (event) {
      case InputPageEvent.calculate:
        yield InputPageStatus.authenticated;
        break;
    }
  }
}
