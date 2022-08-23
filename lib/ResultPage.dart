import 'package:flutter/material.dart';
import 'package:practiceapp/BuildContainer.dart';
import 'package:practiceapp/ConstantFile.dart';
import 'package:practiceapp/inputPage.dart';
import 'inputPage.dart';

class ResultPage extends StatelessWidget {
  ResultPage({required this.bmiText, required this.bmi});
  final bmiText;
  final bmi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
          'Result Page',
          style: ALable,
        )),
        body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Expanded(
            child: Container(
                color: activeColor,
                child: Center(
                  child: Text(
                    'Your Result',
                    style: RLable,
                  ),
                )),
          ),
          Expanded(
              flex: 5,
              child: BuildContainer(
                colr: activeColor,
                widgetCard: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      bmiText,
                      style: RLable,
                    ),
                    Text(
                      bmi,
                      style: RLable,
                    ),
                    Text(
                      'You Should Do this',
                      style: RLable,
                    )
                  ],
                ),
              )),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => InputPage()));
            },
            child: BuildContainer(
                colr: Colors.grey,
                widgetCard: Text(
                  'Recalculate',
                  style: ALable,
                )),
          )
        ]));
  }
}
