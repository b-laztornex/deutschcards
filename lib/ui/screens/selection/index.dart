import 'package:flutter/material.dart';
import 'package:german_card/model/verb_model.dart';
import 'package:german_card/ui/flipcard.dart';

class Selection extends StatefulWidget {
  final List<VerbModel> verbs;
  Selection({Key key, this.verbs}) : super(key: key);

  @override
  _SelectionState createState() => _SelectionState();
}

class _SelectionState extends State<Selection> {
  List<VerbModel> _verbs;
  int _counter = 0;
  int _score = 0;

  @override
  void initState() {
    super.initState();

    setState(() {
      _verbs = widget.verbs;
    });
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
    VerbModel element = _verbs[_counter];
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
