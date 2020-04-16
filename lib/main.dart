import 'package:flutter/material.dart';
import 'package:recipe_app/pages/tab_page.dart';

import 'package:provider/provider.dart';

import 'package:recipe_app/widgets/progressindicator.dart';



void main() => runApp( MyApp());

class MyApp extends StatelessWidget {
  
  
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.red,
        fontFamily: 'Cute',
        
    
       // textTheme: TextStyle(fontStyle: Cute),
      ),
      home: TabPage()
          
      );
      //MyHomePage(title: 'Flutter Demo Home Page'),
    
  }
}

