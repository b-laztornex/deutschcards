import 'dart:math';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:german_card/model/card.dart';
import 'package:german_card/ui/flipcard_text.dart';
import 'package:german_card/config/constants.dart';

class FlipCard extends StatefulWidget {
  FlipCard({Key key, this.title, this.element, this.onUpdateScore})
      : super(key: key);
  final String title;
  final CardItem element;
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
    options.add(widget.element.translation);

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
                    FlipCardText(
                        title: 'Präsens: ', verb: '${widget.element.presens}'),
                    FlipCardText(
                        title: 'Präteritum: ',
                        verb: '${widget.element.preteritum}'),
                    FlipCardText(
                        title: 'Partizip II: ',
                        verb: '${widget.element.partizip}'),
                    Expanded(
                      child: Wrap(
                        children: options
                            .map(
                              (word) => Container(
                                margin: EdgeInsets.all(5.0),
                                child: RaisedButton(
                                  onPressed: () => widget.onUpdateScore(
                                      word, widget.element.translation),
                                  textColor: Colors.white,
                                  child: Container(
                                    color: Colors.lightBlueAccent,
                                    /* decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: <Color>[
                                          Color(0xFF0D47A1),
                                          Color(0xFF1976D2),
                                          Color(0xFF42A5F5),
                                        ],
                                      ),
                                    ),*/
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
