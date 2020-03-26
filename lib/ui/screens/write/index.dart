import 'package:flutter/material.dart';
import 'package:german_card/model/verb_model.dart';
import 'package:german_card/ui/flipcard.dart';

class Write extends StatefulWidget {
  Write({Key key}) : super(key: key);
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _WriteState createState() => _WriteState();
}

class _WriteState extends State<Write> {
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

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    List<VerbModel> verbs = ModalRoute.of(context).settings.arguments;
    VerbModel element = verbs[_counter];
    var txt = TextEditingController();
    List<String> el = element.infinitiv.split("");

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the Write object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Write"),
      ),
      body: Container(
        child: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  controller: txt,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                ListView.builder(
                  itemCount: el.length,
                  itemBuilder: (BuildContext context, int index) {
                    return RaisedButton(
                      onPressed: () {},
                      child: Text(
                        '${el[index]}',
                        style: TextStyle(fontSize: 20),
                      ),
                    );
                  },
                ),
              ],
            ),
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
