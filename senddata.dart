import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:provider/provider.dart';

class FirestoreProvider {
Future<void> sendData() {
    return Firestore.instance
        .collection('posts')
        .document()
        .setData
        //({'email': 'testing@test.com', 'author': ['author','thread']});
        ({'id': 'm1',
    'categories': [
      'c1',
      'c2',
    ],
    'title': 'Spaghetti with Tomato Sauce',
    
    'imageUrl':
        'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg',
    
    'ingredients': [
      '4 Tomatoes',
      '1 Tablespoon of Olive Oil',
      '1 Onion',
      '250g Spaghetti',
      'Spices',
      'Cheese (optional)'
    ],
    'steps': [
      'Cut the tomatoes and the onion into small pieces.',
      'Boil some water - add salt to it once it boils.',
      'Put the spaghetti into the boiling water - they should be done in about 10 to 12 minutes.',
      'In the meantime, heaten up some olive oil and add the cut onion.',
      'After 2 minutes, add the tomato pieces, salt, pepper and your other spices.',
      'The sauce will be done once the spaghetti are.',
      'Feel free to add some cheese on top of the finished dish.'
    ],
     });
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