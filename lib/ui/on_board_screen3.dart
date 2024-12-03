import 'package:flutter/material.dart';

class OnBoardScreen3 extends StatelessWidget {
  const OnBoardScreen3({super.key});

  @override
  Widget build(BuildContext context) {
      final Height = MediaQuery.of(context).size.height;
    final Width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: ColorFiltered(colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.darken
          ),
          child: Image.asset("assets/on_board screen3.jpeg",
          fit: BoxFit.cover,),
          ),
          ),
            const Padding(
              padding: EdgeInsets.only(top: 180),
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Pokak Events', 
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16), 
                    
                    Text(
                      'Enjoy every moments with us', 
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white70,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}