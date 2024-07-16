import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

import '../components/audiocomponent.dart';
import '../components/homecomponent.dart';
import '../components/searchcomponts.dart';
import '../components/videocompont.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool ispress1 = true;
  bool ispress2 = false;
  bool ispress3 = false;
  bool ispress4 = false;

  void updateButtonState(int index) {
    setState(() {
      ispress1 = index == 0;
      ispress2 = index == 1;
      ispress3 = index == 2;
      ispress4 = index == 3;
    });
    pageController.jumpToPage(index);
  }

  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2F3034),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: PageView.builder(
                      controller: pageController,
                      onPageChanged: (index) {
                        updateButtonState(index);
                      },
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        switch (index) {
                          case 0:
                            return Homecomponent();
                          case 1:
                            return Searchcomponents();
                          case 2:
                            return AudioComponent();
                          case 3:
                            return VideoComponent();
                          default:
                            return Homecomponent();
                            ;
                        }
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                          onTap: () {
                            updateButtonState(0);
                          },
                          child: btn(Icons.home, ispress1)),
                      GestureDetector(
                          onTap: () {
                            {
                              updateButtonState(1);
                            }
                            ;
                          },
                          child:
                              btn(Icons.my_library_music_outlined, ispress2)),
                      GestureDetector(
                          onTap: () {
                            updateButtonState(2);
                          },
                          child: btn(Icons.audio_file_outlined, ispress3)),
                      GestureDetector(
                          onTap: () {
                            updateButtonState(3);
                          },
                          child: btn(Icons.video_file_outlined, ispress4)),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget btn(IconData icon, bool ispress) {
  return Container(
    width: 55,
    height: 55,
    decoration: BoxDecoration(
        color: Color(0xff282C31),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            offset: Offset(4, 4),
            blurRadius: 5,
            spreadRadius: 1,
            inset: ispress,
          ),
          BoxShadow(
              color: Colors.black54,
              offset: Offset(-4, -4),
              blurRadius: 5,
              spreadRadius: 1,
              inset: ispress)
        ],
        gradient: LinearGradient(
          colors: [
            Colors.grey.shade800,
            Colors.grey.shade900,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.1, 0.9],
        )),
    child: Icon(
      icon,
      color: ispress ? Color(0xff46ACE3) : Colors.white70,
      size: 25,
    ),
  );
}
