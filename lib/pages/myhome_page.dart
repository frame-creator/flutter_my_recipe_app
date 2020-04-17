

import 'package:flutter/material.dart';
//import 'package:carousel_slider/carousel_slider.dart';
import 'package:recipe_app/widgets/carouse_with_indicator.dart';
import 'package:recipe_app/widgets/animated_text.dart';
//mport 'package:recipe_app/firebase/firestore_provider.dart';
//import 'package:recipe_app/widgets/pro_carouse.dart';
//import 'package:recipe_app/widgets/horizon_part.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:recipe_app/pages/detail_page.dart';

import 'package:recipe_app/pages/mailer_page.dart';
import 'package:recipe_app/pages/recommand_page.dart';
import 'package:recipe_app/pages/month_page.dart';






//import 'package:recipe_app/widgets/senddata.dart';

import 'package:recipe_app/widgets/progressindicator.dart';



class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title,
  this.document, 
  }) : super(key: key);

  

  final String title;
  final DocumentSnapshot document;

   

 //  String toggleData =  myUserData.data.userKey;

  @override
  _MyHomePageState createState() => _MyHomePageState(); }


class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {



AnimationController _animationController;
bool _sideMoved = false;
Size _size;
double sideWidth;
int _sideDuration = 300;

TabController tabController;


@override 
void initState() {
  _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: _sideDuration));
  
  tabController = TabController(vsync:  this, length: 4);
 
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
    return  Scaffold(
      
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
        );}
      
  
  
      
   Widget _sideScreen() {
     return
      AnimatedContainer(
       
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
               height: 20,
          //    child: Text(
          //      '추천 레시피',
                
          //    textAlign: TextAlign.center,
          //    style: TextStyle(color: Colors.black87, fontSize: 40, fontWeight: FontWeight.bold
          //     ), 
     //   )   
           ),
           
           SizedBox(
              height: 20,
           //   child: Text('인기 레시피',
          //    textAlign: TextAlign.center,
           //   style: TextStyle(color: Colors.black87, fontSize: 40, fontWeight: FontWeight.bold
           //    ),
             
           //  ),  
            
           ),
          InkWell(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => MailerPage()));
                //DetailPage(document)));
          }, child : SizedBox(
              child: Text('문의하기',
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.black87, fontSize: 40, fontWeight: FontWeight.bold
               ), 
        )   
           ),),
           Expanded(
             child: Image.network('https://images.unsplash.com/photo-1506458961255-571f40df5aad?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60)' ,fit: BoxFit.cover)
           )
           ],
        
        )
      )
     ),
     )
     ;}
     
   

   Widget _homeScreen() {
    
     return 
  AnimatedContainer(
       
       curve: Curves.easeIn,
       color:  _sideMoved ?  Colors.red[200]: Colors.white,
       duration: Duration(milliseconds: _sideDuration),
       transform : Matrix4.translationValues (
       _sideMoved ?   sideWidth : 0, 
       0 ,  
      0, 
      ),
      child:
      //  Scrollbar(
        //scrollDirection: Axis.vertical,
      //  child: 
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
            AnimatedText(),
            Text(
              ''
            ),
            CarouseWithIndicator(),
            SizedBox(
               height: 95
            ),
       

      Stack (
          children: <Widget>[ 
         Container (
          height: 410.0,
          decoration: BoxDecoration(
           // borderRadius:
           // BorderRadius.only(bottomLeft: Radius.circular(50.0)),
            color: 
            //Color(0xFFFE8A7E)
            //Color(0xFFFD7465)
            Colors.white,
          ),),

        Container (
          height: 410.0,
          decoration: BoxDecoration(
            borderRadius:
            BorderRadius.only(bottomLeft: Radius.circular(50.0)),
            boxShadow: [
                           BoxShadow(
                           color: Colors.red.withOpacity(0.2),
                            offset: Offset(-6.0,  6.0),
                            spreadRadius: 0.0,
                            blurRadius: 7.0)],

            color: 
            //Color(0xFFFE8A7E)
            //Color(0xFFFD7465)
             Colors.white,
          )),
          
       
         Column(children: <Widget>[

        Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('추천레시피',
                        style: TextStyle(
                            fontFamily: 'Cute', 
                            fontSize: 40.0)),
                   InkWell(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => RecommandPage()));
                //DetailPage(document)));
          }, child : SizedBox(
            child:
                    Text('전체보기',
                        style: TextStyle(color: Colors.black54, fontSize: 30.0))),
                   ),
                  ],
                ),),


           
       StreamBuilder<QuerySnapshot> (
              stream: Firestore.instance.collection('posts').snapshots(),
                
               builder: (context, snapshot) { 
               return ConstrainedBox(
                                constraints: BoxConstraints(
                                  //  minWidth: 144,
                                 // minHeight: 244,
                                  //  maxWidth: 154,
                                  maxHeight: 354,
                                ),
                                child:
              // ListView.builder(
              //  scrollDirection = Axis.horizontal,
              //  itemcount: snapshot.data.documents.length,
              //  itemBuilder(BuildContext context, int index)
                ListView.builder(
                //  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
               //     crossAxisCount: 1,
                  //  childAspectRatio: 1.0,
                  //  mainAxisSpacing: 1.0,
                  //  crossAxisSpacing: 1.0
              //    ),
                // physics: PageScrollPhysics(), // this is what you are looking for
                   scrollDirection: Axis.horizontal,
               // physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                //  scrollDirection: Axis.vertical,
                    itemCount: snapshot?.data?.documents?.length ?? 0,
                    
                    itemBuilder:(BuildContext context, int index){
                    //  DocumentSnapshot recipepost = snapshot.data.documents[index];
                    if (!snapshot.hasData) {
                   return  MyProgressIndicator();
                    }
                    
           //     List<DocumentSnapshot> get documents

                  return _buildCard(context, snapshot.data.documents[index]);
                        

                  
                  
                  }  
              

            ))
          ;}
          ),
         ]),
          ]),
          

          Stack (
          children: <Widget>[ 
         Container (
          height: 390.0,
          decoration: BoxDecoration(
           // borderRadius:
           // BorderRadius.only(bottomLeft: Radius.circular(50.0)),
            color: 
            //Color(0xFFFE8A7E)
            //Color(0xFFFD7465)
            Colors.white,
          ),),

        Container (
          height: 390.0,
          decoration: BoxDecoration(
            borderRadius:
            BorderRadius.only(bottomLeft: Radius.circular(50.0)),
            boxShadow: [
                           BoxShadow(
                           color: Colors.red.withOpacity(0.2),
                            offset: Offset(-6.0,  6.0),
                            spreadRadius: 0.0,
                            blurRadius: 7.0)],
            color: 
            //Color(0xFFFE8A7E)
            //Color(0xFFFD7465)
             Colors.white,
          )),
          Column(children: <Widget>[
         // Padding(
         // padding: EdgeInsets.only(bottom:15.0, left:15.0 ,right:15.0),
          //child: 
          Padding(
          padding: EdgeInsets.all(15.0),
          child: 
          Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('이달의 레시피',
                        style: TextStyle(
                            fontFamily: 'Cute', 
                            fontSize: 40.0)),
                            
                    InkWell(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => MonthPage()));
                //DetailPage(document)));
          }, child : SizedBox(
            child:
                    Text('전체보기',
                        style: TextStyle(color: Colors.black54, fontSize: 30.0))),
                   ),
                  ],
                ),),
                //),

          

          StreamBuilder<QuerySnapshot> (
              stream: Firestore.instance.collection('posts').snapshots(),
                
               builder: (context, snapshot) { 
               return ConstrainedBox(
                                constraints: BoxConstraints(
                                  //  minWidth: 144,
                                 // minHeight: 244,
                                  //  maxWidth: 154,
                                  maxHeight: 304,
                                ),
                                child:
              // ListView.builder(
              //  scrollDirection = Axis.horizontal,
              //  itemcount: snapshot.data.documents.length,
              //  itemBuilder(BuildContext context, int index)
                ListView.builder(
                //  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
               //     crossAxisCount: 1,
                  //  childAspectRatio: 1.0,
                  //  mainAxisSpacing: 1.0,
                  //  crossAxisSpacing: 1.0
              //    ),
                //   physics: PageScrollPhysics(), // this is what you are looking for
                   scrollDirection: Axis.horizontal,
               //  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                //  scrollDirection: Axis.vertical,
                    itemCount: snapshot?.data?.documents?.length ?? 0,
                    
                    itemBuilder:(BuildContext context, int index){
                    //  DocumentSnapshot recipepost = snapshot.data.documents[index];
                    if (!snapshot.hasData) {
                   return  MyProgressIndicator();
                    }
                    
           //     List<DocumentSnapshot> get documents

                  return _buildCard(context, snapshot.data.documents[index]);
                        

                  
                  
                  }  
            
            ))
          ;}
          ),

          ]),]),
