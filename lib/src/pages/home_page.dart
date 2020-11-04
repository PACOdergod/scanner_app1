import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';

import 'package:scanner_app1/src/pages/direcciones_page.dart';
import 'package:scanner_app1/src/pages/mapas_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scanner'),
        actions: [
          IconButton(icon: Icon(Icons.delete_forever), onPressed: null)
        ],
      ),
      body: _cargarPagina(_currentIndex),
      bottomNavigationBar: _crearBotNav(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.filter_center_focus),
        onPressed: _scanQR,
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }

  _scanQR() async {
    //https://codigofacilito.com
    //geo:19.4798571,-99.1557307,500

    var result;

    try {
      result = await BarcodeScanner.scan();
    } catch (e) {
      result = e.toString();
    }

    print(result.rawContent);
  }

  Widget _cargarPagina(int paginaActual) {
    switch (paginaActual) {
      case 0:
        return MapasPage();
      case 1:
        return DireccionesPage();

      default:
        return HomePage();
    }
  }

  Widget _crearBotNav() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Mapas'),
        BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: 'Dire'),
      ],
    );
  }
}
