import 'package:flutter/material.dart';
import 'package:german_card/controller/verb_controller.dart';
import 'package:german_card/model/verb_model.dart';

class A11 extends StatefulWidget {
  final color;
  final child;
  const A11({
    Key key,
    this.color = const Color(0xFF2DBD3A),
    this.child,
  }) : super(key: key);

  @override
  _A11State createState() => _A11State();
}

class _A11State extends State<A11> {
  List<VerbModel> verbs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    VerbController.getAllVerbs("a1.1").then((val) {
      setState(() {
        verbs = val;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<String> entries = <String>[
      'Grammatik',
      'Auswahl der Verben',
      'Verb-Schreiben',
      'Pronomen'
    ];
    final List<int> colorCodes = <int>[600, 500, 400, 300, 200];
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the Selection object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Level"),
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                // Navigate to the second screen using a named route.
                Navigator.pushNamed(context, '/selection', arguments: verbs);
              },
              child: Container(
                height: 50,
                color: Colors.amber[colorCodes[index]],
                child: Center(child: Text('${entries[index]}')),
              ),
            );
          }),
    );
  }
}
