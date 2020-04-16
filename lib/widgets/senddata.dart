import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class FirestoreProvider {
Future<void> sendData() {
    return Firestore.instance
        .collection('userses')
        .document()
        .setData({'email': 'testing@test.com', 'author': ['author','thread']});
  }

  void getData() {
    Firestore.instance
        .collection('users')
        .document('123123123')
        .get()
        .then((DocumentSnapshot ds) {
      print(ds.data);
    });
  }

}

FirestoreProvider firestoreProvider = FirestoreProvider();