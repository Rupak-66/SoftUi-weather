import 'package:flutter/material.dart';
import 'Concave_shadow.dart';
import 'package:analog_clock/analog_clock.dart';
import 'normalModeRefactored.dart';
import 'darkTest.dart';
import 'package:provider/provider.dart';
import 'modeProvider.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ModeProvider()),
        ],
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeTheme(),
    );
  }
}

class HomeTheme extends StatefulWidget {
  @override
  _HomeThemeState createState() => _HomeThemeState();
}

class _HomeThemeState extends State<HomeTheme> {
  @override
  Widget build(BuildContext context) {
    return Provider.of<ModeProvider>(context).darkMode
        ? DarkModeFinal()
        : MyHomePage();
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final color = const Color(0xb6bfd2);
  var shade7002 = Colors.blue[700];
  var bodyColor = Colors.grey[200];
  var grey100 = Colors.grey[100];
  var grey400 = Colors.grey[400];
  var grey500 = Colors.grey[500];
  var bosShadowRight = Colors.grey[600];
  var shadowLeft = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SizedBox(
            height: 30.0,
          ),
          Center(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    'PERIOD',
                    style: TextStyle(color: Colors.grey.shade500),
                  ),
                  Text(
                    'LAST 30 DAYS',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    child: Icon(Icons.navigate_next),
                    width: 40,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      shape: BoxShape.rectangle,
                      color: bodyColor,
                      boxShadow: getShadow(),
                    ),
                  )
                ],
              ),
              height: 50.0,
              width: MediaQuery.of(context).size.width / 1.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                shape: BoxShape.rectangle,
                color: bodyColor,
                boxShadow: getShadow(),
              ),
            ),
          ),
          Stack(
            children: <Widget>[
              Center(
                child: Container(
                  child: AnalogClock(
                    showNumbers: false,
                    tickColor: shade7002,
                    hourHandColor: shade7002,
                    minuteHandColor: shade7002,
                    secondHandColor: shade7002,
                    datetime: DateTime.now(),
                    isLive: true,
                    width: 250,
                    height: 250,
                  ),
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                    color: grey100,
                    shape: BoxShape.circle,
                    boxShadow: getShadow(),
                  ),
                ),
              ),
              Positioned(
                top: 50,
                left: MediaQuery.of(context).size.width / 3.5,
                child: Center(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Icon(
                          Icons.flash_on,
                          size: 70.0,
                          color: shade7002,
                        ),
                        Text(
                          '7 C',
                          style: TextStyle(
                              color: shade7002, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    width: 150.0,
                    height: 150.0,
                    decoration: BoxDecoration(
                      color: bodyColor,
                      shape: BoxShape.circle,
                      boxShadow: getShadow(),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                child: Icon(
                  Icons.whatshot,
                  size: 60.0,
                  color: Colors.deepOrange,
                ),
                height: 150,
                width: MediaQuery.of(context).size.width / 3,
                decoration: BoxDecoration(
                    color: bodyColor,
                    shape: BoxShape.rectangle,
                    boxShadow: getShadow()),
              ),
              Container(
                child: GestureDetector(
                  onTap: () {
                    Provider.of<ModeProvider>(context).toggleMode();
                  },
                  child: Center(
                      child: Text(
                    'MODE',
                    style: TextStyle(color: shade7002, fontSize: 15),
                  )),
                ),
                height: 80,
                width: MediaQuery.of(context).size.width / 5.5,
                decoration: BoxDecoration(
                    color: bodyColor,
                    shape: BoxShape.circle,
                    boxShadow: getShadowGradient(),
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          grey100,
                          grey100,
                          grey400,
                          grey500,
                        ],
                        stops: [
                          0.1,
                          0.3,
                          0.8,
                          1
                        ])),
              ),
              Container(
                child: Icon(
                  Icons.ac_unit,
                  size: 60.0,
                  color: shade7002,
                ),
                height: 150,
                width: MediaQuery.of(context).size.width / 3,
                decoration: BoxDecoration(
                    color: bodyColor,
                    shape: BoxShape.rectangle,
                    boxShadow: getShadow()),
              )
            ],
          ),
          Center(
            child: Container(
              child: Center(
                child: Text(
                  'UPDATE SETTINGS',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: shade7002),
                ),
              ),
              height: 50.0,
              width: MediaQuery.of(context).size.width / 1.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                shape: BoxShape.rectangle,
                color: bodyColor,
                boxShadow: getShadow(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  dynamic getDecoration() {
    BoxDecoration(
        color: grey100,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: getShadow());
  }

  dynamic getShadow() {
    return [
      BoxShadow(
          color: bosShadowRight,
          offset: Offset(4.0, 4.0),
          blurRadius: 15.0,
          spreadRadius: 4.0),
      BoxShadow(
          color: shadowLeft,
          offset: Offset(-4.0, -4.0),
          blurRadius: 5.0,
          spreadRadius: 4),
    ];
  }

  dynamic getShadowGradient() {
    return [
      BoxShadow(
          color: bosShadowRight,
          offset: Offset(4.0, 4.0),
          blurRadius: 15.0,
          spreadRadius: 1.0),
      BoxShadow(
          color: Colors.white,
          offset: Offset(-4.0, -4.0),
          blurRadius: 15.0,
          spreadRadius: 1.0),
    ];
  }
}
