import 'package:flutter/material.dart';
//import 'package:carousel_slider/carousel_slider.dart';
import 'package:recipe_app/widgets/carouse_with_indicator.dart';
import 'package:recipe_app/widgets/animated_text.dart';
//import 'package:recipe_app/firebase/firestore_provider.dart';
//import 'package:recipe_app/widgets/pro_carouse.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState(); }


class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
AnimationController _animationController;
bool _sideMoved = false;
Size _size;
double sideWidth;
int _sideDuration = 300;

@override 
void initState() {
  _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: _sideDuration));
super.initState();
}

@override
void dispose() {
  super.dispose();
}


@override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    sideWidth = _size.width / 2;
    return Scaffold(
      
      body: 
      
         
       Stack(
        
        children: <Widget>[
          _sideScreen(),
          _homeScreen(),
          
        ],
      ),



      
    /*  floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
             _sideMoved = !_sideMoved ;
            });
          }) */
        );
      
  }
  
      
   Widget _sideScreen() {
     return AnimatedContainer(
       width : sideWidth,
       curve: Curves.easeIn,
       color:Colors.white,
       
       duration: Duration(milliseconds: _sideDuration),
       transform : Matrix4.translationValues (
       _sideMoved ? 0  : - sideWidth, 
       _sideMoved ? 0  : - 50, 
       0, 
      ),
     
      child: SafeArea(
        child: SizedBox(
          width: sideWidth,
          
        child: Column(
          
        children: <Widget>[
          
          Row(
            children: <Widget>[
              SizedBox( height: 20),
              SizedBox( height: 20),
              /* IconButton(icon: Icon(Icons.arrow_back_ios),
              iconSize: 36,
              color: Colors.black54,
              onPressed : () {
              setState (() {
                _sideMoved = !_sideMoved;
              });
              },
            
              ) */
            ],
            ),
            
            SizedBox(

              child: Text('추천 레시피',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black87, fontSize: 40, fontWeight: FontWeight.bold
               ), 
        )   
           ),
           
           SizedBox(
              child: Text('인기 레시피',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black87, fontSize: 40, fontWeight: FontWeight.bold
               ),
             
             ),  
            
           ),
           SizedBox(
              child: Text('문의하기',
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.black87, fontSize: 40, fontWeight: FontWeight.bold
               ), 
        )   
           ),
           Expanded(
             child: Image.network('https://images.unsplash.com/photo-1506458961255-571f40df5aad?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60)' ,fit: BoxFit.cover)
           )
           ],
        
        )
      )
     )
     );
     
   } 

   Widget _homeScreen() {
     return AnimatedContainer(
       
       curve: Curves.easeIn,
       color:  _sideMoved ?  Colors.red[200]: Colors.white,
       duration: Duration(milliseconds: _sideDuration),
       transform : Matrix4.translationValues (
       _sideMoved ?   sideWidth : 0, 
       0 ,  
      0, 
      ),
      child: SafeArea (
         
        child: Stack (
          children: <Widget>[ 
        Container (
          height: 430.0,
          decoration: BoxDecoration(
            borderRadius:
            BorderRadius.only(bottomLeft: Radius.circular(50.0)),
            color: 
            //Color(0xFFFE8A7E)
            //Color(0xFFFD7465)
             Colors.red[50],
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
          height: 140.0,
          decoration: BoxDecoration(
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
            children: <Widget>[
              
               IconButton(
                 icon: AnimatedIcon(
                    icon: AnimatedIcons.menu_close,
                    progress: _animationController,
                    size: 26,
                    color: Colors.white,

                 //semanticLabel: 'Show menu',
                 //iconSize: 36,
                 //color: Colors.black87,
                 ),
                 
              //iconSize: 36,
             // color: Colors.black87,
              onPressed : () {
                _sideMoved ? _animationController.reverse() : _animationController.forward();
              setState (() {
                _sideMoved = !_sideMoved;
              });
              },
            
              ),
              
              
            ],
            ),
            SizedBox(
               height: 20
            ),
            AnimatedText(),
            SizedBox(
               height: 55
            ),
            CarouseWithIndicator(),
          // CarouselPage()

           /* IconButton(
                 icon: AnimatedIcon(
                    icon: AnimatedIcons.menu_close,
                    progress: _animationController,
                    size: 26,
                    color: Colors.black87,

                 //semanticLabel: 'Show menu',
                 //iconSize: 36,
                 //color: Colors.black87,
                 ),
                 
              //iconSize: 36,
             // color: Colors.black87,
              onPressed : () {
                firestoreProvider.sendData().then(_) {
                  print('a');
                };
              }
            ) */
            ]
       
        ),
        ])
        
     ),);
    
   } 
   }