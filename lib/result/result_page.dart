import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  ResultPage();

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
                      'Result',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black54,
                        letterSpacing: 1.2,
                        wordSpacing: 1.2,
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
                        Navigator.of(context)
                            .popUntil(ModalRoute.withName('/'));
                      },
                      child: Text(
                        "Finish",
                        style: TextStyle(fontSize: 20, color: Colors.amber),
                      ),
                    ),
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