/*
           Padding(
          padding: EdgeInsets.only(bottom:15.0, left:15.0 ,right:15.0),
          child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('레시피',
                        style: TextStyle(
                            fontFamily: 'Cute', 
                            fontSize: 40.0)),
                    Text('전체보기',
                        style: TextStyle(color: Colors.black54, fontSize: 30.0))
                  ],
                ),),
        

          StreamBuilder<QuerySnapshot> (
              stream: Firestore.instance.collection('posts').snapshots(),
                
               builder: (context, snapshot) { 
               return 
              // ListView.builder(
              //  scrollDirection = Axis.horizontal,
              //  itemcount: snapshot.data.documents.length,
              //  itemBuilder(BuildContext context, int index)
                ListView.builder(
                //  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
               //     crossAxisCount: 1,
                  //  childAspectRatio: 1.0,
                  //  mainAxisSpacing: 1.0,
                  //  crossAxisSpacing: 1.0
              //    ),
                // physics: PageScrollPhysics(), // this is what you are looking for
                 //  scrollDirection: Axis.horizontal,
                 physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                //  scrollDirection: Axis.vertical,
                    itemCount: snapshot?.data?.documents?.length ?? 0,
                    
                    itemBuilder:(BuildContext context, int index){
                    //  DocumentSnapshot recipepost = snapshot.data.documents[index];
                    if (!snapshot.hasData) {
                   return Center(child :Text ('로딩중'));
                    }
                    
           //     List<DocumentSnapshot> get documents

                  return _buildvertiCard(context, snapshot.data.documents[index]);
                        

                  
                  
                  }  
              

            )
          ;}
          ), */

          TabBar(
          
          controller:  tabController,
          indicatorColor: Color(0xFFFE8A7E),
          indicatorSize: TabBarIndicatorSize.label,
          indicatorWeight: 4.0,
          isScrollable: true,
          labelColor:Color(0xffF68D7F),
         //  Color(0xFF440206),
          unselectedLabelColor: 
         // Color(0xffF68D7F),
          Color(0xFF440206),
          tabs: <Widget>[
                Padding(
          padding: EdgeInsets.all(20.0),
          child: Tab(
                  child: Text(
                    '밑반찬',
                    style: TextStyle(
                      fontFamily: 'Cute',
                      fontSize: 40.0,
                    ),
                  ),
                ),),
                
                Tab(
                  child: Text(
                    '메인반찬',
                    style: TextStyle(
                      fontFamily: 'Cute',
                      fontSize: 40.0,
                    ),
                  ),
                ),
                
                Tab(
                  child: Text(
                    '샐러드',
                    style: TextStyle(
                      fontFamily: 'Cute',
                      fontSize: 40.0,
                    ),
                  ),
                ),
                
                Tab(
                  child: Text(
                    '국수/면',
                    style: TextStyle(
                      fontFamily: 'Cute',
                      fontSize: 40.0,
                    ),
                  ),
                ),
              ],
        ),

        
        SizedBox(height: 10.0),
        
          Container(
          padding: EdgeInsets.all(15.0) ,
          height: MediaQuery.of(context).size.height -200,
          child: 
          TabBarView(
            controller: tabController,
      //      physics: const NeverScrollableScrollPhysics(),
            children: <Widget>[





               StreamBuilder<QuerySnapshot> (
              stream: Firestore.instance.collection('posts').snapshots(),
              
                
               builder: (context, snapshot) { 
               return 
              // ListView.builder(
              //  scrollDirection = Axis.horizontal,
              //  itemcount: snapshot.data.documents.length,
              //  itemBuilder(BuildContext context, int index)
                ListView.builder(
                 
               //   key: new PageStorageKey('ListView'),
                //  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
               //     crossAxisCount: 1,
                  //  childAspectRatio: 1.0,
                  //  mainAxisSpacing: 1.0,
                  //  crossAxisSpacing: 1.0
              //    ),
                // physics: PageScrollPhysics(), // this is what you are looking for
                 //  scrollDirection: Axis.horizontal,
              //   physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
               //   scrollDirection: Axis.vertical,
                    itemCount: snapshot?.data?.documents?.length ?? 0,
                    
                    itemBuilder:(BuildContext context, int index){
                    //  DocumentSnapshot recipepost = snapshot.data.documents[index];
                    if (!snapshot.hasData) {
                   return  MyProgressIndicator();
                    }
                    
           //     List<DocumentSnapshot> get documents

                  return _buildvertiCard(context, snapshot.data.documents[index]);
                        

                  
                  
                  }  
              

            )
          ;}
          ),


          StreamBuilder<QuerySnapshot> (
              stream: Firestore.instance.collection('posts')
                .where('type', isEqualTo: 'a')
                .snapshots(),
               builder: (
               //  Buildcontext 
                 context,  
              //   AsyncSnapshot<DocumentSnapshot> 
                 snapshot) { 
               return 
              // ListView.builder(
              //  scrollDirection = Axis.horizontal,
              //  itemcount: snapshot.data.documents.length,
              //  itemBuilder(BuildContext context, int index)
                ListView.builder(
                 
               //   key: new PageStorageKey('ListView'),
                //  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
               //     crossAxisCount: 1,
                  //  childAspectRatio: 1.0,
                  //  mainAxisSpacing: 1.0,
                  //  crossAxisSpacing: 1.0
              //    ),
                // physics: PageScrollPhysics(), // this is what you are looking for
                 //  scrollDirection: Axis.horizontal,
              //   physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
               //   scrollDirection: Axis.vertical,
                    itemCount: snapshot?.data?.documents?.length ?? 0,
                    
                    itemBuilder:(BuildContext context, int index){
                    //  DocumentSnapshot recipepost = snapshot.data.documents[index];
                    if (!snapshot.hasData) {
                   return  MyProgressIndicator();
                    }
                    
           //     List<DocumentSnapshot> get documents

                  return _buildvertiCard(context, snapshot.data.documents[index]);
                        

                  
                  
                  }  
              

            )
          ;}
          ),



          StreamBuilder<QuerySnapshot> (
              stream: Firestore.instance.collection('posts').snapshots(),
                
               builder: (context, snapshot) { 
               return 
              // ListView.builder(
              //  scrollDirection = Axis.horizontal,
              //  itemcount: snapshot.data.documents.length,
              //  itemBuilder(BuildContext context, int index)
                ListView.builder(
                 
               //   key: new PageStorageKey('ListView'),
                //  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
               //     crossAxisCount: 1,
                  //  childAspectRatio: 1.0,
                  //  mainAxisSpacing: 1.0,
                  //  crossAxisSpacing: 1.0
              //    ),
                // physics: PageScrollPhysics(), // this is what you are looking for
                 //  scrollDirection: Axis.horizontal,
              //   physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
               //   scrollDirection: Axis.vertical,
                    itemCount: snapshot?.data?.documents?.length ?? 0,
                    
                    itemBuilder:(BuildContext context, int index){
                    //  DocumentSnapshot recipepost = snapshot.data.documents[index];
                    if (!snapshot.hasData) {
                   return  MyProgressIndicator();
                    }
                    
           //     List<DocumentSnapshot> get documents

                  return _buildvertiCard(context, snapshot.data.documents[index]);
                        
            
                  
                  
                  }  
              

            )
          ;}
          
          ),



          StreamBuilder<QuerySnapshot> (
              stream: Firestore.instance.collection('posts').snapshots(),
                
               builder: (context, snapshot) { 
               return 
              // ListView.builder(
              //  scrollDirection = Axis.horizontal,
              //  itemcount: snapshot.data.documents.length,
              //  itemBuilder(BuildContext context, int index)
                ListView.builder(
                 
               //   key: new PageStorageKey('ListView'),
                //  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
               //     crossAxisCount: 1,
                  //  childAspectRatio: 1.0,
                  //  mainAxisSpacing: 1.0,
                  //  crossAxisSpacing: 1.0
              //    ),
                // physics: PageScrollPhysics(), // this is what you are looking for
                 //  scrollDirection: Axis.horizontal,
              //   physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
               //   scrollDirection: Axis.vertical,
                    itemCount: snapshot?.data?.documents?.length ?? 0,
                    
                    itemBuilder:(BuildContext context, int index){
                    //  DocumentSnapshot recipepost = snapshot.data.documents[index];
                    if (!snapshot.hasData) {
                   return  MyProgressIndicator();
                    }
                    
           //     List<DocumentSnapshot> get documents

                  return _buildvertiCard(context, snapshot.data.documents[index]);
                        

                  
                  
                  }  
              

            )
          ;}
          ),


          




            




               
            ],
          ),)
        


          





          
          ]
          )
          ]
          )
          ]
          
          )
         // )
          )
          ;}

