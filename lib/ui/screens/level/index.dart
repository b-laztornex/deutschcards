import 'package:flutter/material.dart';

import 'package:german_card/db/database_utils.dart';

import 'package:german_card/model/verb_model.dart';
import 'package:german_card/model/menu_model.dart';

class Level extends StatefulWidget {
  final color;
  final child;
  const Level({
    Key key,
    this.color = const Color(0xFF2DBD3A),
    this.child,
  }) : super(key: key);

  @override
  _LevelState createState() => _LevelState();
}

class _LevelState extends State<Level> {
  List<VerbModel> _verbs;
  List<MenuModel> _menu;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    DatabaseUtils.getVerbs("a11").then((val) {
      setState(() {
        _verbs = val;
      });
    });

    DatabaseUtils.getMenu().then((val) {
      setState(() {
        _menu = val;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<int> colorCodes = <int>[600, 500, 400, 300, 200];
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the Selection object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Level"),
      ),
      body: _verbs != null && _menu != null
          ? ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: _menu.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    // Navigate to the second screen using a named route.
                    Navigator.pushNamed(context, '/${_menu[index].path}',
                        arguments: _verbs);
                  },
                  child: Container(
                    height: 50,
                    color: Colors.amber[colorCodes[index]],
                    child: Center(child: Text('${_menu[index].title}')),
                  ),
                );
              })
          : CircularProgressIndicator(),
    );
  }
}
