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
  Widget _buildHome(GastorBloc gastorBloc) {
    return Center(
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
    );
  }

  @override
  Widget build(BuildContext context) {
    GastorBloc gastorBloc = GastorProvider.of(context).gastorBloc;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home)),
              Tab(icon: Icon(Icons.list)),
              Tab(icon: Icon(Icons.person)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildHome(gastorBloc),
            Center(child: Text('Gastor list')),
            Center(child: Text('User')),
          ],
        ),
      ),
    );
  }
}
