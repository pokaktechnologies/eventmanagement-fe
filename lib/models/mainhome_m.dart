import 'package:flutter/material.dart';
import 'package:pokakevent_management/view/mainhome.dart';

class VenueGrid extends StatelessWidget {

  final List<List<Venue>> venuesBySection = [
    [
      Venue('Grand hyatt', 'Kochi', '1,50,000/ day', 4.5, 'assets/hall1.jpeg'),
      Venue('Durbar Hall', 'Kochi', '2,00,000/ day', 4.7, 'assets/hall2.jpeg'),
    ],
    [
      Venue('RK Event', 'Kochi', '1,80,000/ day', 4.6, 'assets/rkhalljpeg.jpeg'),
      Venue('360 Events', 'Kochi', '1,20,000/ day', 4.4, 'assets/hall3.jpeg'),
    ],
    [
      Venue('30 MM Photography', 'Kochi', '2,50,000/ day', 4.9, 'assets/hall5.jpeg'),
      Venue('Lightroom Photography', 'Kochi', '2,00,000/ day', 4.8, 'assets/Phographyev.jpeg'),
    ],
    [
      Venue('Le Maritime', 'Kochi', '1,70,000/ day', 4.6, 'assets/bestdealhall.jpeg'),
      Venue('AJ Hall', 'Kochi', '1,50,000/ day', 5.0, 'assets/ajhall.jpeg'),
    ],
    [
      Venue('XYZ Hall', 'Kochi', '1,30,000/ day', 4.3, 'assets/xywhall.jpeg'),
      Venue('ABC Hall', 'Kochi', '1,00,000/ day', 4.2, 'assets/abchall.jpeg'),
    ],
  ];

  // List of section titles
  final List<String> sectionTitles = <String>[
    'Popular Venues',
    'Event Organizers',
    'Photography',
    'Best for Weddings',
    'Best Deals',
  ];

  VenueGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Venue Grid')),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: List.generate(sectionTitles.length, (index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                 child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          sectionTitles[index],
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextButton(
          onPressed: () {
           
          },
          child: const Text('See all', style: TextStyle(color: Colors.blue)),
        ),
      ],
    ),
    const SizedBox(height: 10), // Adjusted space here
    GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        
        crossAxisSpacing: 5,
        mainAxisSpacing: 10,
      ),
      itemCount: venuesBySection[index].length,
      itemBuilder: (context, itemIndex) {
        final venue = venuesBySection[index][itemIndex];
        return VenueGridItem(venue: venue);
      },
    ),
  ],
),

                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}