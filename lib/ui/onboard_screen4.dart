import 'package:flutter/material.dart';

class OnboardScreen4 extends StatelessWidget {
  const OnboardScreen4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        children: [
          Positioned.fill(child: ColorFiltered(colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.darken,
      ),
      child: Image.asset("assets/onboardscreen4.jpeg",
      fit: BoxFit.cover,),
      ),
      ),
      const  Padding(
              padding:  EdgeInsets.only(top: 180),
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
                      'Life is very shot always happy.', 
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

      ]

        
      ) ,
    );
  }
}