import 'package:flutter/material.dart';

import 'package:video_player/video_player.dart';
import 'package:media_skuza/utils/global.dart';

class VideoComponent extends StatefulWidget {
  const VideoComponent({super.key});

  @override
  State<VideoComponent> createState() => _VideoComponentState();
}

class _VideoComponentState extends State<VideoComponent> {
  late VideoPlayerController videoPlayerController;
  bool isVideoLoaded = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadvideo();
  }

  Future<void> loadvideo() async {
    videoPlayerController = VideoPlayerController.asset("sample1.mp4");
    await videoPlayerController.initialize();
    setState(() {});
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
                  // style: NeumorphicStyle(
                  //     color: Colors.black38,
                  //     shape: NeumorphicShape.convex,
                  //     boxShape: NeumorphicBoxShape.circle(),
                  //     oppositeShadowLightSource: true,
                  //     depth: 1.3),
                  padding: const EdgeInsets.all(8.0),
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white70,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  // style: NeumorphicStyle(
                  //     color: Colors.black38,
                  //     shape: NeumorphicShape.convex,
                  //     boxShape: NeumorphicBoxShape.circle(),
                  //     oppositeShadowLightSource: true,
                  //     depth: 1.3),
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
            flex: 5,
            child: Container(
                child: ListView.separated(
                    itemBuilder: (context, i) {
                      return Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: Container(
                                margin: EdgeInsets.only(left: 15),
                                height: 120,
                                color: Colors.white,
                                child: isVideoLoaded &&
                                        allvideo
                                            .videoplay[i]['video'].isNotEmpty
                                    ? VideoPlayer(VideoPlayerController.asset(
                                        allvideo.videoplay[i]['video']))
                                    : Center(
                                        child: CircularProgressIndicator()),
                              )),
                          Expanded(
                              flex: 2,
                              child: Container(
                                margin: EdgeInsets.only(left: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${allvideo.videoplay[i]['title']}",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white70),
                                    ),
                                    Text(
                                      "${allvideo.videoplay[i]['description']}",
                                      style: TextStyle(
                                          fontSize: 10, color: Colors.white70),
                                    )
                                  ],
                                ),
                              )),
                        ],
                      );
                    },
                    separatorBuilder: (context, i) {
                      return Container(
                        child: Text(""),
                      );
                    },
                    itemCount: allvideo.videoplay.length))),
      ],
    );
  }
}
