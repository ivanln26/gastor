import 'package:flutter/material.dart';
import 'package:gastor/blocs/gastor_bloc.dart';
import 'package:gastor/providers/gastor_provider.dart';
import 'package:gastor/ui/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GastorProvider(
      gastorBloc: GastorBloc(),
      child: MaterialApp(
        title: 'Gastor',
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.deepOrange,
          primarySwatch: Colors.red,
        ),
        home: HomePage(title: 'Gastor'),
      ),
    );
  }
}
