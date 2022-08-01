import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:prisavelo_ui/InitialPages/Login.dart';

class Base extends StatefulWidget {
  const Base({Key? key}) : super(key: key);

  @override
  State<Base> createState() => _BaseState();
}

String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
RegExp regExp = new RegExp(p);
final GlobalKey<FormState> _key = GlobalKey<FormState>();
String email="",password="";

class _BaseState extends State<Base> {

  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  bool _passwordVisible=true;
  double _opacity=0.0;

  SnackBar _showSnackBar(String text){
    return SnackBar(
      content: Text(text),
    );
  }
  void validation() async{
    final FormState? _formState = _key.currentState;
    if(_formState !=null){
      print("yes");
      if(_formState.validate()){
        try{
          //UserCredential result = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
        }catch(e){
          ScaffoldMessenger.of(context).showSnackBar(_showSnackBar(e.toString()));
        }
      }
    }
  }

  double _imageHeight=0.0,_textHeight=0.0,_panelText=0.0;
  String subtile='Swipe Up to explore a new world of Lifestyle';
  bool _visible=true,state=false;

  @override
  Widget build(BuildContext context) {

    double _width=MediaQuery.of(context).size.width;
    double _height=MediaQuery.of(context).size.height;
    _imageHeight=_height/3;
    _textHeight=_height/1.4;
    _panelText=_height/1.76;

    void changeIt(pos){
      setState(()=>{
        _imageHeight=pos*_height/10,
        _opacity=pos
      });
    }

    return Scaffold(
      body:Container(
          width: _width,
          height:_height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xff03071e),
                    Color(0xffd74343),
                    Color(0xffD00000)
                  ]
              )
          ),
          child: SlidingUpPanel(
            onPanelSlide: (double pos)=>changeIt(pos),
            maxHeight: _height/1.73,
            minHeight: 40,
            parallaxEnabled: true,
            parallaxOffset: 0.5,
            body: Stack(
                children: <Widget>[
                  Positioned(
                      top: _imageHeight,
                      left: _width/3.5,
                      child: Image.asset('assets/whiteLogo.png',width: _width * 0.42,height: _height*0.28,)
                  ),

                  Positioned(
                      top: _panelText,
                      left: _width*0.05,
                      width: 342,
                      child: AnimatedOpacity(
                        duration: Duration(milliseconds: 2),
                          opacity: _opacity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Hello",style: TextStyle(fontSize: _height*0.04,fontWeight: FontWeight.bold,color: Colors.white),),
                              Text("Welcome Back!",style: TextStyle(fontSize: _height*0.04,fontWeight: FontWeight.bold),)
                            ],
                          ))
                  ),
                  Positioned(
                      top: _textHeight,
                      left: _width*0.05,
                      width: 342,
                      child: AnimatedOpacity(
                          duration: Duration(milliseconds: 2),
                          opacity: 1.0-_opacity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text("Swipe up",style: TextStyle(fontSize: _height*0.05,fontWeight: FontWeight.bold),),
                                  Text(" to",style: TextStyle(fontSize: _height*0.05,fontWeight: FontWeight.bold,color: Colors.white),)
                                ],
                              ),
                              Text("explore a New World of Lifestyle",style: TextStyle(fontSize: _height*0.05,fontWeight: FontWeight.bold,color: Colors.white),)
                            ],
                          ))
                  ),]),
            panel: state?_panel("Create an Account","Already have an account","Sign Up","Login"):_panel("Enter your Login Details","Do You have an account","Login","Sign Up"),
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30)
      ),
    )


    ));
  }
  Widget _panel(String header,String text,String buttonText,String linkText){
    return  GestureDetector(
      onTap: (){
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Color(0xfffff9eb),
                borderRadius: BorderRadius.vertical(top:Radius.circular(30))
              ),
              child: Form(
                key: _key,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 21),
                      height: 5,
                      width: 80,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(Radius.circular(30))
                      ),
                    ),
                  Padding(padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Text(header,style: TextStyle(fontSize: 22),),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 17,vertical: 10),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Email ID')),
                  ),
                    Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: TextFormField(
                        controller: _email,
                        onChanged: (value){
                          setState(() {
                            email=value;
                          });
                        },
                        validator: (value){
                          if(value == ""){
                            return "PLease fill email";
                          }
                          if(!regExp.hasMatch(value.toString())){
                            return "Email is Invalid";
                          }
                        },
                        decoration:InputDecoration(
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
                          contentPadding: EdgeInsets.all(15),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black,width:1),
                              borderRadius: BorderRadius.all(Radius.circular(15))
                          ),
                          focusedBorder:  OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black,width: 3),
                              borderRadius: BorderRadius.all(Radius.circular(15))
                          ),
                        )
                    ),
                  ),
                    Padding(
                      padding: EdgeInsets.only(top: 20,left: 15),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Password')),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:14,vertical: 10),
                      child: TextFormField(
                          controller: _password,
                          obscureText: _passwordVisible,
                          onChanged: (value){
                            setState(() {
                              password = value;
                            });
                          },
                          validator: (value){
                            if(value==""){
                              return "Please Fill Password";
                            }
                            else if(value!=null){
                              if(value.length<8){
                                return "Password is too short";
                              }
                            }

                            else{
                              return "";
                            }
                          },

                          decoration:InputDecoration(
                            focusedErrorBorder:OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red,width: 2),
                                borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                            errorBorder:  OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red,width: 2),
                                borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                              suffixIcon: GestureDetector(
                                onTap: (){
                                  setState(() {
                                    _passwordVisible=!_passwordVisible;
                                  });
                                },
                                child: Icon(
                                  _passwordVisible?Icons.visibility_off:Icons.visibility,
                                ),
                              ),
                              hintText: "Password",
                              hintStyle: TextStyle(color: Colors.black),
                            contentPadding: EdgeInsets.all(15),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black,width:1),
                                borderRadius: BorderRadius.all(Radius.circular(15))
                            ),
                            focusedBorder:  OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black,width: 3),
                                borderRadius: BorderRadius.all(Radius.circular(15))
                            ),
                          )
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 2),
                        child: Text('Forgot Password?',style: TextStyle(fontWeight: FontWeight.bold),),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10,horizontal: 14),
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Color(0xffD00000)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                )
                            )
                        ),
                        onPressed: (){
                           validation();
                        },
                        child: Text(
                            buttonText
                        ),
                      ),
                    ),
                    Padding(
                      padding:EdgeInsets.symmetric(horizontal: 10,vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("${text}? "),
                          GestureDetector(
                            onTap: (){
                              setState(()=>{
                                state=!state,
                                _email.clear(),
                                _password.clear(),
                              });
                              // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>SignUp()));
                            },
                            child: Text(
                              linkText,
                              style: TextStyle(
                                  color:Color(0xffD00000),
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: Icon(
                              Icons.facebook
                            ),
                          ),
                          Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 5),
                            child: Icon(
                              Icons.mail
                            ),
                          )
                        ],
                      ),
                    )

                ],
              ),
            ),

      ),
    );
  }
}

//
//Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisSize: MainAxisSize.max,
//           children: [
//             Expanded(
//               flex: 8,
//               child: Container(
//                 alignment: Alignment.bottomCenter,
//                 width: MediaQuery.of(context).size.width,
//                 child: Container(
//                     width: 192,
//                     height: 192,
//                   child: Image(
//                     image: AssetImage('assets/whiteLogo.png'),
//                   ),
//                 )
//               ),
//             ),
//             Expanded(
//               flex: 4,
//               child: Container(
//                 alignment: Alignment.center,
//                 padding: EdgeInsets.only(right: 15,left: 15 ,top: 55),
//                 width: 342,
//                 child: Text('Swipe Up to explore a new world of Lifestyle',style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),)
//               ),
//             ),
//             Expanded(
//                 flex: 2,
//                 child: Container())
//           ],
//         )
