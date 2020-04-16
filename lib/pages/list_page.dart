import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ListPage extends StatelessWidget {
  //const ListPage({Key key}) : super(key: key);


final DocumentSnapshot document;

 ListPage(this.document);

 //final List ingredients =
//    List<String>.from(document['ingredient']
 //?? []
//);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body:  StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance
        .collection('posts')
        .document(document.documentID)
        .collection('ingredient')
        .snapshots() ,
        
        
        

        builder: (context, snapshot) {
          

          if (!snapshot.hasData) {
            return Center(
              child: Text('로딩중'),
            );
          }

          return 
          ListView(
            children: snapshot.data.documents.map((doc) {
              return ListTile(
               leading:  Text(document['ingredient'])
                //title: Text(doc['comment']),
              );
            }).toList(),
        //    Text(document['ingredient']);
          );
        }
      ));
  
  }
  
  
 // Stream<QuerySnapshot> _commentStream() {
 //   return Firestore.instance
 //       .collection('posts')
 //       .document(document.documentID)
 //       .collection('ingredient')
 //       .snapshots();
  }
//}

   