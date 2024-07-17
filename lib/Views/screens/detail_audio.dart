import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:media_skuza/utils/global.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';

class detail_audio extends StatefulWidget {
  const detail_audio({super.key});

  @override
  State<detail_audio> createState() => _detail_audioState();
}

class _detail_audioState extends State<detail_audio> {
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
    Map<String, dynamic> music =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
        backgroundColor: Color(0xff282C31),
        body: Container(
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
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
                          Icons.keyboard_arrow_down_sharp,
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
                          Icons.notifications_active_sharp,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 55, right: 55, bottom: 20),
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
                              border: Border.all(
                                  color: Color(0xFF2F3034), width: 10),
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
                    Text(
                      "${music['title']}",
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      "Argit Singh",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ],
                ),
              ),
              Expanded(
                  flex: 3,
                  child: Container(
                    // color: Colors.pink,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        children: [
                          StreamBuilder(
                              stream: assetsAudioPlayer.currentPosition,
                              builder: (context, snapshot) {
                                Duration? data = snapshot.data;

                                String currentposition = data.toString();
                                return StreamBuilder(
                                    stream: assetsAudioPlayer.current,
                                    builder: (context, ss) {
                                      Playing? playing = ss.data;
                                      Duration? totalDuration =
                                          playing?.audio.duration;
                                      return Column(
                                        children: [
                                          NeumorphicSlider(
                                            height: 6,
                                            value: (data == null)
                                                ? 0
                                                : data.inSeconds.toDouble(),
                                            min: 0,
                                            max: (totalDuration == null)
                                                ? 0
                                                : totalDuration.inSeconds
                                                    .toDouble(),
                                            style: SliderStyle(
                                              depth: 1,
                                              accent: Color(0xff46ACE3),
                                            ),
                                            onChanged: (value) {
                                              assetsAudioPlayer.seek(Duration(
                                                  seconds: value.toInt()));
                                            },
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "${currentposition.split(".")[0]}",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12),
                                              ),
                                              Text(
                                                "${totalDuration.toString().split(".")[0]}",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12),
                                              ),
                                            ],
                                          ),
                                        ],
                                      );
                                    });
                              }),
                          SizedBox(
                            height: 75,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              NeumorphicButton(
                                onPressed: () async {
                                  playaudio(music['audi']);
                                  await assetsAudioPlayer.pause();
                                },
                                style: NeumorphicStyle(
                                    lightSource: LightSource.bottomRight,
                                    color: Colors.black26,
                                    boxShape: NeumorphicBoxShape.circle(),
                                    shape: NeumorphicShape.convex,
                                    depth: 1.5),
                                padding: const EdgeInsets.all(16.0),
                                child: Icon(
                                  Icons.pause,
                                  color: Colors.white70,
                                ),
                              ),
                              NeumorphicButton(
                                onPressed: () async {
                                  playaudio(music['audi']);
                                },
                                style: NeumorphicStyle(
                                    shape: NeumorphicShape.convex,
                                    lightSource: LightSource.bottomRight,
                                    color: Color(0xff46ACE3),
                                    boxShape: NeumorphicBoxShape.circle(),
                                    depth: 1.5),
                                padding: const EdgeInsets.all(16.0),
                                child: Icon(
                                  Icons.play_arrow,
                                  color: Colors.white70,
                                ),
                              ),
                              NeumorphicButton(
                                onPressed: () async {
                                  playaudio(music['audi']);
                                  await assetsAudioPlayer.stop();
                                },
                                style: NeumorphicStyle(
                                    lightSource: LightSource.bottomRight,
                                    color: Colors.black26,
                                    shape: NeumorphicShape.convex,
                                    boxShape: NeumorphicBoxShape.circle(),
                                    depth: 1.5),
                                padding: const EdgeInsets.all(16.0),
                                child: Icon(
                                  Icons.stop,
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        ));
  }
}
