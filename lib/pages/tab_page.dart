import 'package:flutter/material.dart';
import 'package:recipe_app/pages/bookmark_page.dart';
import 'package:recipe_app/pages/myhome_page.dart';


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
      bottomNavigationBar: BottomNavigationBar(
         onTap: _selectPage,
         //backgroundColor: Colors.red[50],
         selectedItemColor: Colors.red[200],
         unselectedItemColor: Colors.black45,
         currentIndex: _selectedPageIndex,
         type: BottomNavigationBarType.shifting,
         items: [
           BottomNavigationBarItem(
           icon: Icon(Icons.restaurant),
           title: Text('레시피'),
           ),
           BottomNavigationBarItem(
           icon: Icon(Icons.collections_bookmark),
           title: Text('북마크'),
           )
         ]
         ,)
    );
  }
}