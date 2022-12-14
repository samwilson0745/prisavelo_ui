import 'package:flutter/material.dart';
import 'package:prisavelo_ui/MainPages/mainPage.dart';

class FindCourse extends StatefulWidget {
  const FindCourse({Key? key}) : super(key: key);

  @override
  State<FindCourse> createState() => _FindCourseState();
}

class _FindCourseState extends State<FindCourse> {

  List category=['Cardio','Gym','Yoga'];
  int _state=0;

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: (){
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: IconButton(
            onPressed: (){},
            icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
          ),
          backgroundColor: Color(0xff03071e),
          toolbarHeight: 45,
          elevation: 0.0,
        ),
        backgroundColor: Color(0xff03071e),
        body: Container(
                  width: size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: size.width*0.06,vertical: size.height*0.01),
                              child: Text("Find Course",style: TextStyle(color: Colors.white,fontSize: size.height*0.04,fontWeight: FontWeight.w800),),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: size.width*0.04),
                              child: TextField(
                                  decoration:InputDecoration(
                                    prefixIcon: Image.asset('assets/search-2-line.png'),
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText: "Search",
                                    hintStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                                    contentPadding: EdgeInsets.all(size.height*0.01),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Color(0xff03071e),width:1),
                                        borderRadius: BorderRadius.all(Radius.circular(30))
                                    ),
                                    focusedBorder:  OutlineInputBorder(
                                        borderSide: BorderSide(color: Color(0xff03071e),width: 1),
                                        borderRadius: BorderRadius.all(Radius.circular(30))
                                    ),
                                  )
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                          flex: size.height>780?10:9,
                          child:  Container(
                          width: size.width,
                          height: size.height,
                          decoration: BoxDecoration(
                              color: Color(0xfffff9eb),
                              borderRadius: BorderRadius.vertical(top:Radius.circular(30))
                          ),
                          child:Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: size.height*0.02,horizontal: size.width*0.035),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Categories',style: TextStyle(fontWeight: FontWeight.bold),),
                                    Row(
                                      children: [
                                        _button("Cardio", size, 0),
                                        _button("Gym", size, 1),
                                        _button("Yoga", size, 2),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Divider(
                                height: 5,
                                color: Colors.grey,
                              ),
                              Expanded(
                                  flex: 4,
                                  child:ListView(
                                    children: [
                                      _ListTile(size, 'Gy', 'GYM', 'Sayak Ghosh', 'image', 'Description : sdjsdj a ds sdg s gsg sdg sdg sdg s gsdg sg sdg sdg sdgsf fsgsg h dfhfd hfdhdf hdfh dfh dh df', 'coverImage'),
                                      _ListTile(size, 'Gy', 'GYM', 'Sayak Ghosh', 'image', 'Description : sdjsdj a ds sdg s gsg sdg sdg sdg s gsdg sg sdg sdg sdgsf fsgsg h dfhfd hfdhdf hdfh dfh dh df', 'coverImage'),
                                      _ListTile(size, 'Gy', 'GYM', 'Sayak Ghosh', 'image', 'Description : sdjsdj a ds sdg s gsg sdg sdg sdg s gsdg sg sdg sdg sdgsf fsgsg h dfhfd hfdhdf hdfh dfh dh df', 'coverImage'),
                                    ],
                                  )
                              )
                            ],
                          )
                          ))
                    ],
                  ),

                ),
      ),
    );
  }
  Widget _ListTile(Size size,String topic,String category,String profileName,String profileImage,String description,String coverImage){
    return Container(
      width: size.width,
      margin: EdgeInsets.symmetric(horizontal: size.width*0.015,vertical: size.height*0.01),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width:size.width*0.35,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network('https://picsum.photos/300')),//Image.network(coverImage))
          ),
          Expanded(
              flex: 5,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: size.width*0.02),
                height: size.height*0.2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(topic, maxLines:2,overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xffD00000),fontSize: size.height>780?18:10)),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: size.height*0.005),
                      child: Row(
                        children: [
                          Text('Category',style: TextStyle(fontWeight: FontWeight.bold),),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: size.width*0.04),
                            width: 60,
                            height: 25,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.red,width: 2)
                            ),
                            child: Center(child: Text(category,style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 12),),),
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: size.height>780?13:10,
                              // backgroundImage: NetworkImage(profileImage),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: size.width*0.01),
                              child: Text(profileName,style:TextStyle(fontSize: size.height>780?14:12,fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                        Container(
                          height: size.height>780?40:30,
                          width: size.height>780?40:30,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(size.height>780?20:15)
                          ),

                          child: Icon(Icons.add,color:Colors.white,),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Text(description,style: TextStyle(fontSize: size.height>780?12:10),maxLines: 1,overflow: TextOverflow.ellipsis,),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
  Widget _button(String name,Size size,int value){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: size.width*0.01),
      width: size.width*0.21,
      height: size.height>780?size.height*0.04:size.height*0.05,
      child: OutlinedButton(
          onPressed: (){
            setState(()=>{
              _state=value
            });
          },
          style: OutlinedButton.styleFrom(
              backgroundColor: Color(0xfffff9eb),
              side: BorderSide(
                  color: _state==value?Color(0xffD00000):Colors.black,
                width: _state==value?3:2
              ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          child: Text(name,style: TextStyle(color: _state==value?Color(0xffD00000):Colors.black,fontSize: size.height*0.02,fontWeight: _state==value?FontWeight.bold:null))),
    );
  }
}
