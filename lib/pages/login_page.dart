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
   List<dynamic> getItem;
   LoginPage(this.document );
  
  @override
  _LoginPageState createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {
 //     List<String> getItem = List.from(widget.document['ingredient'] ?? []);    
  @override
  Widget build(BuildContext context) {
    List<String> getItem = List.from(widget.document['ingredient'] ?? []); 
    
  final screenWidth = MediaQuery.of(context).size.width;
     return StreamBuilder<DocumentSnapshot>(
    stream: Firestore.instance.collection('posts').document('documentID').snapshots(),
     
   builder: (BuildContext context,
             AsyncSnapshot<DocumentSnapshot> snapshot) {
return ListView(
      children: getItem.map
      ((data) => 

//      buildBulletWidget(snapshot.data, screenWidth)).toList(),
//    );
  
 //            });}


   //  buildBulletWidget(DocumentSnapshot document, double screenWidth) {
   // return 
    Container(
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Container(
            height: 8.0,
            width: 8.0,
           decoration: BoxDecoration(
              color: Color(0xFF25BEBD),
              borderRadius: BorderRadius.circular(4.0)
            ),
          ),
          SizedBox(width: 10.0),
          Container(
           // width: screenWidth - 60 ,
            child: Material(child: Text(data,
            style: TextStyle(
                        fontFamily: 'Cute',
                       // fontWeight: FontWeight.w400,
                        fontSize: 30.0,
                        color: Colors.black
                      ) // color: Color(0xFFBBBBBB)),
                      ),)
          )
          
        ],
      ),
    )
  
  ).toList(),
  
   
  );
  }
  );}}


//new ListView(children: createChildren(snapshot));
//    },
//  );
//}


//return 
//    ListView( children: 
//     snapshot.data.documents['index']
//    .map((document) => new Text(document))).toList()}}
  
    
  
