import 'package:flutter/material.dart';
import 'package:recipe_app/pages/bookmark_page.dart';
import 'package:recipe_app/pages/myhome_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';


class TabPage extends StatefulWidget {
 // TabPage({Key key}) : super(key: key);

  @override
  _TabPageState createState() => _TabPageState();
}



class _TabPageState extends State<TabPage> {

final List<Widget> _pages= [
  MyHomePage(),
  BookmarkPage(),

];

int _selectedPageIndex = 0;

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
         color: Colors.red[50],
         backgroundColor: Colors.white,
         buttonBackgroundColor: Colors.red[100],
       //  height: 70,
       //  selectedItemColor: Colors.red[200],
       //  unselectedItemColor: Colors.black45,
       //  currentIndex: _selectedPageIndex,
       //  type: BottomNavigationBarType.shifting,
         items: <Widget> [
           //BottomNavigationBarItem(
           Icon ( Icons.restaurant, size: 30),
         //  title: Text('레시피'),
          // ),
           //BottomNavigationBarItem(
           Icon (Icons.collections_bookmark, size: 30),
        //   title: Text('북마크'),
          // )
         ],
          animationDuration: Duration(
             milliseconds: 200
          ),
          animationCurve: Curves.easeIn,
         )
    );
  }
}