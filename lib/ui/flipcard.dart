import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:german_card/model/card.dart';
import 'package:german_card/ui/flipcard_text.dart';

class FlipCard extends StatefulWidget {
  FlipCard({Key key, this.title, this.element}) : super(key: key);
  final String title;
  final CardItem element;

  @override
  _FlipCardState createState() => _FlipCardState();
}

class _FlipCardState extends State<FlipCard> {
  bool _cardFlip = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
                ],
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
