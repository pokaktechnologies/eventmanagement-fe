import 'package:flutter/material.dart';

class Allevent extends StatelessWidget {
  final String eventName;
  final String imageUrl;
  final String location;
  final double price;
  final double ratepoint;

  const Allevent({
    super.key,
    required this.eventName,
    required this.imageUrl,
    required this.location,
    required this.price,
    required this.ratepoint,
  });

  @override
  Widget build(BuildContext context) {
    // MediaQuery for responsive UI
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(screenWidth * 0.04),
      ),
      elevation: 10,
      margin: EdgeInsets.symmetric(
        vertical: screenHeight * 0.01,
        horizontal: screenWidth * 0.01,
      ),
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image container
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(screenWidth * 0.04),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.7),
                        spreadRadius: 2.0,
                        blurRadius: 4,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(screenWidth * 0.04),
                    child: Image.asset(
                      imageUrl,
                      height: screenHeight * 0.11,
                      width: screenWidth * 0.4,
                      fit: BoxFit.fill,
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
                SizedBox(width: screenWidth * 0.03),
                // Event details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        eventName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth * 0.045,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      Row(
                        children: [
                          Icon(Icons.location_on, size: screenWidth * 0.04),
                          SizedBox(width: screenWidth * 0.01),
                       Text(
  location,
  style: TextStyle(
    fontSize: screenWidth * 0.032,
    color: const Color.fromARGB(255, 59, 58, 58),
  ),
  textAlign: TextAlign.start,
  overflow: TextOverflow.ellipsis, // Handles overflow by showing an ellipsis
  maxLines: 1, // Limits text to a single line
),

                        ],
                      ),
                      SizedBox(height: screenHeight * 0.005),
                      Row(
                        children: [
                          Text(
                            '\$$price',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: screenWidth * 0.04,
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.01),
                          Text(
                            '/day',
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.normal,
                              fontSize: screenWidth * 0.04,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: screenHeight * 0.1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(Icons.star,
                          color: Colors.amber, size: screenWidth * 0.045),
                      SizedBox(width: screenWidth * 0.01),
                      Text(
                        '$ratepoint',
                        style: TextStyle(
                          fontSize: screenWidth * 0.04,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.01),
          ],
        ),
      ),
    );
  }
}
