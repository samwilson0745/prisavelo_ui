// import 'package:e_comm/frontPages/SignUp.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
RegExp regExp = new RegExp(p);
final GlobalKey<FormState> _key = GlobalKey<FormState>();
String email="",password="";

class _LoginState extends State<Login> {

  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  bool _passwordVisible=true;

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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Container(
                width: double.infinity,
                child: Form(
                  key: _key,
                  child: Column(

                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 18),
                        height: 5,
                        width: 100,

                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.all(Radius.circular(30))
                        ),
                      ),
                      Text('Enter Your login Details',style: TextStyle(fontSize: 25),),

                      Expanded(
                        flex:6,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10),
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
                                        hintText: "Email",
                                        hintStyle: TextStyle(color: Colors.black),
                                        border: OutlineInputBorder()
                                    )
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10),
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
                                        border: OutlineInputBorder()
                                    )
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 10),
                                width: double.infinity,
                                height: 50,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(Color(0xff7751FF)),
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(30.0),
                                          )
                                      )
                                  ),
                                  onPressed: (){
                                    validation();
                                  },
                                  child: Text(
                                      'Login'
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Text("Dont have an account? "),
                                  GestureDetector(
                                    onTap: (){
                                      // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>SignUp()));
                                    },
                                    child: Text(
                                      "Register",
                                      style: TextStyle(
                                          color:Colors.cyan
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
