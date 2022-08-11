import 'package:flutter/material.dart';

class Common extends StatefulWidget {
  const Common({Key? key}) : super(key: key);

  @override
  State<Common> createState() => _CommonState();
}

class _CommonState extends State<Common> {
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;

    return GestureDetector(
      onTap: (){},
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
                ),])),
                )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
