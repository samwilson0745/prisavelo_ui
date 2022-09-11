import 'package:flutter/material.dart';
class About extends StatefulWidget {

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {

  Widget singleCard(String image,String name,String occupation){
    return Card(
      color: Color(0xfffff9eb),
      elevation: 0.0,
      child: InkWell(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:<Widget> [
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                image: DecorationImage(
                  image: NetworkImage("https://picsum.photos/300")
                )
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(name,style: TextStyle(color:Color(0xff03071e),fontSize: 15,fontWeight: FontWeight.bold),),
            ),
            Text(occupation,textAlign:TextAlign.center,style: TextStyle(fontSize: 12,color:Color(0xff03071e),),)
          ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFF03071E),
      appBar: AppBar(
        backgroundColor: Color(0xFF03071E),
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_circle_left_outlined,
            color: Color(0xFFFFF9EB),
            size: size.width * 0.1,
          ),
          onPressed: () {},
        ),
      ),
      body: Container(
        width: size.width,
        height: size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.symmetric(horizontal: size.width*0.03,vertical: size.height*0.01),
                  child: Text("About Us",style: TextStyle(fontSize: size.height*0.05,fontWeight: FontWeight.bold,color: Colors.white),),
                )
            ),
            Expanded(
              flex: 13,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: size.width*0.03,vertical: size.height*0.04),
                width: size.width,
                  decoration: BoxDecoration(
                    color: Color(0xfffff9eb),
                    borderRadius: BorderRadius.vertical(top: Radius.circular(15))
                  ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Text("Vision",style: TextStyle(color: Color(0xff03071e),fontWeight: FontWeight.bold,fontSize: size.height*0.05),),
                      ),
                      Text(
                        "In future the powerful country will not be the one with most amount of arms ammunition rather the one with most amount of physically and mentally healthy people.",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 15,color: Color(0xff03071e)),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text("Team",style: TextStyle(color: Color(0xff03071e),fontWeight: FontWeight.bold,fontSize: size.height*0.05),),
                      ),
                      GridView.count(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          crossAxisCount: 2,
                          children: [
                            singleCard("image", "Sayak Ghosh","CEO | Founder"),
                            singleCard("image", "Punnyartha Banerjee","CTO | Founder"),
                            singleCard("image", "Soham Deb Majumder","Co-Founder | Vice President Engineering"),
                            singleCard("image", "Soumajit Das","Front Developer")
                          ],
                        ),

                    ],
                  ),
                ),
                ),
            )
          ],
        ),
      )
    ) ;
  }
  Widget _profile(String image,String name,String occupation){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(30)),
              // image: DecorationImage(
              //   image: AssetImage()
              // )
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 12),
                child: Text(name,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
              ),
              Padding(
                padding: EdgeInsets.only(left: 13),
                child: Text(occupation,),
              ),
            ],
          )
        ],
      ),
    );
  }
}