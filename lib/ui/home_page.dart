import 'package:flutter/material.dart';
import 'package:gastor/ui/gastor_create_page.dart';
import 'package:gastor/ui/gastor_list.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _showModalSheet() {
    showModalBottomSheet(
      context: context,
      builder: (builder) {
        return Container(
          height: 100,
          child: Center(
            child: Text('Form'),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Colors.black,
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: Theme.of(context).primaryColor,
            tabs: [
              Tab(icon: Icon(Icons.home)),
              Tab(icon: Icon(Icons.list)),
              Tab(icon: Icon(Icons.person)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            GastorCreatePage(),
            GastorList(),
            Center(child: Text('User')),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Colors.white,
          icon: Icon(Icons.add),
          label: Text('New Gastor'),
          onPressed: _showModalSheet,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomSheet: Container(
          color: Colors.black,
          height: 50,
        ),
      ),
    );
  }
}
