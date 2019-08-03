import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:gastor/models/gastor.dart';
import 'package:rxdart/rxdart.dart';

class GastorBloc {
  final DatabaseReference _database = FirebaseDatabase.instance.reference();

  final _subject = BehaviorSubject<List<Gastor>>();

  final _isLoadingSubject = BehaviorSubject<bool>();

  Stream<List<Gastor>> get gastor => _subject.stream;

  Stream<bool> get isLoading => _isLoadingSubject.stream;

  GastorBloc() {
    _isLoadingSubject.add(true);
    getGastor();
  }

  Future addGastor(ammount, currency) async {
    await _database.child('gastor').push().set({
      'ammount': ammount,
      'currency': currency,
    });
    getGastor();
  }

  Future deleteGastor(String key) async {
    await _database.child('gastor').child(key).remove();
    getGastor();
  }

  Future getGastor() async {
    _isLoadingSubject.add(true);
    _database.child('gastor').once().then((DataSnapshot snapshot) {
      if (snapshot.value != null) {
        List<Gastor> list = [];
        snapshot.value
            .forEach((key, value) => list.add(Gastor.fromJson(key, value)));
        _subject.sink.add(list);
      } else {
        _subject.sink.addError('Actualmente no cuenta con ningún gasto');
      }
      Timer(
        const Duration(milliseconds: 500),
        () => _isLoadingSubject.add(false),
      );
    });
  }

  dispose() {
    _subject.close();
    _isLoadingSubject.close();
    this.dispose();
  }
}
