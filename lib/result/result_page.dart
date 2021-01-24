import 'package:blood_test/data/tests.dart';
import 'package:blood_test/localization/localization.dart';
import 'package:blood_test/result/result_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResultPage extends StatelessWidget {
  final Map<Test, double> _tests;

  ResultPage(this._tests);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<ResultPageBloc>(
        create: (context) {
          return ResultPageBloc(_tests);
        },
        child: _ResultForm(),
      ),
    );
  }
}

class _ResultForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: BlocBuilder<ResultPageBloc, ResultPageStatus>(
                    buildWhen: (context, state) =>
                        state is ResultPageStatusCalculated,
                    builder: (context, state) => Text(
                      (state as ResultPageStatusCalculated)?.result ?? "",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black54,
                        letterSpacing: 1.2,
                        wordSpacing: 1.2,
                      ),
                    ),
                  ),
                ),
                ButtonTheme(
                  minWidth: 200,
                  height: 45,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                      side: BorderSide(color: Colors.amber),
                    ),
                    highlightColor: Colors.amberAccent,
                    onPressed: () {
                      Navigator.of(context).popUntil(ModalRoute.withName('/'));
                    },
                    child: Text(
                      L.of(context).t('finish'),
                      style: TextStyle(fontSize: 20, color: Colors.amber),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
