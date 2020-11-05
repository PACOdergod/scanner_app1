import 'package:flutter/material.dart';
import 'package:scanner_app1/src/providers/db_provider.dart';

class MapasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ScanModel>>(
      future: DBProvider.db.getTodosScans(),
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
            onDismissed: (direccion) =>
                DBProvider.db.deleteScan(scans[index].id),
            child: ListTile(
              leading: Icon(Icons.cloud),
              title: Text(scans[index].valor),
              subtitle: Text(scans[index].id.toString()),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
          ),
          itemCount: scans.length,
        );
      },
    );
  }
}
