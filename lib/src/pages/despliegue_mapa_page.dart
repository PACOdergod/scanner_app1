import 'package:flutter/material.dart';
import 'package:scanner_app1/src/models/scan_model.dart';

class DespliegueMapaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ScanModel scan = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('coordenadas'),
        actions: [IconButton(icon: Icon(Icons.my_location), onPressed: null)],
      ),
      body: Center(child: Text(scan.valor)),
    );
  }
}
