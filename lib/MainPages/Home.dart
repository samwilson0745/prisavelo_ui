
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget individualCourse(List<Color> color ,String name,Size size){
    return GestureDetector(
      onTap: (){
      },
      child: Container(
        width: size.width*0.4,
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: Text(
            name,
            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30)
          ),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: color
          ),
        ),

      ),
    );
  }
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
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Courses",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                TextButton(onPressed:(){
                },child: Text("See All",style: TextStyle(color: Colors.black),)),
              ],
            ),
          ),
          Expanded(
              flex: size.height>780?3:4,
              child:ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  individualCourse([Color(0xffFF696A),Color(0xffFB9A70)], 'GYM',size),
                  individualCourse([Color(0xffC049FF),Color(0xffEE6EDB)], 'YOGA',size),
                  individualCourse([Color(0xff028774),Color(0xff02BD60)], 'CARDIO',size),
                ],
              )
          ),
          Expanded(
              flex: 3,
              child: Container(
              )),
        ],
      ),
    );
  }
}
