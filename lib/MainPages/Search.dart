import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class Search extends StatefulWidget {

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  PanelController panelController=new PanelController();

  void _toggleOpen()=>panelController.open();

  List<Color> color=[
    Colors.greenAccent,
    Colors.pinkAccent,
    Colors.lightBlueAccent,
    Colors.white
  ];

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){},
          icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
        ),
        backgroundColor: Color(0xff03071e),
        elevation: 0.0,
      ),
      body: Container(
          width: size.width,
          height: size.height,
          color: Color(0xff03071e),
          child: SlidingUpPanel(
            controller: panelController,
            minHeight: size.height>780?45:35,
            maxHeight: size.height>700?size.height/1.45:size.height/1.6,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30)
            ),
            panel: Container(
                width: size.width,
                height: size.height,
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
                      flex: 5,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 5,
                        itemBuilder: (context,index){
                          return _ListItem("image", "Soham", "Yo what up sam here i would like tell you", "18:45", size,);
                        },
                      ),
                    )
                  ],
                )
            ),
            body: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width*0.06,vertical: size.height*0.005),
                    child: Text("Find People\nto connect with!",style: TextStyle(color: Colors.white,fontSize: size.height*0.05,fontWeight: FontWeight.w800),),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width*0.04,vertical:size.height*0.01),
                    child: TextField(
                        onTap: _toggleOpen,
                        decoration:InputDecoration(
                          prefixIcon: Image.asset('assets/search-2-line.png'),
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "Search",
                          hintStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                          contentPadding: EdgeInsets.all(size.height*0.02),
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
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: size.width*0.02),
                    width: size.width,
                    height: size.height/1.72,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _createList(size,color[0]),
                        _createList(size,color[1]),
                        _createList(size,color[2]),
                        _createList(size,color[3]),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
      ),
    );

  }
  Widget _createList(Size size,Color color){
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _User("Sayak Ghosh", "image", size,color),
        _User("Sayak Ghosh", "image", size,color),
        _User("Sayak Ghosh", "image", size,color),
        _User("Sayak Ghosh", "image", size,color),
      ],
    );
  }
  Widget _User(String username,String image,Size size,Color color){
    return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              radius: size.height*0.04,
              backgroundColor:color,
              // backgroundImage: NetworkImage(image),
            ),
            SizedBox(height: size.height*0.01,),
            Text(username,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: size.height*0.02),)
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
