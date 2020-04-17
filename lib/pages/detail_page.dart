import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:recipe_app/widgets/progressindicator.dart';

class DetailPage extends StatefulWidget {
  final DocumentSnapshot document;
  //final FirebaseUser user;
  DetailPage(this.document, 
  //this.user
  );
 

  //List<dynamic> getItem;

  //List<DocumentSnapshot> get documents;

  @override
  _DetailPageState createState() => _DetailPageState();
}

Widget buildContainer(Widget child) {
  return Container(
    decoration: BoxDecoration(
        color: Colors.white,
        // border: Border.all(color: Colors.grey),
        borderRadius:
        // BorderRadius.circular(35),
        BorderRadius.only(bottomLeft: Radius.circular(50)),
        boxShadow: [
          BoxShadow(
              color: Colors.red[50],
              offset: Offset(-4.0, 6.0),
              spreadRadius: 4.0,
              blurRadius: 1.0)
        ]),
    margin: EdgeInsets.all(10),
    padding: EdgeInsets.all(10),
    //  height: 5000,
    // width: 300,
    child: child,
  );
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
   
    List<String> getItem = List.from(widget.document['ingredient'] ?? []);
    List<String> getSteps =
        List.from(widget.document['steps_description'] ?? []);
    List<String> getStepsImg = List.from(widget.document['steps_img'] ?? []);

    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: StreamBuilder<DocumentSnapshot>(
            stream: Firestore.instance
                .collection('posts')
                .document('documentID')
                
                .snapshots(),
            builder: (context, snapshot) {
              // DocumentSnapshot document = snapshot.data ;
              // var data = snapshot.data.data;
              if (!snapshot.hasData) {
                return  MyProgressIndicator();
              }
              return SingleChildScrollView(
                  //  scrollDirection: Axis.horizontal,
                  child: ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      children: <Widget>[ Column( children:<Widget>[
             //      Hero(
             //         tag: widget.document['img_url'],
             //         child: 
                      Stack(children: <Widget>[
                     
                      Container(
                        height: MediaQuery.of(context).size.height + 20,
                        decoration: BoxDecoration(
                          //  borderRadius: BorderRadius.only(
                          //      bottomLeft: Radius.circular(35.0)),
                           //     bottomRight: Radius.circular(35.0)
                           boxShadow: [
                           BoxShadow(
                           color: Colors.red[50],
                            offset: Offset(-4.0, 6.0),
                            spreadRadius: 4.0,
                            blurRadius: 1.0)],
                           
                            color: Colors.white),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height ,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(50.0)),
                           //     bottomRight: Radius.circular(35.0)
                           boxShadow: [
                           BoxShadow(
                           color: Colors.red[50],
                            offset: Offset(-4.0, 6.0),
                            spreadRadius: 4.0,
                            blurRadius: 1.0)],
                           
                            color: Colors.white),
                      ),
                      
                      Container(
                        height: MediaQuery.of(context).size.height - 270.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(50.0)),
                           //     bottomRight: Radius.circular(35.0)
                           boxShadow: [
                           BoxShadow(
                           color: Colors.red[50],
                            offset: Offset(-4.0, 6.0),
                            spreadRadius: 4.0,
                            blurRadius: 1.0)],
                           
                            color: Colors.white),
                      ),
                      
                      Container(
                          height: MediaQuery.of(context).size.height - 280.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(50.0),
                                //  bottomRight: Radius.circular(35.0)
                                  ),
                              image: DecorationImage(
                                  image:
                                      NetworkImage( widget.document['img_url']),
                                  fit: BoxFit.cover))),
                                  Container(
                height: MediaQuery.of(context).size.height - 280.0,
               // width: 200.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(50.0),
                                //  bottomRight: Radius.circular(35.0)
                                  ),
                   // .circular(50.0),
                    color: Colors.black.withOpacity(0.2)),
                    
              ),
              Positioned(
                top: 40.0,
                right: 20.0,
                child: Container(
                  width: 220.0,
                  child: Text(widget.document['blog'],
                      style: TextStyle(
                        //  fontFamily: 'Opensans',
                          fontSize: 20.0,
                          color: Colors.white,
                          )),
                ),
              ),
              Align(
            alignment: Alignment.topLeft,
            child: Padding(
                padding: EdgeInsets.only(left: 15.0, top: 30.0),
                child: InkWell( 
                  onTap: ( ) {Navigator.pop(context);},
                  child: Container(
                    height: 40.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, 
                        color: Colors.black12 
                        //Color(0xFFA4B2AE)
                        ),
                    child: Center(
                        child: Icon(Icons.arrow_back_ios,
                            size: 25.0, color: Colors.white)))
                            )
                            )),
              
                          
                   
                    
          Positioned(              
            top:  MediaQuery.of(context).size.height - 240.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left:15.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width - 15.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Icon(Icons.restaurant, size: 40.0, color: Colors.red[200]),
                                SizedBox(width: 5),
                                Text(widget.document['title'],
                                style: TextStyle(
                                  fontFamily: 'Cute',
                                  fontSize: 53.0,
                                  color: Colors.black87
                                ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 7.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                           Container(
                            height: 50.0,
                            width: 50.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100.0),
                                color: Color(0xFFFE7050)),
                            child: Center(
                              child: Text('쉐프',
                                  style: TextStyle(
                                      fontSize: 25.0, color: Colors.white)),
                            ),
                          ),
                         

                       // Container(height: 40.0, width: 100.0),
                        Container(
                          height: 50.0,
                          width: 50.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.0),
                              image: DecorationImage(
                                  image: NetworkImage(widget.document['chef_img_url']),
                                  fit: BoxFit.cover)),
                        ),


                            Text(widget.document['chef'],
                            style: TextStyle(
                              fontFamily: 'Cute',
                              fontSize: 40.0,
                             // fontWeight: FontWeight.w600
                            )
                            ),


                           
                            ],)
                          ],
                          
                        ),
                       
                      ],
                    ),
                  ),
                ),

                

                Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 15.0),
                  child: Row(
                  children: <Widget>[
                    
                          SizedBox(width: 5.0),
                    Container(
                    width: MediaQuery.of(context).size.width-20,        
                    child:Padding(
                      padding: EdgeInsets.all(3),
                      child:Text(widget.document['blog'],
                        style: TextStyle(
                            fontFamily: 'Opensans',
                            fontSize: 17.0,
                            color: Color(0xFF6A6A6A),
                           // fontWeight: FontWeight.w600
                            )),),),
                    SizedBox(width: 25.0),
                   
                    SizedBox(width: 10.0),
                    
                  ],
              ),
                ),])),
                
                
                ]),
                //),

                

                
                    SizedBox(height: 25.0),
                    Row(
                              children: <Widget>[
                                SizedBox(width: 25.0),
                                Icon(Icons.restaurant_menu, size: 30.0, color: Colors.red[200]),
                                SizedBox(width: 25.0),
                                Text('재료',
                                style: TextStyle(
                                  fontFamily: 'Cute',
                                  fontSize:50.0,
                                  color: Colors.black
                                ),)]),            
                
                    StreamBuilder<DocumentSnapshot>(
                        stream: Firestore.instance
                            .collection('posts')
                            .document('documentID')
                            .snapshots(),
                        builder: (BuildContext context,
                            AsyncSnapshot<DocumentSnapshot> snapshot) {
/* 
 return ListView(
  shrinkWrap: true,
  physics: const NeverScrollableScrollPhysics(),
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
  
); */
                          return buildContainer(
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              itemBuilder: (ctx, index) => Column(
                                children: [
                                  ListTile(
                                    leading:
                                        //CircleAvatar(
                                        //  backgroundColor: Colors.red[300],

                                        //   child: Text( '${(index + 1)}', style: TextStyle(color: Colors.white)),
                                        // ),
                                        Container(
                                      height: 12.0,
                                      width: 12.0,
                                      decoration: BoxDecoration(
                                          color: Colors.red[300],
                                          borderRadius:
                                              BorderRadius.circular(30.0)),
                                    ),
                                    title: Text(getItem[index],
                                        style: TextStyle(fontSize: 40)),
                                  ),
                                  //    ClipRRect(
                                  //       borderRadius: BorderRadius.circular(16.0),
                                  //      child: ConstrainedBox(
                                  //       constraints: BoxConstraints(
                                  //  minWidth: 144,
                                  //       minHeight: 244,
                                  //  maxWidth: 154,
                                  //       maxHeight: 304,
                                  //      ),
                                  //        child: Image.network(getStepsImg[index], fit: BoxFit.cover),
                                  //        ),),

                                  Divider()
                                ],
                              ),
                              itemCount: getItem.length,
                            ),

                            //SizedBox(height: 20)
                          );
                        }),
                         SizedBox(height: 25.0),
                    Row(
                              children: <Widget>[
                                 SizedBox(width: 25.0),
                                Icon(Icons.restaurant_menu, size: 30.0, color: Colors.red[200]),
                                 SizedBox(width: 25.0),
                                Text('조리방법',
                                style: TextStyle(
                                  fontFamily: 'Cute',
                                  fontSize:50.0,
                                  color: Colors.black
                                ),)]),
                    buildContainer(
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (ctx, index) => Column(
                          children: [
                             
                            ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.red[300],
                                child: Text('${(index + 1)}',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 30)),
                              ),
                              title: Text(getSteps[index],
                                  style: TextStyle(fontSize: 35)),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16.0),
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                  //  minWidth: 144,
                                  minHeight: 244,
                                  //  maxWidth: 154,
                                  maxHeight: 304,
                                ),
                                child: Image.network(getStepsImg[index],
                                    fit: BoxFit.cover),
                              ),
                            ),
                            Divider(
                                //color: Colors.red[50],
                                //thickness:2.0
                                )
                          ],
                        ),
                        itemCount: getSteps.length,
                      ),
                    ),
                    
                    Container(
                      width: screenWidth,
    decoration: BoxDecoration(
        color: Colors.white,
        // border: Border.all(color: Colors.grey),
        borderRadius:
        // BorderRadius.circular(35),
        BorderRadius.only(bottomLeft: Radius.circular(50),topLeft: Radius.circular(50)),
        boxShadow: [
          BoxShadow(
              color: Colors.red[50],
              offset: Offset(-4.0, 6.0),
              spreadRadius: 4.0,
              blurRadius: 1.0)
        ]),
    margin: EdgeInsets.all(10),
    padding: EdgeInsets.all(20),
    //  height: 5000,
    // width: 300,
    child: Text('저작자의 사전 동의 없이 이미지 및 문구의 무단 도용 및 복제를 금합니다.', style: TextStyle(fontSize: 35, color: Colors.black),)
  ),
  SizedBox(height: 15)
                  ]
                  )
                  ]
                  )
                  );
            }
            )
            )
            ;}
  

}
