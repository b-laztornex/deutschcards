import 'package:flutter/material.dart';
import 'package:german_card/config/constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key key,
    this.color = const Color(0xFF2DBD3A),
    this.child,
  }) : super(key: key);

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the Selection object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Home"),
      ),
      body: GridView.count(
        // Create a grid with 2 columns. If you change the scrollDirection to
        // horizontal, this produces 2 rows.
        crossAxisCount: 3,
        // Generate 100 widgets that display their index in the List.
        children: AppConstants()
            .levels
            .map((lvl) => GestureDetector(
                onTap: () {
                  // Navigate to the second screen using a named route.

                  Navigator.pushNamed(context, '/level');
                },
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Container(
                    color: Colors.lightBlueAccent,
                    child: Center(
                      child: Text(
                        '$lvl',
                      ),
                    ),
                  ),
                )))
            .toList(),
      ),
    );
  }
}
