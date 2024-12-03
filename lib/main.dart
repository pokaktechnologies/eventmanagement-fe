import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokakevent_management/repository/home_cubit.dart';
import 'package:pokakevent_management/repository/location_cubit.dart';
import 'package:pokakevent_management/repository/onboard_cubit.dart';


import 'package:pokakevent_management/repository/singIn_cubit.dart';
import 'package:pokakevent_management/ui/splash_screen.dart';




void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SignInCubit()),
        BlocProvider(create: (_) => TrackCubit()),
        BlocProvider(create: (_) => HomeCubit()),
        BlocProvider(create: (_) =>OnboardingCubit()),
        // BlocProvider(create: (_) => BottomNavCubit()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true, 
      ),
      home: const Splash(),
      // Splash(),
     
      // EventHome()
      // DateandTime(),
      // EventDiscoverScreen(),
      // ScaffoldWithCategories(), 
    );
  }
}
