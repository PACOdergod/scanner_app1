import 'dart:async';

import 'package:scanner_app1/src/models/scan_model.dart';

class ScansBloc {
  static final ScansBloc _singleton = new ScansBloc._();

  factory ScansBloc() {
    return _singleton;
  }

  ScansBloc._() {
    //Obtener Scans de la base de datos
  }

  final _scansStream = StreamController<List<ScanModel>>.broadcast();

  Stream<List<ScanModel>> get scansStream => _scansStream.stream;

  dispose() {
    _scansStream?.close();
  }
}
