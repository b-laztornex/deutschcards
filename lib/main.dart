import 'package:flutter/material.dart';
import 'package:german_card/db/database_utils.dart';
import 'package:german_card/ui/screens/home/index.dart';
import 'package:german_card/ui/screens/level/index.dart';
import 'package:german_card/ui/screens/selection/index.dart';
import 'package:german_card/ui/screens/write/index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseUtils().initDatabase();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      onGenerateRoute: (RouteSettings settings) {
        print('build route for ${settings.name}');
        var routes = <String, WidgetBuilder>{
          '/': (context) => HomePage(),
          '/selection': (context) => Selection(),
          '/level': (context) => Level(),
          '/write': (context) => Write(verbs: settings.arguments),
        };
        WidgetBuilder builder = routes[settings.name];
        return MaterialPageRoute(builder: (context) => builder(context));
      },
    );
  }
}
