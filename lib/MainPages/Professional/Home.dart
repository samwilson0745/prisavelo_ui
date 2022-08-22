import 'package:flutter/material.dart';
import 'package:prisavelo_ui/MainPages/mainPage.dart';

class HomeProf extends StatefulWidget {


  @override
  State<HomeProf> createState() => _HomeState();
}

class _HomeState extends State<HomeProf> {
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xfffff9eb),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 4,
              child: Container(
              )),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.height*0.02),
            child: Text('Courses',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
          ),
          Expanded(
              flex: 4,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: size.height*0.015),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _customContainer(Icons.search_rounded, "Find Course", size,[Color(0xff5780FC),Color(0xff29CEFF),]),
                        _customContainer(Icons.upload_rounded, "Upload Courses", size,[Color(0xff028774),Color(0xff02BD60)]),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _customContainer(Icons.play_arrow, "My Courses", size, [Color(0xffFF696A),Color(0xffFB9A70)]),
                        _customContainer(Icons.save, "Saved Courses", size, [Color(0xffC049FF),Color(0xffEE6EDB)]),

                      ],
                    )
                  ],
                ),
              )),
          Expanded(
              flex: 3,
              child: Container(
              )),
        ],
      ),
    );
  }
  Widget _customContainer(IconData icon,String text,Size size,List<Color> color){
    return Container(
      height: size.height>780?size.height*0.135:size.height*0.14,//100
      width: size.width*0.46,//200
      child: Row(
        children: [
          Container(
            width:size.width*0.135,
            padding:EdgeInsets.only(bottom: size.height*0.04),
            child: Icon(icon,size: size.height*0.05,color: Colors.white,),
          ),
          Expanded(
            child: Container(
              child: Text(text,style: TextStyle(fontSize: size.height>780?28:size.height*0.04,fontWeight: FontWeight.w800,color: Colors.white),),
            ),
          )
        ],
      ),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors:color
          ),
          borderRadius: BorderRadius.all(Radius.circular(20))
      ),
    );
  }
}