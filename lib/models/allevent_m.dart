import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokakevent_management/states/rateevent.dart';
import 'package:pokakevent_management/ui/eventscreen.dart';
import 'package:pokakevent_management/ui/home/search/search_sub/allevent.dart';

class AllEventm extends StatelessWidget {
  const AllEventm({super.key});

  final List<Map<String, dynamic>> alleventmData = const [
    {
      'eventName': 'ABC Hall',
      'imageUrl': 'assets/abchall.jpeg',
      'location': 'Kaloor , Kochi',
      'price': 100000,
      'ratepoint': '4.0',
    },
    {
      'eventName': 'AJ Hall',
      'imageUrl': 'assets/ajhall.jpeg',
      'location': 'Kaloor , Kochi',
      'price': 100000,
      'ratepoint': '4.5',
    },
    {
      'eventName': 'RK Event',
      'imageUrl': 'assets/rkhalljpeg.jpeg',
      'location': 'Kaloor, Kochi',
      'price': 100000,
      'ratepoint': '5.0',
    },
  ];

  void _navigateToEventDetail(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const EventHome(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      
      body: ListView.builder(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.01,
          vertical: screenHeight * 0.01,
        ),
        itemCount: alleventmData.length,
        itemBuilder: (context, index) {
          final event = alleventmData[index];
          return BlocProvider(
            create: (_) => RateBloc(),
            child: InkWell(
              onTap: () => _navigateToEventDetail(context),
              child: Padding(
                padding: EdgeInsets.only(bottom: screenHeight * 0.01),
                child: Allevent(
                  eventName: event['eventName'],
                  imageUrl: event['imageUrl'],
                  location: event['location'],
                  price: event['price'].toDouble(),
                  ratepoint: double.parse(event['ratepoint']),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

