import 'package:blood_test/genderchooser/gender_chooser.dart';
import 'package:blood_test/localization/localization.dart';
import 'package:flutter/material.dart';

class DisclaimerPage extends StatelessWidget {
  DisclaimerPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              L.of(context).t('title'),
              style: TextStyle(
                fontSize: 30,
                color: Colors.black,
                letterSpacing: 1.5,
                wordSpacing: 1.5,
                fontWeight: FontWeight.bold,
              ),
            ),
            _DisclaimerTextWidget(),
            _AgreeAndStartButtonWidget(),
          ],
        ),
      ),
    );
  }
}

class _DisclaimerTextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Text(
              L.of(context).t('disclaimer'),
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            L.of(context).t('disclaimer_text'),
            style: TextStyle(
              fontSize: 20,
              color: Colors.black54,
              letterSpacing: 1.2,
              wordSpacing: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}

class _AgreeAndStartButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: 200,
      height: 45,
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => GenderChooser()),
          );
        },
        color: Colors.red,
        child: Text(
          L.of(context).t('agree_and_start'),
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
