import 'package:flutter/material.dart';
import 'package:gastor/models/gastor.dart';

class GastorDetailPage extends StatefulWidget {
  final Gastor gastor;

  GastorDetailPage({this.gastor});

  @override
  _GastorDetailPageState createState() => _GastorDetailPageState();
}

class _GastorDetailPageState extends State<GastorDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Page'),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              print('hola');
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
