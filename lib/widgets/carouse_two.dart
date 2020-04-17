/*import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CarouseTwo extends StatefulWidget {
  CarouseTwo({Key key}) : super(key: key);

  @override
  _CarouseTwoState createState() => _CarouseTwoState();
}

class _CarouseTwoState extends State<CarouseTwo> {
  
  // int _current = 0;
  @override

  Widget build(BuildContext context) {

     

    return Scaffold(
      body: StreamBuilder(
      stream: Firestore.instance.collection('posts').document('carousel').snapshots(),
      builder:(context, snapshot, List<DocumentSnapshot>){
return
CarouselSlider(
  height: 400.0,
  items: //[1,2,3,4,5]
  List<DocumentSnapshot>.map((i) {
    return Builder(
      builder: (BuildContext context) {
        return Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.amber
          ),
          child: Text('text $i', style: TextStyle(fontSize: 16.0),)
        );
      },
    );
  }).toList(),
);}));}}


class Record {
 final String carousel;

 final DocumentReference reference;

 Record.fromMap(Map<String, dynamic> map, {this.reference})

 carousel = map['carousel'],

 Record.fromSnapshot(DocumentSnapshot snapshot)
     : this.fromMap(snapshot.data, reference: snapshot.reference);
}
*/