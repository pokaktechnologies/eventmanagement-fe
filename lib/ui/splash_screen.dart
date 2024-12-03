import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokakevent_management/repository/animation_splash.dart';
import 'package:pokakevent_management/repository/onboardmain.dart';
import 'package:pokakevent_management/repository/splash_cubit.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (_) => SplashCubit()..startSplash(),
      child: BlocListener<SplashCubit, void>(
        listener: (context, state) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const Connection()),
          );
        },
        child: Scaffold(
          body: Stack(
            children: [
              Positioned.fill(
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.6),
                    BlendMode.darken,
                  ),
                  child: Image.asset(
                    "assets/b9e9eaef07e624732dcdc26fb2424c9c.jpeg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            Center(
  child: Padding(
    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
    child: AnimatedTextWidget(
      text: "Pokak Event Management",
      duration: const Duration(seconds: 3),
      textStyle: TextStyle(
        fontSize: screenWidth * 0.06,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  ),
),

            ],
          ),
        ),
      ),
    );
  }
}










