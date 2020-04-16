//import 'package:cloud_firestore/cloud_firestore.dart';


import 'package:flutter/material.dart';

import 'package:recipe_app/pages/myhome_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';



import 'package:recipe_app/pages/search_page.dart';


class TabPage extends StatefulWidget {
  TabPage({Key key, }) : super(key: key);

 

  

  @override
  _TabPageState createState() => _TabPageState();
}



class _TabPageState extends State<TabPage> {

//final List<Widget> _pages

//= <Widget>[
//  MyHomePage(),
//  BookmarkPage(),
//  LoginRootPage(),
  //ProfilePage(),

//];
List _pages;

int _selectedPageIndex = 0;

@override
  void initState() {
    super.initState();
    _pages = [
      MyHomePage(),
      SearchPage(),
      
     
    ];
  }

void _selectPage (int index) {
  setState (()  {
    _selectedPageIndex = index;
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedPageIndex],
      bottomNavigationBar: CurvedNavigationBar(
         onTap: _selectPage,
         color: Colors.red[100],
         backgroundColor: Colors.white,
         buttonBackgroundColor: Colors.red[200],
       //  height: 70,
       //  selectedItemColor: Colors.red[200],
       //  unselectedItemColor: Colors.black45,
       //  currentIndex: _selectedPageIndex,
       //  type: BottomNavigationBarType.shifting,
         items: <Widget> [
           //BottomNavigationBarItem(
           Icon ( Icons.restaurant, size: 30,
           color: Colors.white),
         //  title: Text('레시피'),
          // ),
           //BottomNavigationBarItem(
           Icon (
             //FontAwesomeIcons.cookie,
             Icons.search, 
           size: 40,
           color: Colors.white),
          //ImageIcon(AssetImage("assets/icons/searchtwo.png"), size: 30)
        //   title: Text('북마크'),
        
         ],
          animationDuration: Duration(
             milliseconds: 200
          ),
          animationCurve: Curves.easeIn,
         )
    );
  }
}

