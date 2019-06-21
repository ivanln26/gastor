import 'package:flutter/material.dart';
import 'package:gastor/blocs/gastor_bloc.dart';
import 'package:gastor/models/gastor.dart';
import 'package:gastor/providers/gastor_provider.dart';

class GastorList extends StatefulWidget {
  @override
  _GastorListState createState() => _GastorListState();
}

class _GastorListState extends State<GastorList> {
  Widget _buildList(List<Gastor> list) {
    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        Gastor gastor = list[index];

        return Card(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Text('${gastor.ammount} - ${gastor.currency}'),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    GastorBloc gastorBloc = GastorProvider.of(context).gastorBloc;
    final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
        GlobalKey<RefreshIndicatorState>();

    return RefreshIndicator(
      key: _refreshIndicatorKey,
      onRefresh: gastorBloc.getGastor,
      child: StreamBuilder(
        stream: gastorBloc.gastor,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? _buildList(snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
