import 'package:firebase_database/firebase_database.dart';
import 'package:gastor/models/gastor.dart';
import 'package:rxdart/rxdart.dart';

class GastorBloc {
  final _subject = BehaviorSubject<List<Gastor>>();
  Stream<List<Gastor>> get gastor => _subject.stream;

  GastorBloc() {
    getGastor();
  }

  Future getGastor() async {
    final DatabaseReference database = FirebaseDatabase.instance.reference();

    database.child('gastor').once().then((snapshot) {
      List<Gastor> list = [];
      snapshot.value.forEach((json) => list.add(Gastor.fromJson(json)));
      _subject.sink.add(list);
    });
  }

  dispose() {
    _subject.close();
    this.dispose();
  }
}
