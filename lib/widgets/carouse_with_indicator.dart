import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1506368249639-73a05d6f6488?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',

  'https://images.unsplash.com/photo-1556909211-36987daf7b4d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1543362906-acfc16c67564?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1400&q=60',
  'https://images.unsplash.com/photo-1583224964978-2257b960c3d3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1564834724105-918b73d1b9e0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1400&q=60',
  'https://images.unsplash.com/photo-1558538337-aab544368de8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60'
  
  //'https://images.unsplash.com/photo-1524240293321-31b1b9a207af?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
];

//final Widget placeholder = Container(color: Colors.red[50]);

final List child = map<Widget>(
  imgList,
  (index, i) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: Stack(children: <Widget>[
          Image.network(i, fit: BoxFit.cover, width: 500),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
             // decoration: BoxDecoration(
             //   gradient: LinearGradient(
             //     colors: [Color.fromARGB(200, 0, 0, 0), Color.fromARGB(0, 0, 0, 0)],
             //     begin: Alignment.bottomCenter,
             //     end: Alignment.topCenter,
             //   ),
             // ),
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                '',
                //'You are what you eat',
                //'No. $index image',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40.0,
                  //fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  },
).toList();

List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }

  return result;
}

class CarouseWithIndicator extends StatefulWidget {
  CarouseWithIndicator({Key key}) : super(key: key);

  @override
  _CarouseWithIndicatorState createState() => _CarouseWithIndicatorState();
}

class _CarouseWithIndicatorState extends State<CarouseWithIndicator> {
  
   int _current = 0;
  @override

  Widget build(BuildContext context) {

     

    return 
     
      Column(children: [
      CarouselSlider(
        items: child,
        autoPlay: true,
        enlargeCenterPage: true,
        aspectRatio: 2,
        onPageChanged: (index) {
          setState(() {
            _current = index;
          });
        },
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: map<Widget>(
          imgList,
          (index, url) {
            return Container(
              width: 8.0,
              height: 8.0,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == index
                      ? Colors.red[400]
                      //fromRGBO(0, 0, 0, 0.9)
                      : Colors.red[200]
                      //fromRGBO(0, 0, 0, 0.4)),
            ),);
          },
        ),
      ),
    ]);
  }
  Widget getContent(BuildContext context) {
 return StreamBuilder<QuerySnapshot>(
  stream: Firestore.instance.collection('carousel').snapshots(),
 builder: (context, snap) {
//just add this line
if(snap.data == null) return Text('로딩중');
return CarouselSlider(
enlargeCenterPage: true,
height: MediaQuery.of(context).size.height,
items: getItems(context, snap.data.documents),
);
},
);
}
List<Widget> getItems(BuildContext context, List<DocumentSnapshot>
docs){
return docs.map(
(doc) {
String content = doc.data['img'];
return Text('img');
}
).toList();
}
}
