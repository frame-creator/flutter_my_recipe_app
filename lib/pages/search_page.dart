/*
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: Text('레시피 검색'),
        ),
        body: ListView(children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              onChanged: (val) {
                initiateSearch(val);
              },
              decoration: InputDecoration(
                  prefixIcon: IconButton(
                    color: Colors.black,
                    icon: Icon(Icons.arrow_back),
                    iconSize: 20.0,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  contentPadding: EdgeInsets.only(left: 25.0),
                  hintText: '레시피검색하기',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0))),
            ),
          ),
          SizedBox(height: 10.0),
          GridView.count(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              crossAxisCount: 2,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0,
              primary: false,
              shrinkWrap: true,
              children: tempSearchStore.map((element) {
                return buildResultCard(element);
              }).toList())
        ]));
  }
}

Widget buildResultCard(data) {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    elevation: 2.0,
    child: Container(
      child: Center(
        child: Text(data['title'],
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontSize: 20.0,
        ),
        )
      )
    )
  );
}


class SearchService {
  searchByName(String val) {
    return Firestore.instance
        .collection('posts')
        .where('searchinfo',
            isEqualTo: val)
        .getDocuments();
  }
}

*/
//import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/widgets/progressindicator.dart';
import 'package:recipe_app/pages/detail_page.dart';



class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String name = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize( 
          preferredSize: Size.fromHeight(70),
          child: AppBar(
          backgroundColor: Colors.red[200],
          elevation: 20,
         title:
           Container(
              
              margin: EdgeInsets.all(10),
              child: TextField(
           decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(25.0),
                    hintText: '검색할 레시피를 입력해주세요.',
                    hintStyle:
                        TextStyle(fontFamily: 'Cute', fontSize: 30.0),
                    prefixIcon: Icon(Icons.search, color: Colors.black38, size : 45),
                    
            ),
                  
            onChanged: (val) => initiateSearch(val),
          ),
          ),
          )
        ),
        body: 
        
       /* ListView(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              height: 250.0,
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(75.0)),
                  color: Color(0xFFFD7465)),
            ),
            Container(
              height: 185.0,
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(65.0)),
                  color: Color(0xFFFE8A7E)),
            ),
            Padding(
              padding: EdgeInsets.only(top: 35.0, left: 15.0),
              child: Text(
                '레시피 검색하기',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 30.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 75.0, left: 15.0),
              child: Text(
                '오늘 어떤 요리를 할까?',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 30.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 160.0, left: 15.0, right: 35.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(25.0),
                      bottomLeft: Radius.circular(5.0),
                      topLeft: Radius.circular(5.0),
                    )),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(top: 14.0),
                    hintText: '검색할 레시피를 입력해주세요.',
                    hintStyle:
                        TextStyle(fontFamily: 'Montserrat', fontSize: 14.0),
                    prefixIcon: Icon(Icons.search, color: Colors.black38),
                    
                  ),
                  // onChanged: (val) => initiateSearch(val),
                ),
              ),
            )
          ],
        ),

   */
        StreamBuilder<QuerySnapshot>(
          stream: 
          //name != "" && name != null
              //? 
              Firestore.instance
                  .collection('posts')
                  .where("searchinfo", arrayContains: name)
                  .snapshots() ,
           //  : Firestore.instance.collection("posts").snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return  MyProgressIndicator();
              default:
                return ConstrainedBox(
                                constraints: BoxConstraints(
                                    minWidth: MediaQuery.of(context).size.width,
                                 // minHeight: 244,
                                  //  maxWidth: 154,
                                  //maxHeight: 304,
                                ),
                                child:
                
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
                  scrollDirection: Axis.vertical,
                    itemCount: snapshot?.data?.documents?.length ?? 0,
                    
                    itemBuilder:(BuildContext context, int index){
                    //  DocumentSnapshot recipepost = snapshot.data.documents[index];
                    if (!snapshot.hasData) {
                   return Center(child :Text ('로딩중'));
                    }
                    
           //     List<DocumentSnapshot> get documents

                  return _buildvertiCard(context, snapshot.data.documents[index]);
                        

                  
                  
                  }  
              

            ),
            );




                /*new ListView(
                  children:
                      snapshot.data.documents.map((DocumentSnapshot document) {
                    return new ListTile(
                      title: new Text(document['title'],
                      //trailing: Text(document['chef'])
                      ),
                    );
                  }).toList(),
                );*/
            }
          },
        ),
       // ]
       // ),
      
      ),
    );
  }

  void initiateSearch(String val) {
    setState(() {
      name = val;
    });
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
                            style: TextStyle(color: Colors.white, fontFamily: 'Cute',fontSize: 30.0, ),
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
                          fontFamily: 'Cute'
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
                            color: Colors.white,
                            fontFamily: 'Cute')
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
                          )
        )
                          );
   

   
} 

}