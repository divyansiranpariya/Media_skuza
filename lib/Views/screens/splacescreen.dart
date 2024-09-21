import 'dart:async';

import 'package:flutter/material.dart';

class Splace extends StatefulWidget {
  const Splace({super.key});

  @override
  State<Splace> createState() => _SplaceState();
}

class _SplaceState extends State<Splace> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed("/");
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(
            color: Colors.black,
            // color: Colors.white,
            image: DecorationImage(
              image: NetworkImage(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTmNnx6wVQe3GMQWyP7dm8baEiw05qkwLhkqadxZnB50RAx-chqaSxFkX4UxN1OP9uqIDI&usqp=CAU"),
            )),
      ),
    );
  }
}
