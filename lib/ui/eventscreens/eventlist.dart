import 'package:flutter/material.dart';

class EventList extends StatelessWidget {
  final List<Map<String, String>> items;

  const EventList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          SizedBox(
            height: 170, // Set the height of the ListView
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 110,
                 // Set the width of each container
                  margin: const EdgeInsets.only(right: 8), // Space between items
                  child: Column(
                    children: [
                      // Image Container
                      ClipRRect(
                       borderRadius: BorderRadius.circular(12),
                        child: Container(
                          height: 90, // Height for the image
                          decoration: BoxDecoration(
                            color: Colors.grey[200], // Placeholder color
                          ),
                          child: Image.network(
                            items[index]['image']!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 6), // Space between image and text
                      // Text Container
                     Container(
  height: 60, // Adjust height to fit both title and subtitle
  alignment: Alignment.center,
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        items[index]['title']!.isNotEmpty
            ? items[index]['title']!
            : 'No Title',
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,
        color: Colors.grey[600]),
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis, // Handle overflow
        maxLines: 1, // Limit to one line
      ),
      const SizedBox(height:0.2), // Space between title and subtitle
      Text(
        items[index]['subtitle']!.isNotEmpty
            ? items[index]['subtitle']!
            : 'No Subtitle',
        style: TextStyle(
          fontSize: 15,fontWeight: FontWeight.bold,
          color: Colors.grey[600],
        ),
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
    ],
  ),
),

                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}