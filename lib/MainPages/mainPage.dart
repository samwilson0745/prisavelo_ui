import "package:flutter/material.dart";
import 'package:prisavelo_ui/MainPages/Profile.dart';
import 'package:prisavelo_ui/MainPages/Event.dart';

class Main extends StatefulWidget {
  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {

  int selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  List <Widget> _widgets=[
    Profile(),
    Event(),
    Container(child: Center(child: Text('Home')),),
    Container(child: Center(child: Text('Explore')),),
    Container(child: Center(child: Text('Notify')),)
  ];

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor:  Color(0xfffff9eb),
        elevation: 0.4,
      ),
      key: _scaffoldKey,
      floatingActionButton: null,
      body: _widgets[selectedIndex],
      bottomNavigationBar:   Container(
        color: Color(0xfffff9eb),
        child: DefaultTabController(
          initialIndex: selectedIndex,
          length: 5,
          child: TabBar(
            labelStyle: TextStyle(fontSize: size.height>780?15:12),
            onTap: (index)=>setState(()=>{
              selectedIndex=index
            }),
              tabs: <Widget>[
                Tab(icon: Icon(Icons.person),text: 'Profile',),
                Tab(icon: Icon(Icons.event),text:'Event'),
                Tab(icon: Icon(Icons.home_filled),text: 'Home',),
                Tab(icon: Icon(Icons.explore),text:'explore'),
                Tab(icon: Icon(Icons.notifications),text: 'notify',)
              ],
              labelColor: Colors.black,
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(color: Colors.black, width: 4.0),
                insets: EdgeInsets.only(bottom: 70),
              ),
              unselectedLabelColor: Colors.black,

            ),
          ),
      ),


    );
  }
}
