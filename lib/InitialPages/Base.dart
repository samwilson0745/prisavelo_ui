import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

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
  bool _state=false;

  void validation() async{
    final FormState? _formState = _key.currentState;
    if(_formState !=null){
      print("yes");
      if(_formState.validate()){
        try{
          //UserCredential result = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
        }catch(e){
          // ScaffoldMessenger.of(context).showSnackBar(_showSnackBar(e.toString()));
        }
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    void changeIt(pos){
      setState(()=>{
        _opacity=pos
      });
    }
    void changeState(){
      setState(()=>{
        _state=false
      });
    }

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
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
          maxHeight: size.height/1.7,
          minHeight: size.height/18,
          parallaxEnabled: true,
          parallaxOffset: 0.5,
          body: Stack(
              children: <Widget>[
                size.height>780?Positioned(
                    top: size.height/3.9,
                    left: size.width/3.4,
                    child: Image.asset('assets/whiteLogo.png',width: size.width/2.4,height:size.height/2.4,)
                ):Positioned(
                    top: size.height/3.7,
                    left: size.width/3.2,
                    child: Image.asset('assets/whiteLogo.png',width: size.width/2.7,height:size.height/2.8,)
                ),
                _state?Positioned(
                    top: size.height/1.75,
                    left: size.width*0.05,
                    child: AnimatedOpacity(
                      duration: Duration(milliseconds: 2),
                      opacity: _opacity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Hi.",style: TextStyle(fontWeight:FontWeight.bold,fontSize: size.height*0.04),),
                          Text("Welcome!",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: size.height*0.04),)
                        ],
                      ),
                    )
                ):Positioned(
                    top: size.height/1.75,
                    left: size.width*0.05,
                    child: AnimatedOpacity(
                      duration: Duration(milliseconds: 2),
                      opacity: _opacity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Hello.",style: TextStyle(fontWeight:FontWeight.bold,fontSize: size.height*0.04),),
                          Text("Welcome Back!",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: size.height*0.04),)
                        ],
                      ),
                    )
                ),
                Positioned(
                    top: size.height/1.46,
                    left: size.width*0.05,
                    child: AnimatedOpacity(
                      duration: Duration(milliseconds: 2),
                      opacity: 1.0-_opacity,
                      child: size.height>789?Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text("Swipe Up ",style: TextStyle(fontWeight:FontWeight.bold,fontSize: size.height*0.046),),
                              Text("to",style: TextStyle(color:Colors.white,fontWeight:FontWeight.bold,fontSize: size.height*0.046),),
                            ],
                          ),
                          Text("explore a new world\nof Lifestyle",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: size.height*0.046),)
                        ],
                      ):Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text("Swipe Up ",style: TextStyle(fontWeight:FontWeight.bold,fontSize: size.height*0.049),),
                              Text("to",style: TextStyle(color:Colors.white,fontWeight:FontWeight.bold,fontSize: size.height*0.049),),
                            ],
                          ),
                          Text("explore a new world\nof Lifestyle",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: size.height*0.049),)
                        ],
                      ),
                    )
                ),
                Positioned(
                  top:size.height/1.16,
                  left: size.width/2.3,
                  child: Image.asset('assets/arrowImage.png',width: size.width*0.11,color: Colors.white,),)

              ]
          ),
          panel:_state?_panel("Create an Account","Already have an account","Sign Up","Login",size):_panel("Enter your Login Details","Do You have an account","Login","Sign Up",size),
          onPanelClosed: ()=>changeState(),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30)
          ),
        ),
      ),
    );
  }

  Widget _panel(String header,String text,String buttonText,String linkText,Size size){
    return  GestureDetector(
      onTap: (){
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: size.width*0.03),
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
                margin: EdgeInsets.symmetric(vertical: size.height*0.03),
                width: size.width/5,
                color: Colors.black,
                height: 4,
              ),
              Text(header,style: TextStyle(fontSize: size.height*0.03),),
              size.height>789?Expanded(
                flex:5,
                child:Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Text("Email",style: TextStyle(fontSize: size.height*0.02),),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: TextFormField(
                          controller: _email,
                          onChanged: (value){
                            setState(() {
                              email=value;
                            });
                          },
                          validator: (value){
                            if(value == ""){
                              return "Please fill email";
                            }
                            if(!regExp.hasMatch(value.toString())){
                              return "Email is Invalid";
                            }
                          },
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
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Text("Password"),
                      ),
                    ),
                    Expanded(
                      flex: 4,
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
                            contentPadding: EdgeInsets.symmetric(horizontal: size.width*0.025,vertical: size.height*0.02),
                            prefixIconConstraints: BoxConstraints(
                                minHeight: 15,
                                minWidth: 15
                            ),
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
                  ],
                ) ,
              ):Expanded(
                flex:7,
                child:Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Text("Email",style: TextStyle(fontSize: size.height*0.02),),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: TextFormField(
                          controller: _email,
                          onChanged: (value){
                            setState(() {
                              email=value;
                            });
                          },
                          validator: (value){
                            if(value == ""){
                              return "Please fill email";
                            }
                            if(!regExp.hasMatch(value.toString())){
                              return "Email is Invalid";
                            }
                          },
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
                            contentPadding: EdgeInsets.symmetric(horizontal: size.width*0.025,vertical: size.height*0.023),
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
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Text("Password"),
                      ),
                    ),
                    Expanded(
                      flex: 4,
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
                            contentPadding: EdgeInsets.symmetric(horizontal: size.width*0.025,vertical: size.height*0.02),
                            prefixIconConstraints: BoxConstraints(
                                minHeight: 15,
                                minWidth: 15
                            ),
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
                  ],
                ) ,
              ),

              Expanded(
                  flex: 5,
                  child:Container(
                    child: Column(
                      children: [
                        Align(alignment: Alignment.topRight,child: _state?null:GestureDetector(onTap:null,child: Text("Forget Password?",style: TextStyle(fontWeight: FontWeight.bold),))),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: size.height*0.01),
                          width: size.width,
                          height: size.height*0.065,
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
                          padding:EdgeInsets.symmetric(horizontal: size.width*0.04,vertical: size.height*0.01),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(text),
                              GestureDetector(
                                onTap: (){
                                  setState(()=>{
                                    _state=!_state,
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
                        size.height>789?Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: Image.asset('assets/facebook.png',width: 25,height: 25,),
                            ),
                            Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 5),
                              child: Image.asset('assets/google.png',width: 25,height: 25,),
                            )
                          ],
                        ):Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: Image.asset('assets/facebook.png',width: 22,height: 22,),
                            ),
                            Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 5),
                              child: Image.asset('assets/google.png',width: 22,height: 22,),
                            )
                          ],
                        )
                      ],
                    ),
                  ) )
            ],
          ),
        ),

      ),
    );
  }
}
