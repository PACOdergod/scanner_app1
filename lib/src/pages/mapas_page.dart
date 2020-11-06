import 'package:flutter/material.dart';
import 'package:scanner_app1/src/bloc/scans_bloc.dart';
import 'package:scanner_app1/src/models/scan_model.dart';
import 'package:scanner_app1/src/utils/utils.dart';

class MapasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final scansBloc = new ScansBloc();

    return StreamBuilder<List<ScanModel>>(
      stream: scansBloc.scansStream,
      builder: (BuildContext context, AsyncSnapshot<List<ScanModel>> snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        final scans = snapshot.data;

        if (scans.length == 0) {
          return Center(
            child: Text('No hay informacion'),
          );
        }
        return ListView.builder(
          itemBuilder: (context, index) => Dismissible(
            key: UniqueKey(),
            background: Container(
              color: Colors.red[200],
            ),
            onDismissed: (direccion) => scansBloc.borrarScan(scans[index].id),
            child: ListTile(
              leading: Icon(Icons.cloud),
              title: Text(scans[index].valor),
              subtitle: Text(scans[index].id.toString()),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () => abrirScan(context, scans[index]),
            ),
          ),
          itemCount: scans.length,
        );
      },
    );
  }
}
