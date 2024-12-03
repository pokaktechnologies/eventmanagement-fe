

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokakevent_management/states/photorate.dart';
import 'package:pokakevent_management/ui/home/search/search_sub/photography.dart';

class PhotographyM extends StatelessWidget {
  const PhotographyM({super.key});

  final List<Map<String, dynamic>> PhotographyMData = const [
    {
      'eventName': 'lightroom',
      'imageUrl': 'assets/Phographyev.jpeg',
      'location': 'Kaloor Road',
      'price': 1890000,
      'ratepoint': '4.5',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: PhotographyMData.length,
        itemBuilder: (context, index) {
          final event = PhotographyMData[index];
          return BlocProvider(
            create: (_) => Rate3Bloc(),
            child: Photography(
              eventName: event['eventName'],
              imageUrl: event['imageUrl'],
              location: event['location'],
              price: event['price'].toDouble(), 
              ratepoint: double.parse(event['ratepoint']), 
            ),
          );
        },
      ),
    );
  }
}