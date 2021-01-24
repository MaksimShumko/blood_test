import 'package:blood_test/data/gender.dart';
import 'package:blood_test/data/tests.dart';
import 'package:blood_test/localization/localization.dart';
import 'package:blood_test/result/result_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'input_page_bloc.dart';

class InputPage extends StatelessWidget {
  final Gender _gender;

  InputPage(this._gender);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) {
          return InputPageBloc();
        },
        child: _InputForm(_gender),
      ),
    );
  }
}

class _InputForm extends StatelessWidget {
  final Gender _gender;

  _InputForm(this._gender);

  @override
  Widget build(BuildContext context) {
    return BlocListener<InputPageBloc, InputPageStatus>(
      listener: (BuildContext context, state) {
        if (state is InputPageStatusCalculated) {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => ResultPage(state.tests)),
          );
        }
      },
      child: SafeArea(
        child: Stack(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _TitleTextWidget(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: getTests(context, _gender).map((test) {
                      return _EditTextWidget(test);
                    }).toList(),
                  ),
                  _CalculateButtonWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TitleTextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Text(
        L.of(context).t('input_title'),
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
          color: Colors.black54,
          letterSpacing: 1.2,
          wordSpacing: 1.2,
        ),
      ),
    );
  }
}

class _EditTextWidget extends StatelessWidget {
  final Test _test;

  _EditTextWidget(this._test);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: TextField(
        keyboardType: TextInputType.numberWithOptions(
          decimal: true,
          signed: false,
        ),
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp(r'[\d\.,]+')),
        ],
        decoration: InputDecoration(
          suffixText: "${_test.units} [${_test.range}]",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          labelText: _test.name,
        ),
        onChanged: (value) => context
            .read<InputPageBloc>()
            .add(TestValueChangedEvent(_test, value)),
      ),
    );
  }
}

class _CalculateButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: 200,
      height: 45,
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        onPressed: () {
          context.read<InputPageBloc>().add(CalculateEvent());
        },
        color: Colors.red,
        child: Text(
          L.of(context).t('calculate'),
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
