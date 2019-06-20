import 'package:firebase_database/firebase_database.dart';
import 'package:rxdart/rxdart.dart';

class GastorBloc {
  final _subject = BehaviorSubject();
  Stream get gastor => _subject.stream;

  GastorBloc() {
    _getGastor();
  }

  Future<Null> _getGastor() async {
    final DatabaseReference database = FirebaseDatabase.instance.reference();
    
    database.child('gastor').once().then((snapshot) {
      print(snapshot.value);
      _subject.sink.add(snapshot.value);
    });
  }

  dispose() {
    _subject.close();
    this.dispose();
  }
}
