import 'package:flutter/material.dart';
import 'package:gastor/blocs/gastor_bloc.dart';
import 'package:gastor/models/gastor.dart';
import 'package:gastor/providers/gastor_provider.dart';

class GastorDetailPage extends StatefulWidget {
  final Gastor gastor;

  GastorDetailPage({this.gastor});

  @override
  _GastorDetailPageState createState() => _GastorDetailPageState();
}

class _GastorDetailPageState extends State<GastorDetailPage> {
  bool goBack = false;

  Future _showDialog(GastorBloc gastorBloc) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Borrar este gasto?'),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('Borrar'),
              onPressed: () {
                gastorBloc.deleteGastor(widget.gastor.id).then((_) {
                  Navigator.of(context).pop();
                  setState(() => goBack = true);
                });
              },
            ),
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    GastorBloc gastorBloc = GastorProvider.of(context).gastorBloc;

    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Page'),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              _showDialog(gastorBloc).then((_) {
                if (goBack) {
                  Navigator.of(context).pop();
                }
              });
            },
          )
        ],
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(widget.gastor.ammount.toString()),
            Text(widget.gastor.currency),
          ],
        ),
      ),
    );
  }
}
