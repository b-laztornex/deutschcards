import 'dart:math';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:german_card/model/card.dart';
import 'package:german_card/ui/flipcard_text.dart';
import 'package:german_card/config/constants.dart';

class FlipCard extends StatefulWidget {
  FlipCard({Key key, this.title, this.element}) : super(key: key);
  final String title;
  final CardItem element;

  @override
  _FlipCardState createState() => _FlipCardState();
}

class _FlipCardState extends State<FlipCard> {
  bool _cardFlip = false;

  pointValidation(String currentWord, String expectedWord) {
    if( currentWord == expectedWord ){

    }else{
      
    }
    // Put your code here, which you want to execute on onPress event.
  }

  List<String> getWords() {
    List<String> values = [];
    final _random = new Random();

    for (var i = 0; i < 6; i++) {
      int random_value =
          0 + _random.nextInt(AppConstants().translations.length - 0);
      values.add(AppConstants().translations[random_value]);
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
    print(widget.element.translation);
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
        color: Colors.blue[100],
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
                                child: FlatButton(
                                  onPressed: pointValidation(
                                      word, widget.element.translation),
                                  child: Text(
                                    "$word",
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    )
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
