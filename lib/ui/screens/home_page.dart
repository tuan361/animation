import 'package:animation/constants.dart';
import 'package:animation/models/plants.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    Size size = MediaQuery.of(context).size;

    List<Plant> _plantList = Plant.plantList;

    List<String> __plantTypes = [
      'Recommended',
      'Indoor',
      'Ourdoor',
      'Garden',
      'Supplement',
    ];

    bool toggleIsFavorated(bool isFavorated) {
      return !isFavorated;
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                    ),
                    width: size.width * .9,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search,
                          color: Colors.black54.withOpacity(.6),
                        ),
                        const Expanded(
                            child: TextField(
                          showCursor: false,
                          decoration: InputDecoration(
                            hintText: 'Search Plant',
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                        )),
                        Icon(
                          Icons.mic,
                          color: Colors.black54.withOpacity(.6),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Constants.primaryColor.withOpacity(.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12)
                  .add(EdgeInsets.only(top: 10)),
              height: 50.0,
              width: size.width,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: __plantTypes.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Text(
                          __plantTypes[index],
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: selectedIndex == index
                                ? FontWeight.bold
                                : FontWeight.w300,
                            color: selectedIndex == index
                                ? Constants.primaryColor
                                : Constants.blackColor,
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            SizedBox(
                height: size.height * 3,
                child: ListView.builder(
                  itemCount: _plantList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: 300,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 10,
                            right: 20,
                            child: Container(
                              height: 50,
                              width: 50,
                              child: IconButton(
                                onPressed: null,
                                icon: Icon(_plantList[index].isFavorated == true
                                    ? Icons.favorite
                                    : Icons.favorite_border),
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
                            top: 0,
                            bottom: 50,
                            child: Image.asset(_plantList[index].imageURL),
                          ),
                          Positioned(
                              bottom: 15,
                              left: 20,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _plantList[index].category,
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    _plantList[index].plantName,
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              )),
                          Positioned(
                              bottom: 15,
                              right: 20,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 2),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  r'$' + _plantList[index].price.toString(),
                                  style: TextStyle(
                                    color: Constants.primaryColor,
                                    fontSize: 16,
                                  ),
                                ),
                              ))
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Constants.primaryColor.withOpacity(.8),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    );
                  },
                ))
          ],
        ),
      ),
    );
  }
}
