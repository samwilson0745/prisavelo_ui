import 'package:flutter/material.dart';
import 'package:prisavelo_ui/MainPages/mainPage.dart';

class PublishCourse extends StatefulWidget {
  final int itemsLength;
  PublishCourse(this.itemsLength);

  @override
  State<PublishCourse> createState() => _PublishCourseState();
}

class _PublishCourseState extends State<PublishCourse> {

  Widget _customMakeTitle(Size size,String name,int index){
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
          Container(
            width: size.width*0.3,
            padding: EdgeInsets.symmetric(horizontal: size.width*0.02 ),
            child: Text(
              name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              maxLines: 1,overflow: TextOverflow.ellipsis,
            ),
          ),
          ButtonTheme(
            child:ElevatedButton(
                onPressed: (){

                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xffD00000),
                  onPrimary: Colors.white,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  minimumSize: Size(size.width*0.1, size.height*0.05), //////// HERE
                ),
                child:Icon(Icons.play_arrow)
            ),
          ),
          Container(
              width: size.width*0.3,
              height: size.height*0.05,
              child: ElevatedButton(
                  onPressed: (){},
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xffD00000),
                    onPrimary: Colors.white,

                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    minimumSize: Size(size.width*0.35, size.height*0.05), //////// HERE
                  ),
                  child: Text('REUPLOAD',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),))
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
                  child: Icon(Icons.edit,size: 20,)
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
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text( "Course Name Will be here and the...",
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900),),
              Text("${widget.itemsLength}/${widget.itemsLength}",style: TextStyle(color: Colors.black),)
            ],
          )
        ),
        body: Column(
          children: [
            Expanded(
                flex: 8,
                child: ListView(
                  children: [
                    _customMakeTitle(size, "Indiaeihfoiuweguigwuigwsviuweovnwoievnoiwveonwaeovn", 0)
                  ],
                )
            ),
            Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: size.width/1.05,
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
                          child: Text('Publish',style: TextStyle(color: Color(0xffD00000),fontSize: size.height>780?18:15),)),
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
