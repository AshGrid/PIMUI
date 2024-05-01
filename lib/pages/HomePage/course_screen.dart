import 'package:flutter/material.dart';
import 'package:sneakers_app/pages/HomePage/details.dart';
import 'package:sneakers_app/pages/HomePage/resorces_list.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 244, 245, 247),
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Find the best courses for You ",
              style: TextStyle(
                color: Color.fromARGB(255, 8, 49, 85),
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            SizedBox(height: 40), // Espace de 20 pixels

            Container(
              padding: const EdgeInsets.only(left: 20),
              height: 45,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(255, 17, 82, 139).withOpacity(.1),
              ),
              child: TextFormField(
                enabled: false,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.book_online,
                    color: Color.fromARGB(255, 17, 82, 139).withOpacity(.3),
                  ),
                  border: InputBorder.none,
                  hintText: "Find Your Courses...",
                  hintStyle: TextStyle(
                    color: Color.fromARGB(255, 55, 139, 218).withOpacity(.6),
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            SizedBox(height: 40), // Espace de 20 pixels

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 350,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 9,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Details(index: index),
                                ),
                              );
                            },
                            child: Card(
                              elevation: 50,
                              color: Color.fromARGB(255, 164, 219, 235)
                                  .withOpacity(.6),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              margin: const EdgeInsets.only(right: 20),
                              child: Container(
                                padding: const EdgeInsets.all(15),
                                width: 250,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: SizedBox(
                                        height: 200,
                                        width: double.infinity,
                                        child: Stack(
                                          children: [
                                            Positioned.fill(
                                              child: Image(
                                                image: images[index],
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.topRight,
                                              child: Container(
                                                height: 25,
                                                width: 50,
                                                decoration: BoxDecoration(
                                                  color: Color.fromARGB(
                                                          255, 138, 178, 218)
                                                      .withOpacity(.6),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(10),
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    const Icon(
                                                      Icons.star,
                                                      color: Color.fromARGB(
                                                          255, 227, 191, 11),
                                                      size: 14,
                                                    ),
                                                    Text(
                                                      ratting[index].toString(),
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                   
                                    const SizedBox(
                                      height: 5,
                                    ),
                                  
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        const Align(
                                          alignment: Alignment.topLeft,
                                          child: Text("\$ ",
                                              style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 1, 16, 20),
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              )),
                                        ),
                                        Text(
                                          prices[index],
                                          style: const TextStyle(
                                            color:
                                                Color.fromARGB(255, 218, 207, 7),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Let's lear",
                      style: TextStyle(
                        color: Color.fromARGB(255, 25, 129, 234),
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    specialCard(images[5]),
                    const SizedBox(
                      height: 20,
                    ),
                    specialCard(images[6]),
                    const SizedBox(
                      height: 20,
                    ),
                    specialCard(images[7]),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget circleRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        circleIcon(),
        circleIcon(),
      ],
    );
  }

  Widget circleIcon() {
    return Icon(
      Icons.circle,
      color: Color.fromARGB(255, 55, 139, 218).withOpacity(.6),
      size: 10,
    );
  }

  Widget specialCard(AssetImage asset) {
    return Card(
      color: Color.fromARGB(255, 55, 139, 218).withOpacity(.6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Details(index: index),
            ),
          );
        },
        child: Container(
          margin: const EdgeInsets.all(10),
          height: 120,
          width: double.infinity,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: double.infinity,
                  width: 120,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: asset,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              const Column(
                children: [
                  Text(
                    "5 Coffee Beans You\nMust try!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