//],),);}

  

   Widget _buildCard(BuildContext context, DocumentSnapshot document) {
     //String title, String rating, String imgurl, String imguri) {
   // return Image.network(document['img_url'], fit: BoxFit.cover);} 
    
    return 
    //Hero(tag: document.documentID, child:
    
    Padding(
        padding: EdgeInsets.all(10.0),
       
          child: InkWell(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => DetailPage(document)));
                //DetailPage(document)));
          }, child : Stack(
            children: <Widget>[
              
             Container (
                height: 270.0,
                width: 300.0,
                
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                   image: DecorationImage(
                        image: NetworkImage(
                        
                          document['img_url']),
                        //  '${recipepost['img_url']}'),
                         fit: BoxFit.cover)),
              ),
              //make the shade a bit deeper.
              Container(
                height: 270.0,
                width: 300.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.black.withOpacity(0.3)),
              ),
              Positioned(
                top: 10.0,
                left: 10.0,
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 50.0,
                      width: 110.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.black.withOpacity(0.2)),
                      child: Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                         // Icon(Icons.star, color: Colors.white, size: 12.0),
                         // SizedBox(width: 5.0),
                         
                          Text(
                            '자세히보기',
                            style: TextStyle(color: Colors.white, fontSize: 30.0, ),
                          )
                        ],
                      )),
                    ),
                 //   SizedBox(width: 50.0),
                 //   Text(
                  //    'More',
                  //    style: TextStyle(
                  //        color: Colors.white, 
                          //fontFamily: 'Opensans'
                  //        ),
                  //  ),
                   // SizedBox(width: 7.0),
                    //this should be an iconbutton in a real app.
                 //   Icon(Icons.arrow_drop_down, color: Colors.white, size: 25.0)
                  ],
                ),
              ),  
              Positioned(
                top: 55.0,
                left: 20.0,
                child: Container(
                  width: 220.0,
                  child: Text(document['title'],
                      style: TextStyle(
                        //  fontFamily: 'Opensans',
                          fontSize: 55.0,
                          color: Colors.white,
                          )),
                ),
              ),
              Positioned(
                  top: 200.0,
                  left: 20.0,
                  child: Row(children: [
                 /*   widget.document['likedUsers']?.contains(widget.user.email) ??
                      false
                  ? GestureDetector(
                      onTap: _unlike,
                      child: Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                    )
                  : GestureDetector(
                      onTap: _like,
                      child: Icon(Icons.favorite_border),
                    ),*/

                    
                    Text(
                     document['chef'],
                        style: TextStyle(
                     //       fontFamily: 'Opensans',
                            fontSize: 30.0,
                            color: Colors.white)
                           // fontWeight: FontWeight.w600)
                           ),
                           
                   // SizedBox(width: 15.0),
                    Stack(
                      children: <Widget>[
                         Container(height: 40.0, width: 100.0),
                        //Container(
                        //  height: 60.0,
                        //  width: 60.0,
                        //  decoration: BoxDecoration(
                        //      borderRadius: BorderRadius.circular(100.0),
                       //  CircleAvatar(
                       //    backgoundImage:  NetworkImage("https://i.pinimg.com/564x/e3/54/e9/e354e97bf5d17326c3c361d884707e2c.jpg"),
                       //
                       
                          
                          ]
                          )]))])));
                          
                          }


  

   Widget _buildvertiCard(BuildContext context, DocumentSnapshot document) {
     //String title, String rating, String imgurl, String imguri) {
   // return Image.network(document['img_url'], fit: BoxFit.cover);} 
    
    return
    Padding(
        padding: EdgeInsets.all(17.0),
        child: InkWell(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => DetailPage(document)));
                //DetailPage(document)));
          }, child : Stack(
            children: <Widget>[
             Hero(tag: document['img_url'], child: Container (
                height: 270.0,
                width: MediaQuery.of(context).size.width,
                
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                   image: DecorationImage(
                        image: NetworkImage(
                        
                          document['img_url']),
                        //  '${recipepost['img_url']}'),
                         fit: BoxFit.cover)),
              ),),
              //make the shade a bit deeper.
              Container(
                height: 270.0,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.black.withOpacity(0.3)),
              ),
              Positioned(
                top: 10.0,
                left: 10.0,
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 50.0,
                      width: 110.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.black.withOpacity(0.2)),
                      child: Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                         // Icon(Icons.star, color: Colors.white, size: 12.0),
                         // SizedBox(width: 5.0),
                         
                          Text(
                            '자세히보기',
                            style: TextStyle(color: Colors.white, fontSize: 30.0, ),
                          )
                        ],
                      )),
                    ),
                 //   SizedBox(width: 50.0),
                 //   Text(
                  //    'More',
                  //    style: TextStyle(
                  //        color: Colors.white, 
                          //fontFamily: 'Opensans'
                  //        ),
                  //  ),
                   // SizedBox(width: 7.0),
                    //this should be an iconbutton in a real app.
                 //   Icon(Icons.arrow_drop_down, color: Colors.white, size: 25.0)
                  ],
                ),
              ),  
              Positioned(
                top: 55.0,
                left: 20.0,
                child: Container(
                  width: 220.0,
                  child: Text(document['title'],
                      style: TextStyle(
                        //  fontFamily: 'Opensans',
                          fontSize: 55.0,
                          color: Colors.white,
                          )),
                ),
              ),
              Positioned(
                  top: 200.0,
                  left: 20.0,
                  child: Row(children: [
                    
            
                    Text(
                     
                      document['chef'],
                        style: TextStyle(
                     //       fontFamily: 'Opensans',
                            fontSize: 30.0,
                            color: Colors.white)
                           // fontWeight: FontWeight.w600)
                           ),
                   // SizedBox(width: 15.0),
                    Stack(
                      children: <Widget>[
                         Container(height: 40.0, width: 50.0),
                        
                        //Container(
                        //  height: 60.0,
                        //  width: 60.0,
                        //  decoration: BoxDecoration(
                        //      borderRadius: BorderRadius.circular(100.0),
                       //  CircleAvatar(
                       //    backgoundImage:  NetworkImage("https://i.pinimg.com/564x/e3/54/e9/e354e97bf5d17326c3c361d884707e2c.jpg"),
                       //
                          ]
                          ),
                          ]
                          )
                          )
                          ]
                          ))
                          
                          );
   

   
} 
}


