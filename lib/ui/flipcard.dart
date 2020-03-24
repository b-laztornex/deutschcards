import 'dart:math';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:german_card/model/verb_model.dart';
import 'package:german_card/ui/flipcard_text.dart';
import 'package:german_card/config/constants.dart';

class FlipCard extends StatefulWidget {
  FlipCard({Key key, this.title, this.element, this.onUpdateScore})
      : super(key: key);
  final String title;
  final VerbModel element;
  final Function onUpdateScore;

  @override
  _FlipCardState createState() => _FlipCardState();
}

class _FlipCardState extends State<FlipCard> {
  bool _cardFlip = false;

  pointValidation(String currentWord, String expectedWord) {
    if (currentWord == expectedWord) {
    } else {}
    // Put your code here, which you want to execute on onPress event.
  }

  List<String> getWords() {
    List<String> values = [];
    final _random = new Random();

    for (var i = 0; i < 6; i++) {
      int randomValue =
          0 + _random.nextInt(AppConstants().translations.length - 0);
      values.add(AppConstants().translations[randomValue]);
    }
    // We call the function
    return values;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<String> options = getWords();
    List<String> meaning = widget.element.translation.split(',');
    options.add(meaning[0]);
    options.shuffle();

    return GestureDetector(
      onTap: () {
        setState(() {
          _cardFlip = !_cardFlip;
        });
      },
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: !_cardFlip
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    FlipCardText(
                        title: 'Infinitiv: ',
                        verb: '${widget.element.infinitiv}'),
                    SizedBox(height: 10.0),
                    FlipCardText(
                        title: 'Präsens: ', verb: '${widget.element.present}'),
                    SizedBox(height: 10.0),
                    FlipCardText(
                        title: 'Präteritum: ',
                        verb: '${widget.element.preterite}'),
                    SizedBox(height: 10.0),
                    FlipCardText(
                        title: 'Partizip II: ',
                        verb: '${widget.element.perfect}'),
                    SizedBox(height: 10.0),
                    Expanded(
                      child: Wrap(
                        children: options
                            .map(
                              (word) => Container(
                                margin: EdgeInsets.all(5.0),
                                child: RaisedButton(
                                  color: Colors.lightBlueAccent,
                                  onPressed: () => widget.onUpdateScore(
                                      word, meaning[0]),
                                  textColor: Colors.white,
                                  child: Container(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text('$word',
                                        style: TextStyle(fontSize: 20)),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ],
                ),
              )
            : Center(
                child: Text(
                  '${widget.element.meaning}',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.display1,
                ),
              ),
      ),
    );
  }
}
