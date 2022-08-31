import 'package:flutter/material.dart';
import 'package:prisavelo_ui/MainPages/mainPage.dart';
import 'package:prisavelo_ui/Professional/PublishCourse.dart';

class MakeCourse extends StatefulWidget {
  const MakeCourse({Key? key}) : super(key: key);

  @override
  State<MakeCourse> createState() => _MakeCourseState();
}

class _MakeCourseState extends State<MakeCourse> {
  Widget _customListTile(Size size,int index,IconData icon){
    return Container(
      margin: EdgeInsets.only(top: size.height*0.01),
      width: size.width,
      height: size.height*0.09,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: size.height*0.04,
            height: size.height*0.04,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              border: Border.all(color: Colors.black,width: 3),
            ),
            child: Center(
              child: Text(
                "${index+1}",
                style: TextStyle(
                    fontWeight: FontWeight.bold
                ),
              ),
            ),

          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Topic"),
              Container(
                width: size.width*0.35,
                height: size.height*0.05,
                child: TextFormField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black,width: 2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black,width: 2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: "Topic Name",
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: size.width*0.35,
            height: size.height*0.05,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              border: Border.all(color: Colors.black,width: 2),
            ),
            child: Center(
              child: Text("ADD VIDEO"),
            ),
          ),

          GestureDetector(
            onTap: (){

            },
            child: Container(
              width: size.height*0.04,
              height: size.height*0.04,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(color: Colors.black,width: 3),
              ),
              child: Center(
                  child: Icon(icon)
              ),

            ),
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: Color(0xfffff9eb),
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Color(0xfffff9eb),
          toolbarHeight: size.height*0.1,
          leading: IconButton(
            icon: Icon(Icons.arrow_circle_left_outlined,color: Colors.black,size: 40,),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
          title: Text( "Course Name Will be here and the...",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900),),
        ),
        body: Column(
          children: [
            Expanded(
                flex: 8,
                child: ListView(
                  children: [
                    _customListTile(size, 0,Icons.add),
                  ],
                )
            ),
            Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: size.width/2.2,
                      height: size.height>780?size.height*0.065:size.height*0.07,
                      child: OutlinedButton(
                          onPressed: (){},
                          style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              backgroundColor: Color(0xfffff9eb),
                              side: BorderSide(
                                  color: Color(0xffD00000),width: 2
                              )
                          ),
                          child: Text('Save Draft',style: TextStyle(color: Color(0xffD00000),fontSize: size.height>780?18:15),)),
                    ),
                    Container(
                      width: size.width/2.2,
                      height: size.height>780?size.height*0.065:size.height*0.07,
                      child: OutlinedButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => PublishCourse(3)));
                          },
                          style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              backgroundColor: Color(0xfffff9eb),
                              side: BorderSide(
                                  color: Color(0xffD00000),width: 2
                              )
                          ),
                          child: Text('NEXT',style: TextStyle(color: Color(0xffD00000),fontSize: size.height>780?18:15),)),
                    ),
                  ],
                )
            )
          ],
        ),
      ),
    );
  }
}
