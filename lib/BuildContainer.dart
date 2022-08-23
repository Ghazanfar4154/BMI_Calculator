import 'package:flutter/material.dart';
import 'ConstantFile.dart';

class BuildContainer extends StatelessWidget {
  BuildContainer({required this.colr, required this.widgetCard});

  final Color colr;
  final Widget widgetCard;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: Center(child: widgetCard),
      decoration:
          BoxDecoration(color: colr, borderRadius: BorderRadius.circular(10)),
    );
  }
}

class GenderWidget extends StatelessWidget {
  GenderWidget({required this.genderName, required this.icon});
  final IconData icon;
  final String genderName;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 40,
        ),
        Text(
          genderName,
          style: ALable,
        )
      ],
    );
  }
}
