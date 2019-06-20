import 'package:flutter/material.dart';
import 'package:gastor/blocs/gastor_bloc.dart';
import 'package:gastor/providers/gastor_provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    GastorBloc gastorBloc = GastorProvider.of(context).gastorBloc;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StreamBuilder(
              stream: gastorBloc.gastor,
              builder: (context, snapshot) {
                return snapshot.hasData
                    ? Text(snapshot.data.toString())
                    : Center(child: CircularProgressIndicator());
              },
            ),
          ],
        ),
      ),
    );
  }
}
