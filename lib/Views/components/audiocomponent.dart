import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:media_skuza/utils/global.dart'; // Import the global file

class AudioComponent extends StatefulWidget {
  const AudioComponent({super.key});

  @override
  State<AudioComponent> createState() => _AudioComponentState();
}

class _AudioComponentState extends State<AudioComponent> {
  CarouselController carouselController = CarouselController();

  @override
  void initState() {
    super.initState();
    initAudio();
  }

  // Initialize audio players globally
  initAudio() async {
    allaudio.audio.forEach((audio) {
      audio['player'].open(
        Audio(
          audio['audi'],
          metas: Metas(
            title: audio['title'],
            album: audio['audi'],
            image: MetasImage.network(audio['img']),
          ),
        ),
        autoStart: false,
        showNotification: true,
      );
    });
  }

  @override
  void dispose() {
    // Dispose all players if needed (or handle it in global scope)
    allaudio.audio.forEach((audio) {
      audio['player'].dispose();
    });
    super.dispose();
  }

  @override
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
                IconButton(
                  onPressed: () {},
                  padding: const EdgeInsets.all(8.0),
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white70,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  padding: const EdgeInsets.all(8.0),
                  icon: Icon(
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
                            "https://static.vecteezy.com/system/resources/thumbnails/037/044/052/small_2x/ai-generated-studio-shot-of-black-headphones-over-music-note-explosion-background-with-empty-space-for-text-photo.jpg"))),
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
                    children: [],
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
                                    blurRadius: 3,
                                  ),
                                  BoxShadow(
                                    color: Colors.black26,
                                    spreadRadius: 2,
                                    offset: Offset(-4, -4),
                                    blurRadius: 3,
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
                                  IconButton(
                                    onPressed: () async {
                                      // Access the global player and control it
                                      AssetsAudioPlayer player = e['player'];
                                      if (player.isPlaying.value) {
                                        player.pause();
                                      } else {
                                        player.play();
                                      }
                                    },
                                    icon: Icon(
                                      Icons.play_arrow,
                                      color: Colors.white70,
                                      size: 30,
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
