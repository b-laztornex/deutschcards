import 'package:flutter/material.dart';
import 'package:german_card/config/constants.dart';

class A11 extends StatelessWidget {
  const A11({
    Key key,
    this.color = const Color(0xFF2DBD3A),
    this.child,
  }) : super(key: key);

  final Color color;
  final Widget child;

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
        title: Text("Home"),
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                // Navigate to the second screen using a named route.
                Navigator.pushNamed(context, '/selection');
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
