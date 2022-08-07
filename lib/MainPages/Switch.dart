import 'package:flutter/material.dart';
import 'package:prisavelo_ui/MainPages/mainPage.dart';
class SwitchtoProf extends StatefulWidget {
  const SwitchtoProf({Key? key}) : super(key: key);

  @override
  State<SwitchtoProf> createState() => _SwitchtoProfState();
}

class _SwitchtoProfState extends State<SwitchtoProf> {

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
    Size size=MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
          backgroundColor: Color(0xff03071e),
          body: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Container(
                  width: size.width,
                  height: size.height,
                  child: Column(
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
                                  'Switch to Professional',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: size.height*0.043,
                                      fontWeight: FontWeight.bold
                                  ),
                                ):Text(
                                  'Switch to Professional',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: size.height*0.055,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ],
                          )
                      ),
                      Expanded(
                        flex: size.height>780?9:8,
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
                                  padding: EdgeInsets.symmetric(vertical: size.height*0.03),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex:4,
                                        child: CircleAvatar(
                                          radius: size.height>780?size.height*0.045:size.height*0.05,
                                          backgroundColor: Color(0xffD00000),
                                        )
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
                                          child: IconButton(onPressed: (){print('hello');}, icon: Icon(Icons.arrow_forward_ios,color: Colors.black,size: size.height*0.03,)))
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding:EdgeInsets.symmetric(horizontal: size.width*0.01,vertical: size.height*0.005),
                                child: Text('Describe your Expertise',style: TextStyle(fontSize: size.height*0.02),),
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
                                    hintText: "Email",
                                    hintStyle: TextStyle(color: Colors.black),
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
                                    size.height>780?Text('CATEGORIES',style: TextStyle(fontSize:size.height*0.018,fontWeight: FontWeight.bold),):Text('CATEGORIES',style: TextStyle(fontWeight: FontWeight.bold),),
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
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: size.width*0.01,vertical: size.height*0.005),
                                child: Text('Certificate Name',style: TextStyle(fontSize: size.height*0.02),),
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
                                    hintText: "Enter Certificate Name",
                                    hintStyle: TextStyle(color: Colors.black),
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
                                padding: EdgeInsets.symmetric(vertical: size.height*0.02),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    size.height>780?Text('Certificate Document(Option):\nJPEG or PNG',style: TextStyle(fontWeight: FontWeight.bold,fontSize: size.height*0.022),):Text('Certificate Document(Option):\nJPEG or PNG',style: TextStyle(fontWeight: FontWeight.bold,fontSize: size.height*0.025),),
                                    ElevatedButton(
                                        onPressed: (){},
                                        style: ButtonStyle(
                                            backgroundColor: MaterialStateProperty.all(Color(0xffD00000)),
                                            shape: MaterialStateProperty.all(
                                                RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(10),
                                                )
                                            )
                                        ),
                                        child: Text('UPLOAD'))
                                  ],
                                ),
                              ),
                              size.height>780?Padding(
                                padding: EdgeInsets.only(top: size.height*0.05,left: size.width*0.01),
                                child: Text('Disclaimer: Switching your profile to professional will give you the rights to provide your experties to clients.',style: TextStyle(fontSize: size.height*0.02,color: Colors.grey[600]),),
                              ):Padding(
                                padding: EdgeInsets.only(top: size.height*0.02,right: size.height*0.02),
                                child: Text('Disclaimer: Switching your profile to professional will give you the rights to provide your experties to clients.',style: TextStyle(fontSize: size.height*0.02),),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: size.height*0.01),
                                width: size.width,
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
                                    child: Text('Switch to Professional',style: TextStyle(color: Color(0xffD00000),fontSize: 18),)),
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
      ),
    );
  }
  Widget _button(String name,Size size,int value){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: size.width*0.01),
      width: size.width*0.215,
      height: size.height>780?size.height*0.05:size.height*0.06,
      child: OutlinedButton(
          onPressed: (){
            setState(()=>{
              _state=value
            });
          },
          style: OutlinedButton.styleFrom(
              backgroundColor: Color(0xfffff9eb),
              side: BorderSide(
                  color: _state==value?Color(0xffD00000):Colors.black
              )
          ),
          child: Text(name,style: TextStyle(color: _state==value?Color(0xffD00000):Colors.black,fontSize: size.height*0.02),)),
    );
  }
}
