import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ChatList extends StatefulWidget {
  const ChatList({Key? key}) : super(key: key);

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {

  PanelController panelController=new PanelController();

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){},
          icon: Icon(Icons.arrow_back_ios,color: Colors.white,size: size.width*0.045,),
        ),
        toolbarHeight: 35,
        backgroundColor: Color(0xff03071e),
        elevation: 0.0,
      ),
      backgroundColor: Color(0xff03071e),
      body: Container(
        width: size.width,
        child: Column(
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width*0.06,vertical: size.height*0.01),
                    child: Text("Chat With\nyour friends!",style: TextStyle(color: Colors.white,fontSize: size.height*0.05,fontWeight: FontWeight.w800),),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: size.width*0.01),
                    width: size.width,
                    child:_createList(size),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: size.height*0.01),
            width: size.width,
            height: size.height/1.5,
            decoration: BoxDecoration(
                color: Color(0xfffff9eb),
                borderRadius: BorderRadius.vertical(top:Radius.circular(30))
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  height: 5,
                  width: 80,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(30))
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (context,index){
                      return _ListItem("image", "Soham", "Yo what up sam here i would like tell you", "18:45", size,);
                    },
                  ),
                )
              ],
            )
        ),

        ],
      ),
    ));
  }
  Widget _createList(Size size){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          child: Column(
          children: [
            CircleAvatar(
              radius: size.height*0.04,
              backgroundColor:Colors.white,
      child: Image.asset('assets/search-2-line.png'),
      // backgroundImage: NetworkImage(image),
          ),
    ],
    )
    ),
        _User("image", size,Colors.redAccent),
        _User("image", size,Colors.blueAccent),
        _User("image", size,Colors.yellowAccent),
        _User("image", size,Colors.greenAccent),
      ],
    );
  }
  Widget _User(String image,Size size,Color color){
    return Container(
        child: Column(
          children: [
            CircleAvatar(
              radius: size.height*0.04,
              backgroundColor:color,
              // backgroundImage: NetworkImage(image),
            ),
          ],
        )
    );
  }
  Widget _ListItem(String image,String name,String recentext,String time,Size size){
    return ListTile(
      onTap: (){},
      contentPadding: EdgeInsets.symmetric(horizontal: size.width*0.065,vertical: size.height*0.01),
      leading: CircleAvatar(
        radius: size.height*0.04,
        backgroundColor: Colors.greenAccent,
        // backgroundImage: NetworkImage(image),
      ),
      minVerticalPadding: 20,
      horizontalTitleGap: 16,
      title: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text(name,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(time,style: TextStyle(fontSize: 12),),
          )],
        ),
      ),
      subtitle: Text(recentext,style:TextStyle(fontSize: 15,fontWeight: FontWeight.w500),overflow: TextOverflow.ellipsis,),
    );
  }
}
