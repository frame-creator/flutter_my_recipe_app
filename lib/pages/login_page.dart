import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:recipe_app/widgets/carouse_two.dart';
//import 'package:carousel_slider/carousel_slider.dart';


/*
class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {
  List<String> getItem = List.from(DocumentSnapshot['ingredient'] ?? []) ;
  @override
  Widget build(BuildContext context) {
    return 
   // Widget getContent(BuildContext context) {
 //return 
 StreamBuilder<QuerySnapshot>(
  stream: Firestore.instance.collection('carousel').snapshots(),
  
 builder: (context, snap) {
//just add this line


if(snap.data == null) return Text('로딩중');
return CarouselSlider(
enlargeCenterPage: true,
height: MediaQuery.of(context).size.height,
items: getItems(context, snap.data.documents),
);}
 );
}}

//List<String> getItem = List.from(document['img'])

  List<Widget> getItems(BuildContext context, List<DocumentSnapshot>
docs){
return docs.map(
(doc) {
String content = doc.data['img'];
return Text('img');
}
).toList();


    //CarouseTwo();
  */



class LoginPage extends StatefulWidget {
 // LoginPage({Key key}) : super(key: key);
  
   final DocumentSnapshot document;

   LoginPage(this.document);
  
  @override
  _LoginPageState createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {
 //     List<String> getItem = List.from(widget.document['ingredient'] ?? []);    
  @override
  Widget build(BuildContext context) {
    List<String> getItem = List.from(widget.document['ingredient'] ?? []); 
     return StreamBuilder<DocumentSnapshot>(
    stream: Firestore.instance.collection('posts').document('documentID').snapshots(),
     
   builder: (BuildContext context, 
             AsyncSnapshot<DocumentSnapshot> snapshot) {
return ListView(
      children: getItem.map((doc) => Text(doc)).toList(),
    );
  });}
  
}

//new ListView(children: createChildren(snapshot));
//    },
//  );
//}


//return 
//    ListView( children: 
//     snapshot.data.documents['index']
//    .map((document) => new Text(document))).toList()}}
  
    
  
