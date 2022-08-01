import "package:flutter/material.dart";

class Main extends StatefulWidget {
  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  int selectedIndex = 0;

  List<IconData> data = [
    Icons.home_outlined,
    Icons.search,
    Icons.add_box_outlined,
    Icons.favorite_outline_sharp,
    Icons.person_outline_sharp
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      bottomNavigationBar: Material(
        elevation: 10,
        color: Colors.black,
        child: Container(
          height: 70,
          width: double.infinity,
          child: ListView.builder(
            itemCount: data.length,
            padding: EdgeInsets.symmetric(horizontal: 10),
            itemBuilder: (ctx, i) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = i;
                  });
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 250),
                  width: MediaQuery.of(context).size.width/9,
                  decoration: BoxDecoration(
                    border: i == selectedIndex
                        ? Border(
                        top: BorderSide(
                            width: 3.0, color: Colors.white))
                        :null
                    ,
                    gradient: i == selectedIndex
                        ? LinearGradient(
                        colors: [
                          Colors.grey.shade800,
                          Colors.black
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)
                        : null,
                  ),
                  child: Icon(
                    data[i],
                    size: 35,
                    color: i == selectedIndex
                        ? Colors.white
                        : Colors.grey.shade800,
                  ),
                ),
              ),
            ),
            scrollDirection: Axis.horizontal,
          ),
        ),
      ),
    );
  }
}
