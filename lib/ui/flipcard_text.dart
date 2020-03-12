import 'package:flutter/material.dart';

class FlipCardText extends StatelessWidget {
  final String verb;
  final String title;

  const FlipCardText({
    Key key,
    this.title,
    this.verb,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: DefaultTextStyle.of(context).style,
        children: <TextSpan>[
          TextSpan(
              text: '$title',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                  color: Colors.grey)),
          TextSpan(
              text: '$verb',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 18.0,
                  color: Colors.black)),
        ],
      ),
    );
  }
}
