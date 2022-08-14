import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class Profile extends StatefulWidget{


  @override
  profileState createState () => profileState();

}
class profileState extends State<Profile>{

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xfffff9eb),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(top: 15),
            alignment: Alignment.center,
            child: Column(
              children: [
                size.height>789?CircleAvatar(
                  radius: size.height*0.08,
                  backgroundImage: NetworkImage('https://picsum.photos/300'),
                ):CircleAvatar(
                  radius: size.height*0.09,
                  backgroundImage: NetworkImage('https://picsum.photos/300'),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: size.height*0.02),
                  child: Text('Sayak Ghosh',style:TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 25)),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: size.height*0.025),
                  child: Text('username@username',style:TextStyle(color: Colors.black,fontSize: 15)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      child: TextButton(
                          onPressed: (){},
                          child: Column(
                            children: [
                              Text('150k',style: TextStyle(color:Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                              SizedBox(height: 8,),
                              Text('Following',style: TextStyle(color: Colors.grey[600]),),
                            ],
                          )
                      ),
                    ),
                    Container(height: 20,width: 10,child: VerticalDivider(color:Colors.black,thickness: 2,),),
                    Container(
                      width: 100,
                      child: TextButton(
                          onPressed: (){},
                          child: Column(
                            children: [
                              Text('200',style: TextStyle(color:Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                              SizedBox(height: 8,),
                              Text('Followers',style: TextStyle(color: Colors.grey[600]),),
                            ],
                          )
                      ),
                    ),
                    Container(height: 20,width: 10,child: VerticalDivider(color:Colors.black,thickness: 2,),),
                    Container(
                      width:100,
                      child: TextButton(
                          onPressed: (){},
                          child: Column(
                            children: [
                              Text('456',style: TextStyle(color:Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                              SizedBox(height: 8,),
                              Text('Posts',style: TextStyle(color: Colors.grey[600]),),
                            ],
                          )
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: size.height*0.01),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: size.height*0.002),
                        child: Container(
                          height: 40,
                          width: 120,
                          child: TextButton(
                              onPressed: (){},
                              style: ElevatedButton.styleFrom(
                                  primary: Color(0xffD00000)
                              ),
                              child: Text('Edit Profile',style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold))//Text('Message',style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold))//
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: size.height*0.02),
                  child: Container(
                    width: size.height*0.4,
                    child: size.height>780?ReadMoreText('Mr.Perfect\nSimple boy\nMusic Lover', trimLines: 2,
                      colorClickableText: Color(0xffD00000),
                      trimMode: TrimMode.Line,
                      trimCollapsedText: 'Show more',
                      trimExpandedText: '\nShow less',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: size.height*0.025,color: Colors.black,fontWeight: FontWeight.w400),
                    ):ReadMoreText('Mr.Perfect\nSimple boy\nMusic Lover', trimLines: 2,
                      colorClickableText: Color(0xffD00000),
                      trimMode: TrimMode.Line,
                      trimCollapsedText: 'Show more',
                      trimExpandedText: '\nShow less',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: size.height*0.026,color: Colors.black,fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: size.height*0.02),
            width: size.width,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(width: 0.5,color: Colors.grey)
              )
            ),
          )
        ],
      ),
    );
  }
}
