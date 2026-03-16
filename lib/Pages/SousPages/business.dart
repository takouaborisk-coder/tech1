import 'dart:ui';

import 'package:flutter/material.dart';



class Business extends StatefulWidget {
  const Business({super.key});

  @override
  State<Business> createState() => _BusinessState();
}

class _BusinessState extends State<Business> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff191722),
      ),
      backgroundColor: Color(0xff191722),
      body: Stack(
        children: [
          Image.asset('assets/images/DvcnS.png'),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaY: 2, sigmaX: 3),
            child: Container(
              color: Colors.black.withOpacity(0.3),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: const Text("Ce service n'est pas encore disponible", style: TextStyle(fontSize: 35, color: Colors.white),),
            ),
          ),
        ],
      ),
    );
  }
}
