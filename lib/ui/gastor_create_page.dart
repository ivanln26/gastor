import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gastor/blocs/gastor_bloc.dart';
import 'package:gastor/providers/gastor_provider.dart';

class GastorCreatePage extends StatefulWidget {
  @override
  _GastorCreatePageState createState() => _GastorCreatePageState();
}

class _GastorCreatePageState extends State<GastorCreatePage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _ammountController = TextEditingController();
  String _currencyValue = 'ARS';

  @override
  Widget build(BuildContext context) {
    GastorBloc gastorBloc = GastorProvider.of(context).gastorBloc;

    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: TextField(
                  controller: _ammountController,
                  decoration: InputDecoration(labelText: 'Ammount'),
                ),
                width: 220,
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: DropdownButton<String>(
                  value: _currencyValue,
                  onChanged: (String newValue) {
                    setState(() {
                      _currencyValue = newValue;
                    });
                  },
                  items: <String>[
                    'ARS',
                    'USD',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              IconButton(
                icon: Icon(Icons.arrow_forward),
                onPressed: () {
                  var ammount = _ammountController.text;
                  var currency = _currencyValue;
                  gastorBloc.addGastor(ammount, currency).then((_) => Navigator.of(context).pop());
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
