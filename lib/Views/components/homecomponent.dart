import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:media_skuza/utils/global.dart';

import 'package:provider/provider.dart';

import '../../provider/slider_provider.dart';

class Homecomponent extends StatefulWidget {
  const Homecomponent({super.key});

  @override
  State<Homecomponent> createState() => _HomecomponentState();
}

class _HomecomponentState extends State<Homecomponent> {
  CarouselController carouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hello Divyanshi👋",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed("Search_page");
                    },
                    icon: Icon(
                      Icons.search_sharp,
                      color: Colors.white70,
                    ),
                    // style: NeumorphicStyle(
                    //     color: Colors.black26,
                    //     shape: NeumorphicShape.convex,
                    //     boxShape: NeumorphicBoxShape.circle(),
                    //     oppositeShadowLightSource: true,
                    //     lightSource: LightSource.bottomRight,
                    //     depth: 2),
                  )
                ],
              ),
            ),
          ),
          Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, bottom: 30),
                    child: Text(
                      "Your Playlist",
                      style: TextStyle(color: Colors.white70, fontSize: 17),
                    ),
                  ),
                  CarouselSlider(
                    options: CarouselOptions(
                      onPageChanged: (val, _) {
                        Provider.of<SliderProvider>(context, listen: false)
                            .changeslide(val);
                      },
                      viewportFraction: 0.5,
                      enlargeCenterPage: true,
                      pageSnapping: true,
                      initialPage: Provider.of<SliderProvider>(
                        context,
                      ).sliderindex,
                    ),
                    carouselController: carouselController,
                    items: images.image.map((e) {
                      return Container(
                        height: 165,
                        width: 140,
                        decoration: BoxDecoration(
                            color: Colors.black26,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                offset: Offset(2, 2),
                              ),
                              BoxShadow(
                                color: Colors.black12,
                                offset: Offset(-2, -2),
                                blurRadius: 2,
                              ),
                            ],
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                        child: Column(
                          children: [
                            Expanded(
                                flex: 3,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 70,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          color: Colors.pink,
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(e['img'])),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15))),
                                    ),
                                  ],
                                )),
                            Expanded(
                                flex: 2,
                                child: Container(
                                  child: Column(
                                    children: [
                                      Text(
                                        e['title'],
                                        style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 17),
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        e['artist'],
                                        style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 13),
                                      ),
                                    ],
                                  ),
                                )),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, top: 25, bottom: 30),
                    child: Text(
                      "Recently Played",
                      style: TextStyle(color: Colors.white70, fontSize: 17),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...images.recent.map((val) {
                          return Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 55),
                                height: 125,
                                width: 125,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        AssetImage("assets/images/music3.avif"),
                                  ),
                                  //color: Color(0xFF2F3034), // Same as the background color
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: Color(0xFF2F3034), width: 19),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.6),
                                      offset: Offset(10, 10),
                                      blurRadius: 10,
                                    ),
                                    BoxShadow(
                                      color: Colors.white.withOpacity(0.1),
                                      offset: Offset(-10, -10),
                                      blurRadius: 10,
                                      spreadRadius: 1,
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Container(
                                    height: 135,
                                    width: 135,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xFF2F3034), width: 1),
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(val['img']))
                                        //  color: Colors.pink
                                        ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 60, top: 15),
                                child: Text(
                                  val['title'],
                                  style: TextStyle(
                                      color: Colors.white70, fontSize: 17),
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 60,
                                ),
                                child: Text(
                                  val['artist'],
                                  style: TextStyle(
                                      color: Colors.white70, fontSize: 13),
                                ),
                              ),
                            ],
                          );
                        }).toList()
                      ],
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
