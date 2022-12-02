import 'package:firebasewithflutter/const/AppColors.dart';
import 'package:firebasewithflutter/models/plants.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    int seletctedIndex = 0;
    Size size = MediaQuery.of(context).size;

    List<Plant> _plantList = Plant.plantList;

    //List of categories
    List<String> _plantTypes = [
      'Recommended',
      'Indoor',
      'Outdoor',
      'Garden',
      'Supplement'
    ];

    //Toggle favorite button

    bool toggleIsFavorated(bool isFavorated){
      return !isFavorated;
    }


    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.0
                    ),
                    width: size.width * .9,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.search, color: Constants.blackColor.withOpacity(.6),),
                      const  Expanded(child: TextField(
                          showCursor: false,
                          decoration: InputDecoration(
                            hintText: 'Search Plant',
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                        ),
                      ),
                        Icon(Icons.mic, color: Constants.blackColor.withOpacity(.6),),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Constants.primaryColor.withOpacity(.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              height: 50,
              width: size.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _plantTypes.length,
                itemBuilder: (BuildContext contex, int index){
                  return Padding(padding: EdgeInsets.all(8.0), child: GestureDetector(
                    onTap: (){
                      setState(() {
                        seletctedIndex = index;
                      });
                    },
                    child: Text(_plantTypes[index], style: TextStyle(fontSize: 16.0, fontWeight: seletctedIndex == index ? FontWeight.bold : FontWeight.w300, color: seletctedIndex == index ? Constants.primaryColor : Constants.blackColor),),
                  ),);

                },
              ),
            ),
            SizedBox(
              height: size.height*.3,
              child: ListView.builder(
              itemCount: _plantList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index){
                return Container(
                  width: 200,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 10,
                        right: 20,
                        child: Container(
                          height: 50,
                          width: 50,
                          child: IconButton(
                            onPressed: (){
                              print("Clieck");
                            },
                            icon: Icon(_plantList[index].isFavorated == true ? Icons.favorite : Icons.favorite_border),
                            color: Constants.primaryColor,
                            iconSize: 30,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 50,
                        right: 50,
                        top: 50,
                        bottom: 50,
                        child: Image.asset(_plantList[index].imageURL),),
                      Positioned(
                        bottom: 15,
                        left: 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(_plantList[index].category, style: TextStyle(color: Colors.white70, fontSize: 16),),
                            Text(_plantList[index].plantName, style: TextStyle(
                              color: Colors.white70, fontSize: 15,
                              fontWeight: FontWeight.bold
                            ),),

                          ],
                        ),),
                      Positioned(
                        bottom: 15,
                        right: 20,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(r'$' + _plantList[index].price.toString(), style: TextStyle(color: Constants.primaryColor, fontSize: 16),),
                        ),),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Constants.primaryColor.withOpacity(.8),
                    borderRadius: BorderRadius.circular(20),
                  ),
                );
              },
              ),
            ),
          ],
        ),
      )
    );
  }
}
