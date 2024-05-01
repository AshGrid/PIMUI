import 'package:flutter/material.dart';
import 'package:sneakers_app/pages/HomePage/details_screen.dart';

class Details extends StatefulWidget {
  final int index;
  const Details({Key? key, required this.index}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Color.fromARGB(255, 238, 241, 245),
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Stack(
                  children: [
                    
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        margin: const EdgeInsets.only(top: 50, left: 20, right: 20),
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                            ),
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Icon(
                                Icons.favorite,
                                color: Color.fromARGB(255, 217, 18, 15),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: const EdgeInsets.only(top: 30, right: 30, left: 30),
                        height: 150,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 55, 139, 218).withOpacity(.6),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                   
                                    const SizedBox(height: 15),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          color: Color.fromARGB(255, 234, 150, 25),
                                        ),
                                        const SizedBox(width: 10),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    const SizedBox(width: 15),
                                    Container(
                                      height: 60,
                                      width: 60,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                margin: const EdgeInsets.only(top: 20, left: 20, right: 30),
                height: double.infinity,
                width: double.infinity,
                child: Column(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Description",
                            style: TextStyle(
                              color: Color.fromARGB(255, 6, 67, 188).withOpacity(.5),
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            "A",
                            style: TextStyle(
                              color: Color.fromARGB(255, 16, 11, 11),
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const SizedBox(height: 5),
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const SizedBox(width: 0),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                         
                                          const SizedBox(height: 5),
                                          Row(
                                            children: [
                                              
                                              const SizedBox(width: 10),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    // Naviguer vers l'interface DetailsScreen
                                    // lorsque l'utilisateur appuie sur "Watch Now"
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DetailsScreen(
                                          title: "Title of the Video",
                                          description: "Description of the Video",
                                        ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    height: 60,
                                    width: 250,
                                   
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.video_library,
                                          color: Color.fromARGB(255, 14, 35, 197),
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          "Watch Now",
                                          style: TextStyle(
                                          color: Color.fromARGB(255, 14, 35, 197),
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
