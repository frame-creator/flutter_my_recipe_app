import 'dart:async';
//import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mailer/flutter_mailer.dart';

//import 'package:path_provider/path_provider.dart';


class MailerPage extends StatefulWidget {
  @override
  _MailerPageState createState() => new _MailerPageState();
}

class _MailerPageState extends State<MailerPage> {
  List<String> attachment = <String>[];
  final TextEditingController _subjectController =
      TextEditingController(text: '제목을 입력해주세요.');
  final TextEditingController _bodyController = TextEditingController(
      text: ''' 문의하실 내용을 입력해주세요.
  ''');
  final GlobalKey<ScaffoldState> _scafoldKey = GlobalKey<ScaffoldState>();
  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> send() async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    final MailOptions mailOptions = MailOptions(
      body: _bodyController.text,
      subject: _subjectController.text,
      recipients: <String>['apptocontact@gmail.com'],
      isHTML: true,
      // bccRecipients: ['other@example.com'],
     // ccRecipients: <String>['third@example.com'],
      attachments: attachment,
    );

    String platformResponse;

    try {
      await FlutterMailer.send(mailOptions);
      platformResponse = '';
    } on PlatformException catch (error) {
      platformResponse = error.toString();
      print(error);
      if (!mounted){ 
        return;
        }
      await showDialog<void>(
          context: _scafoldKey.currentContext,
          builder: (BuildContext context) => AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)),
                content: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      'Message',
                      style: Theme.of(context).textTheme.subhead,
                    ),
                    Text(error.message),
                  ],
                ),
                contentPadding: const EdgeInsets.all(26),
                title: Text(error.code),
              ));
    } catch (error) {
      platformResponse = error.toString();
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted){ 
      return;
    }
    _scafoldKey.currentState.showSnackBar(SnackBar(
      content: Text(platformResponse),
    ));
  }

  @override
  Widget build(BuildContext context) {
    
    return new MaterialApp(
     // theme: ThemeData(primaryColor: Colors.red),
      home: new Scaffold(
        key: _scafoldKey,
       // appBar: new AppBar(
        //  title: const Text('Plugin example app'),
        //  actions: <Widget>[
        //    IconButton(
        //      onPressed: send,
         //     icon: const Icon(Icons.send),
        //    )
        //  ],
       // ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: 
          
          
       


          
          
         Center(
            child: 
          //  Padding(
          //    padding: const EdgeInsets.all(8.0),
          //    child:
               Column(
                mainAxisSize: MainAxisSize.max,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
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
            Padding(
              padding: EdgeInsets.only(left: 250, top: 50, ),  
              child:Text(
              '문의하기',
              style: TextStyle(
                            fontFamily: 'Cute', 
                            fontSize: 50.0,
                            color: Colors.white)

            ),),
            
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
                padding: EdgeInsets.only(left: 15.0, top: 40.0),
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
            ]
            )
            ,
            SizedBox(
               height: 20),
                


                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      controller: _subjectController,
                       style: TextStyle(
                            fontFamily: 'Cute', 
                            fontSize: 30.0,
                            color: Colors.black87),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '문의내용 제목',
                        labelStyle: TextStyle(
                            fontFamily: 'Cute', 
                            fontSize: 40.0,
                            color: Color(0xffFF7375)),
                        contentPadding: EdgeInsets.all(30.0),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      controller: _bodyController,
                      maxLines: 5,
                      style: TextStyle(
                            fontFamily: 'Cute', 
                            fontSize: 30.0,
                            color: Colors.black87),
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(30.0),
                          labelText: '문의내용', 
                             labelStyle: TextStyle(
                            fontFamily: 'Cute', 
                            fontSize: 40.0,
                            color: Color(0xffFF7375)),
                           border: OutlineInputBorder()),
                    ),
                  ),

                    IconButton(
              onPressed: send,
              icon: const Icon(Icons.send),
              iconSize: 46,
              color: Colors.red[200],
            )
                
                ],
              ),
            
          ),
          
        
        ),
        
      ),
    );
  }

  
}


