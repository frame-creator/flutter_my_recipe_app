import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:recipe_app/pages/detail_page.dart';
import 'package:recipe_app/widgets/progressindicator.dart';

class MonthPage extends StatefulWidget {
  MonthPage({Key key}) : super(key: key);

  @override
  _MonthPageState createState() => _MonthPageState();
}

class _MonthPageState extends State<MonthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( body: 
  
ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[ 
         
        Stack (
          children: <Widget>[ 
         

        
          
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
            SizedBox(
               height: 20),
     
          //  AnimatedText(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
            Padding(
              padding: EdgeInsets.only( 
                top: 35, 
                bottom: 5),  
              child:Text(
              '이달의 레시피',
              style: TextStyle(
                            fontFamily: 'Cute', 
                            fontSize: 50.0,
                            color: Colors.white),

            ),),
            SizedBox(width: 30)
            ],)
         //   CarouseWithIndicator(),
         //   SizedBox(
         //      height: 95
         //   ), 
              
              
              
            ],
            ),
            
         //   CarouseWithIndicator(),
         //   SizedBox(
         //      height: 95
         //   ),
            Align(
            alignment: Alignment.topLeft,
            child: Padding(
                padding: EdgeInsets.only(left: 15.0, top: 25.0),
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
                            size: 15.0, color: Colors.white)))
                            )
                            )),
        ]),

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
                 physics: const NeverScrollableScrollPhysics(),
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
        
        
        ]));   

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