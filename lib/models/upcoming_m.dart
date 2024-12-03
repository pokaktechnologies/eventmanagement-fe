
import 'package:flutter/material.dart';

class Upcoming extends StatelessWidget {
  final String eventName;
  final String imageUrl;
  final String location;
  final double price;
  final String calendar; 
  final String time; 
  final Icon icon;

  const Upcoming({
    super.key,
    required this.eventName,
    required this.imageUrl,
    required this.location,
    required this.price,
    required this.calendar,
    required this.time,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      imageUrl,
                      height: 90,
                      width: 150,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.error,
                          size: 60,
                          color: Colors.red,
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        eventName,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(Icons.location_on),
                          Text(location,
                            
                            style: const TextStyle(
                              color: Color.fromARGB(255, 59, 58, 58),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '\$$price Onwords',
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            
        Row(
  mainAxisAlignment: MainAxisAlignment.start, 
  crossAxisAlignment: CrossAxisAlignment.center, 
  children: [
    icon, 
    const SizedBox(width: 8),
    Text(calendar,style: const TextStyle(color: Colors.teal),),
    const SizedBox(width: 150), 
    Row(
      children: [
        const Icon(Icons.access_time, size: 20, color: Colors.teal), 
        const SizedBox(width: 4),
        Text(time,style: const TextStyle(color: Colors.teal,fontSize: 15,fontWeight: FontWeight.bold),),
      ],
    ),
  ],
),


          ],
        ),
      ),
    );
  }
}