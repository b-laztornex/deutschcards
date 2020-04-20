import 'package:flutter/material.dart';
import 'package:german_card/model/verb_model.dart';
import 'package:german_card/model/word_model.dart';

class Write extends StatefulWidget {
  final List<VerbModel> verbs;
  Write({Key key, this.verbs}) : super(key: key);
  @override
  _WriteState createState() => _WriteState();
}

class _WriteState extends State<Write> {
  int _counter = 0;
  int _score = 0;

  List<WordModel> _infinitiv;
  String _complete_infinitiv;
  List<String> _translation;
  List<VerbModel> _list_verb;
  VerbModel _current_element;

  final txt = TextEditingController();

  List<WordModel> generateWordList(element) {
    List<String> arrayElement = element.infinitiv.split("");
    arrayElement.shuffle();
    List<WordModel> arrayLetter = [];
    arrayElement.asMap().forEach((idx, el) {
      arrayLetter.add(WordModel(idx, el));
    });
    return arrayLetter;
  }

  void _setWordStatus(WordModel el) {
    List<WordModel> tmp_infinitiv = _infinitiv;
    tmp_infinitiv[el.id].pressed = !tmp_infinitiv[el.id].pressed;

    txt.text = txt.text + el.word;

    setState(() {
      _infinitiv = tmp_infinitiv;
    });
  }

  @override
  void initState() {
    super.initState();
    List<VerbModel> listVerb = widget.verbs;
    listVerb.shuffle();
    VerbModel element = listVerb[_counter];
    List<WordModel> arrayWord = generateWordList(element);
    List<String> translation = element.translation.split(",");

    setState(() {
      _list_verb = listVerb;
      _current_element = element;
      _infinitiv = arrayWord;
      _translation = translation;
      _complete_infinitiv = element.infinitiv;
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    txt.dispose();
    super.dispose();
  }

  void _updateScore() {
    int count = _counter + 1;
    int score = _score;
    int len = _list_verb.length;

    if (count >= len) {
      double percentege = score > 0 ? ((score * 100) / len) : 0.0;
      Navigator.pushNamed(context, '/score', arguments: percentege);
    } else {
      VerbModel element = _list_verb[count];
      List<WordModel> arrayWord = generateWordList(element);
      List<String> translation = element.translation.split(",");

      score = (_complete_infinitiv == txt.text) ? score + 1 : score - 1;
      txt.text = '';
      setState(() {
        _counter++;
        _score = score;
        _current_element = element;
        _infinitiv = arrayWord;
        _translation = translation;
        _complete_infinitiv = element.infinitiv;
      });
    }
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
                  labelText: '',
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
                  '${_translation[0]}',
                  style: TextStyle(fontSize: 38.0),
                ),
              ),
              SizedBox(
                height: 60.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.replay),
                    tooltip: 'Re-try',
                    onPressed: () {
                      txt.text = "";
                      _infinitiv.asMap().forEach((idx, el) {
                        _infinitiv[idx].pressed = false;
                      });
                      setState(() {
                        _infinitiv = _infinitiv;
                      });
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    tooltip: 'Delete',
                    onPressed: () {
                      setState(() {
                        //_volume += 10;
                      });
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.done),
                    tooltip: 'Continue',
                    onPressed: _updateScore,
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                child: GridView.count(
                  // Create a grid with 2 columns. If you change the scrollDirection to
                  // horizontal, this produces 2 rows.
                  crossAxisCount: 6,
                  // Generate 100 widgets that display their index in the List.
                  children: _infinitiv
                      .map(
                        (el) => RaisedButton(
                          color: el.pressed ? Colors.green : Colors.grey[200],
                          onPressed: () =>
                              !el.pressed ? _setWordStatus(el) : null,
                          child: Text(
                            '${el.word}',
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
