import 'package:firebase_database/firebase_database.dart';
import 'package:gastor/models/gastor.dart';
import 'package:rxdart/rxdart.dart';

class GastorBloc {
  final DatabaseReference _database = FirebaseDatabase.instance.reference();

  final _subject = BehaviorSubject<List<Gastor>>();
  Stream<List<Gastor>> get gastor => _subject.stream;

  GastorBloc() {
    getGastor();
  }

  Future addGastor(ammount, currency) async {
    _database.child('gastor').push().set({
      'ammount': ammount,
      'currency': currency,
    });
  }

  Future getGastor() async {
    _database.child('gastor').once().then((snapshot) {
      List<Gastor> list = [];
      snapshot.value.forEach((key, value) => list.add(Gastor.fromJson(value)));
      _subject.sink.add(list);
    });
  }

  dispose() {
    _subject.close();
    this.dispose();
  }
}
