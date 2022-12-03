import 'package:firebasewithflutter/const/AppColors.dart';
import 'package:firebasewithflutter/models/plants.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  final int plantId;
  const DetailsPage({Key? key, required this.plantId}) : super(key: key);
  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Plant> _plantList = Plant.plantList;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Constants.primaryColor.withOpacity(.15),
                    ),
                    child: Icon(
                      Icons.close,
                      color: Constants.primaryColor,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    print(widget.plantId);
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Constants.primaryColor.withOpacity(.15),
                    ),
                    child: Icon(
                      _plantList[widget.plantId].isFavorated
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: Constants.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 100,
            left: 20,
            right: 20,
            child: Container(
              width: size.width * .8,
              height: size.height * .8,
              padding: const EdgeInsets.all(20),
              child: Stack(
                children: [
                  Positioned(
                    top: 10,
                    left: 0,
                    child: SizedBox(
                      height: 350,
                      child: Image.asset(_plantList[widget.plantId].imageURL),
                  ),),
                  Positioned(
                    top: 10,
                    right: 0,
                    child: SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  [
                          PlantFuture(title: 'Size', plantFuture: _plantList[widget.plantId].size),
                          PlantFuture(title: 'Humidity', plantFuture: _plantList[widget.plantId].humidity.toString()),
                          PlantFuture(title: 'Temperature', plantFuture: _plantList[widget.plantId].temperature),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PlantFuture extends StatelessWidget {
  final String plantFuture;
  final String title;
  const PlantFuture({
    Key? key, required this.plantFuture, required this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Constants.blackColor,
          ),
        ),
        Text(
          plantFuture,
          style: TextStyle(
              color: Constants.primaryColor,
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
