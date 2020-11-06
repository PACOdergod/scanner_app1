import 'dart:async';

import 'package:scanner_app1/src/models/scan_model.dart';
import 'package:scanner_app1/src/providers/db_provider.dart';

class ScansBloc {
  static final ScansBloc _singleton = new ScansBloc._();

  factory ScansBloc() {
    return _singleton;
  }

  ScansBloc._() {
    obtenerScans();
  }

  final _scansStream = StreamController<List<ScanModel>>.broadcast();

  Stream<List<ScanModel>> get scansStream => _scansStream.stream;

  dispose() {
    _scansStream?.close();
  }

  obtenerScans() async {
    _scansStream.sink.add(await DBProvider.db.getTodosScans());
  }

  agregarScan(ScanModel scan) async {
    await DBProvider.db.nuevoScan(scan);
    obtenerScans();
  }

  borrarScan(int id) async {
    await DBProvider.db.deleteScan(id);
    obtenerScans();
  }

  borrarTodos() async {
    await DBProvider.db.deleteAll();
    _scansStream.sink.add([]);
  }
}
