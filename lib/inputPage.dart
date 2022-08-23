import 'package:flutter/material.dart';
import 'package:practiceapp/ConstantFile.dart';
import 'package:practiceapp/ResultBrain.dart';
import 'BuildContainer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'ResultPage.dart';

const activeColor = Colors.deepPurple;
const deActiveColor = Colors.purple;

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleColor = deActiveColor;
  Color feMaleColor = deActiveColor;
  int sliderHeight = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI Calculator',
          style: ALable,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    setState(() {
                      maleColor = activeColor;
                      feMaleColor = deActiveColor;
                    });
                  },
                  child: BuildContainer(
                      colr: maleColor,
                      widgetCard: GenderWidget(
                        icon: Icons.male,
                        genderName: 'Male',
                      )),
                )),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    setState(() {
                      maleColor = deActiveColor;
                      feMaleColor = activeColor;
                    });
                  },
                  child: BuildContainer(
                      colr: feMaleColor,
                      widgetCard: GenderWidget(
                        icon: Icons.female,
                        genderName: 'Female',
                      )),
                )),
              ],
            ),
          ),
          Expanded(
              child: BuildContainer(
            colr: deActiveColor,
            widgetCard: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Height',
                  style: ALable,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      sliderHeight.toString(),
                      style: ALable,
                    ),
                    Text('cm')
                  ],
                ),
                Slider(
                  value: sliderHeight.toDouble(),
                  onChanged: (double value) {
                    setState(() {
                      sliderHeight = value.round();
                    });
                  },
                  min: 120,
                  max: 220,
                )
              ],
            ),
          )),
          Expanded(
              child: Row(
            children: [
              Expanded(
                  child: BuildContainer(
                colr: deActiveColor,
                widgetCard: Coloumn3(
                  name: 'Weight',
                  value: weight.toString(),
                  onPLus: () {
                    setState(() {
                      weight++;
                    });
                  },
                  onMinus: () {
                    setState(() {
                      weight--;
                    });
                  },
                ),
              )),
              Expanded(
                  child: BuildContainer(
                colr: deActiveColor,
                widgetCard: Coloumn3(
                  name: 'Age',
                  value: age.toString(),
                  onPLus: () {
                    setState(() {
                      age++;
                    });
                  },
                  onMinus: () {
                    setState(() {
                      age--;
                    });
                  },
                ),
              )),
            ],
          )),
          GestureDetector(
            onTap: () {
              setState(() {
                ResultBrain bmi =
                    new ResultBrain(height: sliderHeight, weight: weight);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultPage(
                              bmi: bmi.bMI(),
                              bmiText: bmi.bmiText(),
                            )));
              });
            },
            child: BuildContainer(
                colr: Colors.grey,
                widgetCard: Text(
                  'Calculate',
                  style: ALable,
                )),
          )
        ],
      ),
    );
  }
}

class Coloumn3 extends StatelessWidget {
  Coloumn3(
      {required this.name,
      required this.value,
      required this.onPLus,
      required this.onMinus});
  final String name;
  final String value;
  Function onPLus;
  Function onMinus;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          name.toUpperCase(),
          style: ALable,
        ),
        Text(
          value,
          style: ALable,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: FlatButton(
                child: Icon(Icons.add),
                onPressed: () {
                  onPLus();
                },
                shape: CircleBorder(),
                color: Colors.amberAccent,
              ),
            ),
            Expanded(
              child: FlatButton(
                child: Icon(FontAwesomeIcons.minus),
                onPressed: () {
                  onMinus();
                },
                shape: CircleBorder(),
                color: Colors.amberAccent,
              ),
            )
          ],
        ),
      ],
    );
  }
}
