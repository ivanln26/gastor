import 'package:flutter/material.dart';
import 'package:gastor/blocs/gastor_bloc.dart';
import 'package:gastor/providers/gastor_provider.dart';
import 'package:gastor/ui/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gastor',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GastorProvider(
        gastorBloc: GastorBloc(),
        child: HomePage(title: 'Gastor'),
      ),
    );
  }
}
