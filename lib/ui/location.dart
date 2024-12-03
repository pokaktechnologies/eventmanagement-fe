import 'package:flutter/material.dart';

import 'package:pokakevent_management/repository/location_section.dart';

class TrackScreen extends StatelessWidget {
  const TrackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.6),
                BlendMode.darken,
              ),
              child: Image.asset(
                "assets/locationscreen.jpeg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: height * 0.2), 
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Pokak",
                    style: TextStyle(
                      fontSize: height * 0.04, 
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: height * 0.01), 
                  Text(
                    "Event management",
                    style: TextStyle(
                      fontSize: height*0.03,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: height * 0.03), 
                  const LocationSelection(), 
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}



