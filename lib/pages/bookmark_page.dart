
import 'package:flutter/material.dart';
//import 'package:recipe_app/widgets/horizon_part.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:recipe_app/pages/detail_page.dart';
//import 'package:recipe_app/pages/list_page.dart';

class BookmarkPage extends StatefulWidget {
  BookmarkPage({Key key}) : super(key: key);

  @override
  _BookmarkPageState createState() => _BookmarkPageState();
}

//final DocumentSnapshot document;
//HorizonPart(this.document);

class _BookmarkPageState extends State<BookmarkPage> {


   
  @override

  Widget build(BuildContext context) {
    return HorizonPart();
     
     
                }
    
  }

class Post {
 final String title;
 final String img_url;
 final String chef;
 final DocumentReference reference;

 Post.fromMap(Map<String, dynamic> map, {this.reference})
     : assert(map['title'] != null),
       assert(map['img_url'] != null),
       assert(map['chef'] != null),
       title = map['title'],
       img_url = map['img_url'],
       chef= map['chef'];

 Post.fromSnapshot(DocumentSnapshot snapshot)
     : this.fromMap(snapshot.data, reference: snapshot.reference); }


class HorizonPart extends StatefulWidget {
  HorizonPart({Key key}) : super(key: key);

  @override
  _HorizonPartState createState() => _HorizonPartState();
}



class _HorizonPartState extends State<HorizonPart> {
  @override
  Widget build(BuildContext context) {
 //   return StreamBuilder<QuerySnapshot>(
 //    stream: Firestore.instance.collection('posts').snapshots(),
    
 //   builder: (context, snapshot) { 
      return Scaffold (
        body:
  /*   Column( children: <Widget> [Padding(
            padding: const EdgeInsets.all(30.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Most Popular',
                      style: TextStyle(
                   //     fontFamily: 'Opensans',
                        fontSize: 50.0,
                      )),
                  Icon(Icons.more_horiz, color: Colors.black)
                ],
              ),
            ),
    ), */
      //    Padding(
       //    padding: const EdgeInsets.only(left: 15.0),
       //     child: Container(
       //      height: 300.0,
              

        //      child: 
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
                 physics: PageScrollPhysics(), // this is what you are looking for
                 scrollDirection: Axis.horizontal,
                //scrollDirection: Axis.vertical,
                    itemCount: snapshot?.data?.documents?.length ?? 0,
                    
                    itemBuilder:(BuildContext context, int index){
                    //  DocumentSnapshot recipepost = snapshot.data.documents[index];
                    if (!snapshot.hasData) {
                   return Center(child :Text ('로딩중'));
                    }
                    
           //     List<DocumentSnapshot> get documents

                  return _buildCard(context, snapshot.data.documents[index]);
                        

                  
                  
                  }
              /*  scrollDirection: Axis.horizontal,
                children: <Widget>[
                  _buildCard(
                      '시금치나물', '4.1','https://i.pinimg.com/564x/e3/54/e9/e354e97bf5d17326c3c361d884707e2c.jpg','https://i.pinimg.com/564x/e3/54/e9/e354e97bf5d17326c3c361d884707e2c.jpg'),
                      //'assets/mountain.jpg'),
                  _buildCard(
                      '부추무침', '3.8', 'https://i.pinimg.com/564x/e3/54/e9/e354e97bf5d17326c3c361d884707e2c.jpg','https://i.pinimg.com/564x/e3/54/e9/e354e97bf5d17326c3c361d884707e2c.jpg'),
                   _buildCard(
                      '파스타알리오', '4.1','https://i.pinimg.com/564x/e3/54/e9/e354e97bf5d17326c3c361d884707e2c.jpg','https://i.pinimg.com/564x/e3/54/e9/e354e97bf5d17326c3c361d884707e2c.jpg'),
                      //'assets/mountain.jpg'),
                  _buildCard(
                      '숙주무침', '3.8', 'https://i.pinimg.com/564x/e3/54/e9/e354e97bf5d17326c3c361d884707e2c.jpg','https://i.pinimg.com/564x/e3/54/e9/e354e97bf5d17326c3c361d884707e2c.jpg'),

                      //'assets/kathmandu.jpg')
                ],
              ),*/

            )
          ;}));}}



  

   Widget _buildCard(BuildContext context, DocumentSnapshot document) {
     //String title, String rating, String imgurl, String imguri) {
   // return Image.network(document['img_url'], fit: BoxFit.cover);} 
    
    return
    Padding(
        padding: EdgeInsets.all(10.0),
        child: InkWell(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => DetailPage(document)));
                //DetailPage(document)));
          },
          child: Stack(
            children: <Widget>[
             Hero(tag: document.documentID, child: Container (
                height: 270.0,
                width: 300.0,
                
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
                    Text(document['chef'],
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
                       Positioned(
                          left: 40.0,
                          child: Container(
                            height: 40.0,
                            width: 40.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),),
                          //      image: DecorationImage(
                           //    image: NetworkImage(document['chef_img']), fit: BoxFit.cover)),
                               child: Center(
                              child: Text('+17..',
                                  style: TextStyle(
                                    fontSize: 14.0, color: Colors.black)),
                            ),
                          ),
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
                        )  */
                    
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

 

    
                        
                    
        
      