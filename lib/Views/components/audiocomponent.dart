import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// hide BoxDecoration, BoxShadow;
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';
import 'package:media_skuza/utils/global.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';
// import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class AudioComponent extends StatefulWidget {
  const AudioComponent({super.key});

  @override
  State<AudioComponent> createState() => _AudioComponentState();
}

class _AudioComponentState extends State<AudioComponent> {
  CarouselController carouselController = CarouselController();
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
  bool istap = false;
  bool isplaying = false;
  String? current;
  @override
  void initState() {
    super.initState();
    assetsAudioPlayer.playlistAudioFinished.listen((e) {
      // Handle when an audio finishes playing
      print("Audio finished: ${e.audio.assetAudioPath}");
    });
  }

  void dispose() {
    assetsAudioPlayer.dispose();
    super.dispose();
  }

  void playaudio(String audi) async {
    if (isplaying && current == audi) {
      await assetsAudioPlayer.pause();
      setState(() {
        isplaying = false;
      });
    } else {
      await assetsAudioPlayer.open(
        Audio(audi),
        autoStart: true,
        showNotification: true,
      );
      setState(() {
        isplaying = true;
        current = audi;
      });
    }
  }

  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.only(top: 33, right: 20, left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NeumorphicButton(
                  onPressed: () {},
                  style: NeumorphicStyle(
                      color: Colors.black38,
                      shape: NeumorphicShape.convex,
                      boxShape: NeumorphicBoxShape.circle(),
                      oppositeShadowLightSource: true,
                      depth: 1.3),
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white70,
                  ),
                ),
                NeumorphicButton(
                  onPressed: () {},
                  style: NeumorphicStyle(
                      color: Colors.black38,
                      shape: NeumorphicShape.convex,
                      boxShape: NeumorphicBoxShape.circle(),
                      oppositeShadowLightSource: true,
                      depth: 1.3),
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.menu,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            margin: EdgeInsets.only(left: 55, right: 55),
            height: 225,
            width: 225,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/music3.avif"),
              ),
              //color: Color(0xFF2F3034), // Same as the background color
              shape: BoxShape.circle,
              border: Border.all(color: Color(0xFF2F3034), width: 19),
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
                    border: Border.all(color: Color(0xFF2F3034), width: 10),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "https://static.vecteezy.com/system/resources/thumbnails/037/044/052/small_2x/ai-generated-studio-shot-of-black-headphones-over-music-note-explosion-background-with-empty-space-for-text-photo.jpg"))
                    //  color: Colors.pink
                    ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 25, bottom: 20, left: 40, right: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      NeumorphicButton(
                        onPressed: () {},
                        style: NeumorphicStyle(
                            color: Colors.black12,
                            depth: 2,
                            intensity: 0.6,
                            lightSource: LightSource.bottomRight),
                        child: Row(
                          children: [
                            Icon(
                              Icons.play_arrow,
                              color: Colors.white70,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              "Play",
                              style: TextStyle(color: Colors.white70),
                            )
                          ],
                        ),
                      ),
                      NeumorphicButton(
                        onPressed: () {},
                        style: NeumorphicStyle(
                            color: Colors.black12,
                            depth: 2,
                            intensity: 0.6,
                            lightSource: LightSource.bottomRight),
                        child: Row(
                          children: [
                            Icon(
                              Icons.shuffle,
                              color: Colors.white70,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Shuffle",
                              style: TextStyle(color: Colors.white70),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                ...allaudio.audio
                    .map(
                      (e) => Padding(
                        padding: const EdgeInsets.only(
                            top: 20, bottom: 20, left: 5, right: 5),
                        child: GestureDetector(
                          onDoubleTap: () {
                            Navigator.of(context)
                                .pushNamed('detail_audio', arguments: e);
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 15),
                            height: 60,
                            width: 340,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade800,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    spreadRadius: 2,
                                    offset: Offset(4, 4),
                                    blurRadius: 3, //inset: true,
                                  ),
                                  BoxShadow(
                                    color: Colors.black26,
                                    spreadRadius: 2,
                                    offset: Offset(-4, -4),
                                    blurRadius: 3,
                                    //inset: true,
                                  )
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, bottom: 10, top: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(e['img']),
                                        ),
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))),
                                    width: 60,
                                  ),
                                  Text(
                                    e['title'],
                                    style: TextStyle(
                                        color: Colors.white70, fontSize: 17),
                                  ),
                                  NeumorphicButton(
                                    onPressed: () {
                                      playaudio(e['audi']);
                                    },
                                    margin: EdgeInsets.all(5),
                                    style: NeumorphicStyle(
                                        depth: 1.5,
                                        oppositeShadowLightSource: true,
                                        lightSource: LightSource.bottomRight,
                                        boxShape: NeumorphicBoxShape.circle(),
                                        color: Colors.white12,
                                        shape: NeumorphicShape.flat),
                                    child: (isplaying && current == e['audi'])
                                        ? Icon(
                                            Icons.pause,
                                            color: Colors.white70,
                                            size: 12,
                                          )
                                        : Icon(
                                            Icons.play_arrow,
                                            color: Colors.white70,
                                            size: 12,
                                          ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
