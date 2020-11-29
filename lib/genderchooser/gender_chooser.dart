import 'package:blood_test/data/gender.dart';
import 'package:blood_test/input/input_page.dart';
import 'package:blood_test/localization/localization.dart';
import 'package:flutter/material.dart';

class GenderChooser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                    child: Text(
                      L.of(context).t('choose_gender'),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black54,
                        letterSpacing: 1.2,
                        wordSpacing: 1.2,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _ButtonWidget(L.of(context).t('male'), Gender.male),
                      _ButtonWidget(L.of(context).t('female'), Gender.female),
                      _ButtonWidget(L.of(context).t('other'), Gender.female),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ButtonWidget extends StatelessWidget {
  final String _name;
  final Gender _gender;

  _ButtonWidget(this._name, this._gender);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: ButtonTheme(
        minWidth: 200,
        height: 45,
        child: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
            side: BorderSide(color: Colors.cyan),
          ),
          highlightColor: Colors.cyanAccent,
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => InputPage(_gender)),
            );
          },
          child: Text(
            _name,
            style: TextStyle(fontSize: 20, color: Colors.cyan),
          ),
        ),
      ),
    );
  }
}
