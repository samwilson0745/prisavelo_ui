import 'dart:async';

import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
class Explore extends StatefulWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
 final StreamController<List> profileController=new StreamController<List>();

 @override
 void dispose(){
   super.dispose();
   profileController.close();
 }
 @override
 void initState(){
   super.initState();
   // profileController.sink.add(profiles);//this is adding the profile when the page is loaded to the stream controller
 }
 
  List profiles=[
    {
      "username":'Sayak Ghosh',
      "likeStatus":false,
      "likes":28,
      "comments":26,
      "followStatus":true
    },
    {
      "username":'Soham Deb',
      "likeStatus":true,
      "likes":18,
      "comments":26,
      "followStatus":false
    },
    {
      "username":'godFather',
      "likeStatus":false,
      "likes":38,
      "comments":26,
      "followStatus":true
    },
    {
      "username":'punnyartha banerjee',
      "likeStatus":true,
      "likes":18,
      "comments":26,
      "followStatus":true
    },
    {
      "username":'Sayak Ghosh',
      "likeStatus":true,
      "likes":18,
      "comments":26,
      "followStatus":false
    },
  ];
 void _increment(int index){
   setState(
       ()=>{
         profiles[index]["likes"]++
       }
   );
 }
 void _decrement(int index){
   setState(
       ()=>{
         profiles[index]["likes"]--
       }
   );
 }

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return StreamBuilder(
        initialData: profiles,
        stream: profileController.stream,
        builder: (context,AsyncSnapshot snapshot){
          if(snapshot.data != null){
            return PageView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 5,
                itemBuilder:(context,index){
                  return Scaffold(
                    appBar: AppBar(
                      backgroundColor: Color(0xff03071E),
                      leading: IconButton(
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_circle_left_outlined),
                      ),
                      title: GestureDetector(
                        onTap: (){},
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: size.height>780?20:18,
                            ),
                            SizedBox(width: 10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(snapshot.data[index]['username'],style: TextStyle(color: Colors.white,fontSize: 12),),
                                Text('12 min go',style: TextStyle(color: Colors.white,fontSize: 10))
                              ],
                            ),
                          ],
                        ),
                      ),
                      actions: [
                        SizedBox(
                          width: size.width*0.25,
                          child: snapshot.data[index]["followStatus"]==true?OutlinedButton(onPressed: (){
                            setState(()=>{
                              snapshot.data[index]["followStatus"]=!snapshot.data[index]["followStatus"]
                            });

                          },
                              child: Text('Following',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 13),)):ElevatedButton(onPressed: (){
                            setState(()=>{
                              snapshot.data[index]["followStatus"]=!snapshot.data[index]["followStatus"]
                            });
                          },
                              style:ElevatedButton.styleFrom(
                                primary: Color(0xffD00000),
                                onPrimary: Colors.white,

                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              child: Text('Follow',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),)),
                        )
                      ],
                      toolbarHeight: size.height>780?40:35,
                      elevation: 0.0,
                    ),
                    backgroundColor: Color(0xff03071E),
                    body: Container(
                      child: Stack(
                        children: [
                          Center(
                            child: Container(
                              width: size.width,
                              height: size.height/3.5,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(
                                          'https://picsum.photos/id/${index + 1047}/800/1080'
                                      )
                                  )
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: size.width*0.02,vertical: size.height*0.02),
                              child: Container(
                                  width: size.width*0.8,
                                  padding: EdgeInsets.only(bottom: 10),
                                  child:ReadMoreText(
                                    'Mr.Perfect Simple boy Music Loverhekfnweilfniwefwneifnifniownfionwionfiowefonwiofnwionfiowenfonwiofwiofoinfoinwifnifninfiqniofnqoinfqionfqinfiehfihfhifhihfiqhfihqifhiqhfiqhfihqifhiqhfiqhihqfihqihifhqifhiqfhiqhfihfiqhfiqhfiqhfiqhihqfihqifhqifhqifhqifhqiwfhwifhifhiqhfihfmnclanfdlnafklfnlqiwnhfoiehfihwifhwihfihifhifhihfiqhfianlifnlqnfnalienvneifhqioehfiqhifhqihfihhafehfihifhqifhihfiqhiqhfihqifhiqhfihfiheiofhiofhiohfiehfioehfiohfiohfihfihfihfioehqihfiqhiohwfihfeihwihwifhwihwihfwihfiiqnfieqnefiqniofnqeifnubvbeofbqphfiqfifhuihfuihufhuhfuihfuihuifehuifhuihefuihefuihewfuhuiwefhuiehfuhfuhefiuhqfuihuih', trimLines: 2,
                                    colorClickableText: Color(0xffD00000),
                                    trimMode: TrimMode.Line,
                                    trimCollapsedText: 'Show more',
                                    trimExpandedText: '\nShow less',
                                    style: TextStyle(fontSize: size.height>780?15:12,color: Colors.white,fontWeight: FontWeight.w400),
                                  )
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              height: size.height>780?size.height*0.28:size.height*0.31,
                              width: size.width*0.16,
                              child: Column(
                                children: [
                                  IconButton(
                                    onPressed: (){
                                      setState(
                                              ()=>{
                                            snapshot.data[index]["likeStatus"]=!profiles[index]["likeStatus"]
                                          }
                                      );
                                      if(snapshot.data[index]["likeStatus"]==true){
                                        _increment(index);
                                      }
                                      else{
                                        _decrement(index);
                                      }
                                    },
                                    icon: Icon(snapshot.data[index]["likeStatus"]==true?Icons.favorite:Icons.favorite_border_outlined,color: profiles[index]["likeStatus"]==true?Colors.red:Colors.white,size: size.height>780?size.height*0.05:size.height*0.04,),
                                  ),
                                  SizedBox(height: size.height>780?size.height*0.01:0.05,),
                                  Padding(
                                    padding:  EdgeInsets.only(left: size.height>780?size.width*0.02:size.width*0.01),
                                    child: Text('${snapshot.data[index]["likes"]}',style: TextStyle(color: Colors.white,fontSize: size.height*0.02,fontWeight: FontWeight.bold),),
                                  ),
                                  // SizedBox(height: 5,),
                                  IconButton(onPressed: (){}, icon: Icon(Icons.comment,color: Colors.white,size: size.height>780?size.height*0.05:size.height*0.04,),),
                                  // SizedBox(height: 5,),
                                  Padding(
                                    padding:  EdgeInsets.only(left: size.height>780?size.width*0.02:size.width*0.01),
                                    child: Text('${snapshot.data[index]["comments"]}',style: TextStyle(color: Colors.white,fontSize: size.height*0.02,fontWeight: FontWeight.bold),),
                                  ),
                                  IconButton(onPressed: (){}, icon: Icon(Icons.bookmark_add_outlined,color: Colors.white,size: size.height*0.05,),),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }

            );
          }
          else{
            return Text('No data');
          }
    });
  }
}