/*
class RecipeSearch extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.length < 1) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              "Search term must be longer than ones letters.",
            ),
          )
        ],
      );
    }
    
    //Add the search term to the searchBloc. 
    //The Bloc will then handle the searching and add the results to the searchResults stream.
    //This is the equivalent of submitting the search term to whatever search service you are using
    //InheritedBlocs.of(context)
    //    .searchBloc
    //    .searchTerm
    //    .add(query);

    return Column(
      children: <Widget>[
        //Build the results based on the searchResults stream in the searchBloc
        StreamBuilder(
          stream: Firestore.instance.collection('posts').where('searchinfo', arrayContains :  'query')
        .snapshots(),
          //InheritedBlocs.of(context).searchBloc.searchResults,
          builder: (
             context,  snapshot
           // context, AsyncSnapshot<List<Result>> snapshot
            ) {
            if (!snapshot.hasData) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(child: CircularProgressIndicator()),
                ],
              );
            } else if (snapshot.data.length == 0) {
              return Column(
                children: <Widget>[
                  Text(
                    "No Results Found.",
                  ),
                ],
              );
            } else {
              var results = snapshot.data;
              return ListView.builder(
                itemCount: results.length,
                itemBuilder: (context, index) {
                  var result = results[index];
                  return ListTile(
                    title: Text(result.title),
                  );
                },
              );
            }
          },
        ),
      ],
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // This method is called everytime the search term changes. 
    // If you want to add search suggestions as the user enters their search term, this is the place to do that.
    return Column();
  }
}
*/

