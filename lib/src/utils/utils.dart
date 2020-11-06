import 'package:flutter/material.dart';
import 'package:scanner_app1/src/models/scan_model.dart';
import 'package:url_launcher/url_launcher.dart';

abrirScan(BuildContext context, ScanModel scan) async {
  print(scan.tipo);
  if (scan.tipo == 'http') {
    if (await canLaunch(scan.valor)) {
      await launch(scan.valor);
    } else {
      throw 'Could not launch';
    }
  } else {
    Navigator.pushNamed(context, 'mapa', arguments: scan);
  }
}
