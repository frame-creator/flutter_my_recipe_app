import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.yellow,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState(); }


class _MyHomePageState extends State<MyHomePage> {

bool _sideMoved = false;
Size _size;
double sideWidth;
int _sideDuration = 2;

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



      
    
        );
      
  }
  
      
   Widget _sideScreen() {
     return AnimatedContainer(
       width : sideWidth,
       curve: Curves.easeIn,
       color:Colors.white,
       
       duration: Duration(seconds: _sideDuration),
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
              SizedBox( height: 5,),
              IconButton(icon: Icon(Icons.arrow_back_ios),
              iconSize: 36,
              color: Colors.black54,
              onPressed : () {
              setState (() {
                _sideMoved = !_sideMoved;
              });
              },
            
              )
            ],
            ),
            
            SizedBox(

              child: Text('추천 레시피',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black87, fontSize: 25, fontWeight: FontWeight.bold
               ), 
        )   
           ),
           
           SizedBox(
              child: Text('인기 레시피',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black87, fontSize: 25, fontWeight: FontWeight.bold
               ),
             
             ),  
            
           ),
           SizedBox(
              child: Text('문의하기',
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.black87, fontSize: 25, fontWeight: FontWeight.bold
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
       color:  _sideMoved ?  Colors.yellowAccent[100]: Colors.white,
       duration: Duration(seconds: _sideDuration),
       transform : Matrix4.translationValues (
       _sideMoved ?   sideWidth : 0, 
       0 ,  
      0, 
      ),
      child: SafeArea (
        child:  Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              
               IconButton(icon: Icon(Icons.menu),
              iconSize: 50,
              color: Colors.black87,
              onPressed : () {
              setState (() {
                _sideMoved = !_sideMoved;
              });
              },
            
              ),
              
              
            ],
            ),
        ],
        )
     ),
     );
   } 
   }

      
      
