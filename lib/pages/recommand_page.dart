import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class RecommandPage extends StatefulWidget {
  RecommandPage({Key key}) : super(key: key);

  @override
  _RecommandPageState createState() => _RecommandPageState();
}

class _RecommandPageState extends State<RecommandPage> {
  @override
  Widget build(BuildContext context) {
    return 
  
ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[ 
         
        Stack (
          children: <Widget>[ 
         

        Container (
          height: 430.0,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.white, Colors.red[200]]),
            borderRadius:
            BorderRadius.only(bottomLeft: Radius.circular(50.0)),
            color: 
            //Color(0xFFFE8A7E)
            //Color(0xFFFD7465)
             Colors.red[100],
          ))
        ,
          Container (
          height: 300.0,
          decoration: BoxDecoration(
            borderRadius:
            BorderRadius.only(bottomLeft: Radius.circular(75.0)),
            color: 
            //Color(0xFFFE8A7E)
            //Color(0xFFFD7465)
             Colors.white,
          )),
     /*   Container (
          height: 160.0,
          decoration: BoxDecoration(
            borderRadius:
            BorderRadius.only(bottomLeft: Radius.circular(75.0)),
            color: 
            Colors.pink[100]
            //Color(0xFFFE8A7E)
            //Color(0xFFFD7465)
            //Colors.red[50],
          )),
          */
        Container(
          height: 143.0,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Color(0xffFCE183), Color(0xffFF7375)]),
            borderRadius:
            BorderRadius.only(bottomLeft: Radius.circular(75.0)),
            color: 
            //Color(0xFFFE8A7E)
              Colors.red[200]
          ))
        ,
        
        Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              
              
              IconButton(
                onPressed: () {
                //  firestoreProvider.getData();
                  

                },
                icon: Icon(Icons.access_alarm),
                iconSize: 26,
                color: Colors.white,
              ),
              IconButton(
                onPressed: () {
              //    firestoreProvider.sendData().then((_) {
              //      print('sended');
              //    }
              //    );

                },
                icon: Icon(Icons.backup),
                iconSize: 26,
                color: Colors.white,
              ),
              
              
              
            ],
            ),
            SizedBox(
               height: 20
            ),
           // AnimatedText(),
            Text(
              ''
            ),
            //CarouseWithIndicator(),
            SizedBox(
               height: 95
            )
  
  ])])]);   

}
}