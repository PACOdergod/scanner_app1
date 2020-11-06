import 'package:flutter/material.dart';
import 'package:scanner_app1/src/pages/despliegue_mapa_page.dart';
import 'package:scanner_app1/src/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scanner',
      initialRoute: '/home',
      routes: {
        '/home': (BuildContext context) => HomePage(),
        'mapa': (BuildContext context) => DespliegueMapaPage(),
      },
      theme: ThemeData(primaryColor: Colors.greenAccent[400]),
    );
  }
}
