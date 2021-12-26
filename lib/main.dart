import './screens/tabs_screen.dart';

import './screens/meal_detail.dart';
import 'package:flutter/material.dart';

//import './screens/categories.dart';
import './screens/meals.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        //canvasColor: Color.fromARGB(225, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            headline1: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'RobotoCondensed',
            )),
      ),
      home: TabsScreen(),
      routes: {
        CategoriesMeal.routeName: (ctx) => CategoriesMeal(),
        MealDetails.routeName: (ctx) => MealDetails(),
      },
      //onGenerateRoute: (settings) {
      // print(settings.arguments);
      //return MaterialPageRoute(builder: (ctx) => Categories());
      // },
      // onUnknownRoute: (settings) {
      // return MaterialPageRoute(builder: (ctx) => Categories());
      // },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DeliMeals'),
      ),
      body: Center(
        child: Text('Navigation Time!'),
      ),
    );
  }
}
