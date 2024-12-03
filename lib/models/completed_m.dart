import 'package:flutter/material.dart';
import 'package:pokakevent_management/ui/home/completed.dart';


class Complete extends StatelessWidget {
  const Complete({super.key});

  final List<Map<String, dynamic>> completeData = const [
    {
      'eventName': 'Dabzee show event',
      'imageUrl': 'assets/eventsvedan.jpeg',
      'location': 'Kochi',
      'price': 1000,
      'calendar': '2024-10-12',
      'time': '12:00 PM',
    },
    {
      'eventName': 'Le Merdien',
      'imageUrl': 'assets/event/eventLe.jpeg',
      'location': 'Kochi',
      'price': 1200,
      'calendar': '2024-10-12',
      'time': '12:00 PM',
    },
    {
      'eventName': 'Auto Expo',
      'imageUrl': 'assets/CarShow.png',
      'location': 'Kochi',
      'price': 2400,
      'calendar': '2024-10-12',
      'time': '12:00 PM',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: completeData.length,
        itemBuilder: (context, index) {
          final event = completeData[index];
          return Completed(
            eventName: event['eventName'],
            imageUrl: event['imageUrl'],
            location: event['location'],
            price: event['price'].toDouble(),
            calendar: event['calendar'],
            time: event['time'],
            icon:
                const Icon(Icons.calendar_today, size: 16, color: Colors.teal),
          );
        },
      ),
    );
  }
}

// This widget will display individual event details

