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

  List<String> _infinitiv;
  List<String> _translation;
  List<VerbModel> _list_verb;
  VerbModel _current_element;

  var txt = TextEditingController();

  @override
  void initState() {
    super.initState();

    /*setState(() {
      _list_verb = verbs;
      _current_element = element;
      _infinitiv = arrayElement;
      _translation = translation;
    });*/
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
    List<String> arrayElement = element.infinitiv.split("");
    List<String> translation = element.translation.split(",");

    arrayElement.shuffle();
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the Write object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Write"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'What do people call you?',
                  labelText: 'Name *',
                ),
                controller: txt,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 30.0,
              ),
              Center(
                child: Text(
                  '${translation[0]}',
                  style: TextStyle(fontSize: 38.0),
                ),
              ),
              SizedBox(
                height: 60.0,
              ),
              Expanded(
                child: GridView.count(
                  // Create a grid with 2 columns. If you change the scrollDirection to
                  // horizontal, this produces 2 rows.
                  crossAxisCount: 6,
                  // Generate 100 widgets that display their index in the List.
                  children: arrayElement
                      .map(
                        (e) => RaisedButton(
                          onPressed: () {},
                          child: Text(
                            '$e',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              /*ListView.builder(
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
              ),*/
            ],
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