/*

 class RecipeSearch extends SearchDelegate<QuerySnapshot> {
    
   @override 
   List<Widget> buildActions(BuildContext context) {
     return [
       Icon(Icons.clear),
       
     ];
   }
   @override 
   Widget buildLeading(BuildContext context) {
     return IconButton(
       icon: Icon(Icons.arrow_back_ios),
       onPressed: () {
         close(context, null);
       },
     );

   }

   @override
   Widget buildResults(BuildContext context) {
   return Container();
   }

   @override 
   Widget buildSuggestion(BuildContext context) {
    
    return StreamBuilder(builder: null)
   }



 }

*/


                        //), 
                  /*      Positioned(
                  top: 225.0,
                  left: 10.0,
                  child: Row(children: [
                    Text('I was here',
                        style: TextStyle(
                          //  fontFamily: 'Opensans',
                            fontSize: 25.0,
                            color: Colors.white,
                          //  fontWeight: FontWeight.w600)
                    )),
                    SizedBox(width: 15.0),
                    Stack(
                      children: <Widget>[
                        Container(height: 40.0, width: 100.0),
                        Container(
                          height: 40.0,
                          width: 40.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              image: DecorationImage(
                                  image: NetworkImage(document['chf_img_url']),
                                  fit: BoxFit.cover)),
                        ), 
                      Positioned(
                          left: 30.0,
                          child: Container(
                            height: 40.0,
                            width: 40.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.white),
                            child: Center(
                              child: Text('+17..',
                                  style: TextStyle(
                                      fontSize: 14.0, color: Colors.black)),
                            ),
                          ),
                        )  
                         /*
                    
    )
    ]
    )
    ]
    )
    )
    ]
    )
    )
    );
    
}

 

    
                        
                    
        
       

            
           
          // CarouselPage()
*/
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
            
       
   */
