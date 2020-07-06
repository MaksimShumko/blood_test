import 'package:blood_test/gender_chooser.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'localization.dart';

Future<void> main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blood test',
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', ''),
        Locale('pl', ''),
        Locale('ru', ''),
      ],
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              AppLocalizations.of(context).translate('title'),
              style: TextStyle(
                fontSize: 30,
                color: Colors.black,
                letterSpacing: 1.5,
                wordSpacing: 1.5,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Text(
                      'Disclaimer',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    'This mobile app is intended for informational purpose only. '
                    'It is not, and is not intended, to be a substitute for '
                    'professional medical advice, diagnosis or treatment. '
                    'You might have a condition that is not suggested here. '
                    'Please consult a doctor of you are concerned about your health.',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black54,
                      letterSpacing: 1.2,
                      wordSpacing: 1.2,
                    ),
                  ),
                ],
              ),
            ),
            ButtonTheme(
              minWidth: 200,
              height: 45,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => GenderChooser()),
                  );
                },
                color: Colors.red,
                child: Text(
                  'Agree and start',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
