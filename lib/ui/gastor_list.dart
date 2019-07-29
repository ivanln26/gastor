import 'package:flutter/material.dart';
import 'package:gastor/blocs/gastor_bloc.dart';
import 'package:gastor/models/gastor.dart';
import 'package:gastor/providers/gastor_provider.dart';
import 'package:gastor/ui/gastor_detail_page.dart';

class GastorList extends StatefulWidget {
  @override
  _GastorListState createState() => _GastorListState();
}

class _GastorListState extends State<GastorList> {
  Widget _buildList(List<Gastor> list) {
    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: list.length,
      padding: EdgeInsets.only(left: 10, top: 2, right: 10),
      itemBuilder: (BuildContext context, int index) {
        Gastor gastor = list[index];

        return GestureDetector(
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Text('${gastor.ammount} - ${gastor.currency}'),
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => GastorDetailPage(gastor: gastor),
              ),
            );
          },
        );
      },
    );
  }

  Widget _listStreamBuilder(GastorBloc gastorBloc) {
    return StreamBuilder(
      stream: gastorBloc.gastor,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? _buildList(snapshot.data)
            : Center(
                child: Text('Actualmente no cuenta con ningún gasto'),
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
        stream: gastorBloc.isLoading,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          return (snapshot.hasData && snapshot.data)
              ? Center(child: CircularProgressIndicator())
              : _listStreamBuilder(gastorBloc);
        },
      ),
    );
  }
}
