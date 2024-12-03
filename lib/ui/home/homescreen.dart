import 'package:flutter/material.dart';
import 'package:pokakevent_management/models/upcoming_m.dart';

import 'package:pokakevent_management/ui/eventscreens/eventhome.dart'; // Import the event detail screen

class UpComing extends StatelessWidget {
  const UpComing({super.key});

  // Function to navigate to the EventDetail screen
  void _navigateToEventHomeMain(BuildContext context, String eventName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EventHomeMain(), // Replace EventDetail with your actual class
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaHeight = MediaQuery.of(context).size.height;
    final mediaWidth = MediaQuery.of(context).size.width;
    
    return Scaffold(
      body: ListView(
        children: [
          GestureDetector(
            onTap: () =>  _navigateToEventHomeMain(context, 'Dabzee show event'),
            child: const Upcoming(
              eventName: 'Dabzee show event',
              imageUrl: 'assets/eventsvedan.jpeg',
              location: 'Kochi',
              price: 1000,
              icon: Icon(Icons.calendar_today, size: 16, color: Colors.teal),
              calendar: '2024-10-12',
              time: '12:00 PM',
            ),
          ),
          GestureDetector(
            onTap: () =>  _navigateToEventHomeMain(context, 'Le Merdien'),
            child: const Upcoming(
              eventName: 'Le Merdien',
              imageUrl: 'assets/event/eventLe.jpeg',
              location: 'Kochi',
              price: 1200,
              icon: Icon(Icons.calendar_today, size: 16, color: Colors.teal),
              calendar: '2024-10-12',
              time: '12:00 PM',
            ),
          ),
          GestureDetector(
            onTap: () =>  _navigateToEventHomeMain(context, 'Auto Expo'),
            child: const Upcoming(
              eventName: 'Auto Expo',
              imageUrl: 'assets/CarShow.png',
              location: 'Kochi',
              price: 2400,
              icon: Icon(Icons.calendar_today, size: 16, color: Colors.teal),
              calendar: '2024-10-12',
              time: '12:00 PM',
            ),
          ),
          GestureDetector(
            onTap: () =>  _navigateToEventHomeMain(context, 'Aniruth event'),
            child: const Upcoming(
              eventName: 'Aniruth event',
              imageUrl: 'https://media.istockphoto.com/id/621598372/photo/healthy-fresh-homemade-salad.jpg?s=612x612&w=0&k=20&c=xSPUOhsQLuVP4Y1-CZZ5ogl_qD90vQNTKZJk9Usqv-Y=',
              location: 'Kochi',
              price: 3000,
              icon: Icon(Icons.calendar_today, size: 16, color: Colors.teal),
              calendar: '2024-10-12',
              time: '12:00 PM',
            ),
          ),
          GestureDetector(
            onTap: () =>  _navigateToEventHomeMain(context, 'magic gj'),
            child: const Upcoming(
              eventName: 'magic gj',
              imageUrl: 'https://media.istockphoto.com/id/621598372/photo/healthy-fresh-homemade-salad.jpg?s=612x612&w=0&k=20&c=xSPUOhsQLuVP4Y1-CZZ5ogl_qD90vQNTKZJk9Usqv-Y=',
              location: 'Kochi',
              price: 900,
              icon: Icon(Icons.calendar_today, size: 16, color: Colors.teal),
              calendar: '2024-10-12',
              time: '12:00 PM',
            ),
          ),
          GestureDetector(
            onTap: () =>  _navigateToEventHomeMain(context, 'vinith sreenivassan show'),
            child: const Upcoming(
              eventName: 'vinith sreenivassan show',
              imageUrl: 'https://media.istockphoto.com/id/621598372/photo/healthy-fresh-homemade-salad.jpg?s=612x612&w=0&k=20&c=xSPUOhsQLuVP4Y1-CZZ5ogl_qD90vQNTKZJk9Usqv-Y=',
              location: 'Kochi',
              price: 1700,
              icon: Icon(Icons.calendar_today, size: 16, color: Colors.teal),
              calendar: '2024-10-12',
              time: '12:00 PM',
            ),
          ),
        ],
      ),
    );
  }
}
