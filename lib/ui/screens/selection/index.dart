import 'package:flutter/material.dart';
import 'package:german_card/model/card.dart';
import 'package:german_card/config/constants.dart';
import 'package:german_card/ui/flipcard.dart';

class Selection extends StatefulWidget {
  Selection({Key key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _SelectionState createState() => _SelectionState();
}

class _SelectionState extends State<Selection> {
  int _counter = 0;
  int _score = 0;

  @override
  void initState() {
    super.initState();
  }

  void _updateScore(String currentWord, String expectedWord) {
    if (currentWord == expectedWord) {
      setState(() {
        _counter++;
        _score++;
      });
    } else {
      setState(() {
        _counter++;
        _score--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    CardItem element = AppConstants().cardItems[_counter];
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the Selection object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("title"),
      ),
      body: Container(
        child: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: FlipCard(
            title: "title",
            element: element,
            onUpdateScore: _updateScore,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: _score < 0 ? Colors.red : Colors.blue,
        onPressed: null,
        tooltip: 'Score',
        child: Container(
          child: Text(
            _score.toString(),
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
