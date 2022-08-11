import 'package:flutter/material.dart';

class AddCourse extends StatefulWidget {

  @override
  State<AddCourse> createState() => _AddCourseState();
}

class _AddCourseState extends State<AddCourse> {

  TextEditingController _description = new TextEditingController();
  TextEditingController _certificate = new TextEditingController();
  List category=['Cardio','Gym','Yoga'];
  int _state=0;

  @override
  void initState(){
    setState(()=>{
      _state=0
    });
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff03071e),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Container(
              width: size.width,
              height: size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      flex: 2,
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: size.width*0.04),
                            child: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios,color: Colors.white,size: size.height*0.035,)),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: size.width*0.06,vertical: size.width*0.01),
                            child: size.height>780?Text(
                              'Start\nAdding Course',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: size.height*0.043,
                                  fontWeight: FontWeight.bold
                              ),
                            ):Text(
                              'Start\nAdding Course',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: size.height*0.05,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ],
                      )
                  ),
                  Expanded(
                    flex: size.height>780?8:6,
                    child: Container(
                      padding: EdgeInsets.symmetric( horizontal:size.width*0.022,),
                      width: size.width,
                      height:size.height/1.3,
                      decoration: BoxDecoration(
                          color: Color(0xfffff9eb),
                          borderRadius: BorderRadius.vertical(top: Radius.circular(15))
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Padding(
                              padding: EdgeInsets.only(top: size.height*0.03,bottom: size.height*0.03),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex:4,
                                    child: CircleAvatar(
                                      radius: size.height>780?size.height*0.045:size.height*0.05,
                                      backgroundColor: Color(0xffD00000),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 7,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Sayak Ghosh',style: TextStyle(fontSize: size.height>789?size.height*0.035:size.height*0.04,fontWeight: FontWeight.bold),),
                                        Padding(
                                          padding: EdgeInsets.only(bottom: size.height*0.01),
                                          child: Text('username@username'),
                                        )
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                      flex: 3,
                                      child: IconButton(onPressed: (){print('hello');}, icon: Icon(Icons.info_outline,color: Colors.black,size: size.height*0.04,)))
                                ],
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              size.height>780?Text('Upload cover image\n(400px X 200px) Preview',style: TextStyle(fontWeight: FontWeight.bold,fontSize: size.height*0.022),):Text('Upload cover image\n(400px X 200px) Preview',style: TextStyle(fontWeight: FontWeight.bold,fontSize: size.height*0.025),),
                              InkWell(
                                onTap: (){},
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: size.width*0.02),
                                  width: size.height>780?size.width/4.5:size.width/5,
                                  height: size.height>780?size.height/9:size.height/8.5,
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          ),

                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: size.width*0.01,vertical: size.height*0.005),
                            child: Text('Course Name',style: TextStyle(fontSize: size.height*0.02),),
                          ),
                          TextField(
                              controller: _certificate,
                              decoration:InputDecoration(
                                isDense: true,
                                focusedErrorBorder:OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red,width: 2),
                                    borderRadius: BorderRadius.all(Radius.circular(10))
                                ),
                                errorBorder:  OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red,width: 2),
                                    borderRadius: BorderRadius.all(Radius.circular(10))
                                ),
                                hintText: "Enter The Course Name",
                                hintStyle: TextStyle(color: Colors.grey[600]),
                                contentPadding: EdgeInsets.symmetric(horizontal: size.width*0.025,vertical: size.height*0.02),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black,width:1),
                                    borderRadius: BorderRadius.all(Radius.circular(10))
                                ),
                                focusedBorder:  OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black,width: 1),
                                    borderRadius: BorderRadius.all(Radius.circular(10))
                                ),
                              )
                          ),

                          Padding(
                            padding:EdgeInsets.symmetric(horizontal: size.width*0.01,vertical: size.height*0.01),
                            child: Text('Description',style: TextStyle(fontSize: size.height*0.02),),
                          ),
                          TextField(
                              controller: _description,
                              maxLines: size.height>780?3:2,
                              keyboardType: TextInputType.multiline,
                              decoration:InputDecoration(
                                isDense: true,
                                focusedErrorBorder:OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red,width: 2),
                                    borderRadius: BorderRadius.all(Radius.circular(10))
                                ),
                                errorBorder:  OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red,width: 2),
                                    borderRadius: BorderRadius.all(Radius.circular(10))
                                ),
                                hintText: "Write About The Course min 70 words...",
                                hintStyle: TextStyle(color: Colors.grey[600]),
                                contentPadding: EdgeInsets.symmetric(horizontal: size.width*0.025,vertical: size.height*0.02),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black,width:1),
                                    borderRadius: BorderRadius.all(Radius.circular(10))
                                ),
                                focusedBorder:  OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black,width: 1),
                                    borderRadius: BorderRadius.all(Radius.circular(10))
                                ),
                              )
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: size.height>780?size.height*0.03:size.height*0.02,horizontal: size.width*0.005),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                size.height>780?Text('Categories',style: TextStyle(fontSize:size.height*0.018,fontWeight: FontWeight.bold),):Text('Categories',style: TextStyle(fontWeight: FontWeight.bold),),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    _button('CARDIO',size,0),
                                    _button('GYM',size,1),
                                    _button('YOGA',size,2)
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: size.height>780?size.height*0.12:size.height*0.04),
                            width: size.width,
                            height: size.height>780?size.height*0.06:size.height*0.07,
                            child: OutlinedButton(
                                onPressed: (){},
                                style: OutlinedButton.styleFrom(
                                    backgroundColor: Color(0xfffff9eb),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    side: BorderSide(
                                        color: Color(0xffD00000),width: 2
                                    )
                                ),
                                child: Text('NEXT',style: TextStyle(color: Color(0xffD00000),fontSize: 15),)),
                          )
                        ],
                      ),
                    ),
                  )

                ],
              ),
            ),
          )
        ],
      )
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
                width: _state==value?2:1
              )
          ),
          child: Text(name,style: TextStyle(color: _state==value?Color(0xffD00000):Colors.black,fontSize: size.height*0.015,fontWeight: _state==value?FontWeight.bold:null))),
    );
  }

}
