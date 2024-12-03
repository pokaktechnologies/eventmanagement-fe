import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokakevent_management/states/eventrate.dart';

import 'package:pokakevent_management/ui/home/search/search_sub/event_orgz.dart';

class EventOrganazerm extends StatelessWidget {
  const EventOrganazerm({super.key});

  final List<Map<String, dynamic>> EventOrganazermData = const [
    {
      'eventName': 'Rk Event',
      'imageUrl': 'assets/rkhalljpeg.jpeg',
      'location': 'Kaloor Road, Kochi',
      'price': 200000,
      'ratepoint': '4.0',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: EventOrganazermData.length,
        itemBuilder: (context, index) {
          final event = EventOrganazermData[index];
          return BlocProvider(
            create: (_) => Rate2Bloc(),
            child: EventOganazer(
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
