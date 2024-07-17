import 'package:flutter/material.dart';
import 'package:media_skuza/provider/slider_provider.dart';
import 'package:provider/provider.dart';

import 'Views/screens/detail_audio.dart';
import 'Views/screens/home_page.dart';
import 'Views/screens/searchpage.dart';
import 'Views/screens/splacescreen.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (context) => SliderProvider())],
    child: MaterialApp(
      initialRoute: "Splace",
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => Homepage(),
        'detail_audio': (context) => detail_audio(),
        'Splace': (context) => Splace(),
        'SearchPage': (context) => SearchPage(),
      },
    ),
  ));
}
