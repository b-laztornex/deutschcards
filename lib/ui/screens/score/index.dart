import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Score extends StatelessWidget {
  final double score;
  const Score({Key key, this.score = 0.6}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the Write object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Write"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: CircularPercentIndicator(
            radius: 120.0,
            lineWidth: 13.0,
            animation: true,
            percent: score,
            center: new Text(
              "${score.toString()}%",
              style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            footer: new Text(
              "Sales this week",
              style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
            ),
            circularStrokeCap: CircularStrokeCap.round,
            progressColor: Colors.purple,
          ),
        ),
      ),
    );
  }
}
