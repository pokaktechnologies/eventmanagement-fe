
import 'package:flutter/material.dart';


import 'package:pokakevent_management/ui/eventscreens/eventhomesubone.dart';
import 'package:pokakevent_management/ui/eventscreens/eventlist.dart';


class EventModel {
  final String imageUrl;
  final String title;
  final String subtitle;

  EventModel({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
  });
}

class EventHomeMain extends StatefulWidget {
  EventHomeMain({super.key});
  
final List<Map<String, String>> items = [
  {'image': 'https://media.istockphoto.com/id/184297768/photo/hip-hop-singer.jpg?s=1024x1024&w=is&k=20&c=Hve4wcD8HEcS4VOr37UmBso7DBfKUQ4ZNXNqXdC5I7A=',                                       'title': 'music ', 'subtitle': 'show'},
  {'image': 'https://media.istockphoto.com/id/172159064/photo/silhouette-of-singer-performing-on-stage-under-spotlights.jpg?s=612x612&w=0&k=20&c=5-tCSQzARJYAKLJXBIDKiff8GoMUhQz05aLExeyxJ70=', 'title': 'Comedy ', 'subtitle': 'Show'},
  {'image': 'https://media.istockphoto.com/id/172159064/photo/silhouette-of-singer-performing-on-stage-under-spotlights.jpg?s=612x612&w=0&k=20&c=5-tCSQzARJYAKLJXBIDKiff8GoMUhQz05aLExeyxJ70=', 'title': 'business', 'subtitle': 'Event'},
  {'image': 'https://media.istockphoto.com/id/172159064/photo/silhouette-of-singer-performing-on-stage-under-spotlights.jpg?s=612x612&w=0&k=20&c=5-tCSQzARJYAKLJXBIDKiff8GoMUhQz05aLExeyxJ70=', 'title': 'auto ',    'subtitle':   'expo'},
{'image': 'https://media.istockphoto.com/id/172159064/photo/silhouette-of-singer-performing-on-stage-under-spotlights.jpg?s=612x612&w=0&k=20&c=5-tCSQzARJYAKLJXBIDKiff8GoMUhQz05aLExeyxJ70=', 'title': 'Title 3', 'subtitle': 'Subtitle 3'},
{'image': 'https://media.istockphoto.com/id/172159064/photo/silhouette-of-singer-performing-on-stage-under-spotlights.jpg?s=612x612&w=0&k=20&c=5-tCSQzARJYAKLJXBIDKiff8GoMUhQz05aLExeyxJ70=', 'title': 'Title 3', 'subtitle': 'Subtitle 3'},
{'image': 'https://media.istockphoto.com/id/172159064/photo/silhouette-of-singer-performing-on-stage-under-spotlights.jpg?s=612x612&w=0&k=20&c=5-tCSQzARJYAKLJXBIDKiff8GoMUhQz05aLExeyxJ70=', 'title': 'Title 3', 'subtitle': 'Subtitle 3'},
  // Add more items as needed
];
  final List<String> images = [
  
  'assets/Phographyev.jpeg',
     'assets/hall1.jpeg',
     'assets/hall2.jpeg',
     'assets/hall3.jpeg',
     'assets/hall5.jpeg',
];

  @override
  _EventHomeMainState createState() => _EventHomeMainState();
}

class _EventHomeMainState extends State<EventHomeMain> {
  bool _isSearchOpen = false;
  bool _isFavorite = false;
  final TextEditingController _searchController = TextEditingController();

  void _toggleSearch() {
    setState(() {
      _isSearchOpen = !_isSearchOpen;
      if (!_isSearchOpen) _searchController.clear(); // Clear text when closed
    });
  }

  void _toggleFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final screenHeight = constraints.maxHeight;
          final screenWidth = constraints.maxWidth;
          final mediaQueryHeight = MediaQuery.of(context).size.height;
          final mediaQueryWidth = MediaQuery.of(context).size.width;
          final double topPadding = screenHeight * 0.02;

          return SizedBox(
          height: mediaQueryHeight,
            width: mediaQueryWidth,
            child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.blue, size: 20),
                      SizedBox(width: 8),
                      Text(
                        'Kochi',
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                    ],
                  ),
                  




                  //  Positioned(
                  //       right: 100,
                  //       top: 80,
                  //       child: GestureDetector(
                  //         onTap: _toggleFavorite,
                  //         child: Icon(
                  //           Icons.favorite,
                  //           color: _isFavorite ? Colors.red : Colors.black,
                  //           size: 24,
                  //         ),
                  //       ),
                  //     ),
                  //     if (_isSearchOpen)
                  //       Positioned(
                  //         top: 130,
                  //         left: 30,
                  //         right: 30,
                  //         child: Container(
                  //           height: 50,
                  //           decoration: BoxDecoration(
                  //             color: Colors.grey[200],
                  //             borderRadius: BorderRadius.circular(10),
                  //             border: Border.all(color: Colors.black.withOpacity(0.7), width: 2),
                  //           ),
                  //           child: TextField(
                  //             controller: _searchController,
                  //             decoration: InputDecoration(
                  //               hintText: 'Search..',
                  //               hintStyle: TextStyle(color: Colors.grey),
                  //               prefixIcon: Icon(Icons.search, color: Colors.grey),
                  //               suffixIcon: IconButton(
                  //                 icon: Icon(Icons.close, color: Colors.grey),
                  //                 onPressed: _toggleSearch,
                  //               ),
                  //               border: InputBorder.none,
                  //               contentPadding: EdgeInsets.symmetric(vertical: 15),
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     if (!_isSearchOpen)
                  //       Positioned(
                  //         right: 30,
                  //         top: 70,
                  //         child: IconButton(
                  //           icon: Icon(Icons.search, color: Colors.black),
                  //           onPressed: _toggleSearch,
                  //         ),
                  //       ),
                  //   ],
                  // ),






                  Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          _isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: _isFavorite ? Colors.red : Colors.black,
                        ),
                        onPressed: _toggleFavorite,
                      ),
                      IconButton(
                        icon: Icon(
                          _isSearchOpen ? Icons.close : Icons.search,
                          color: Colors.black,
                        ),
                        onPressed: _toggleSearch,
                      ),
                    ],
                  ),
                ],
              ),
              if (_isSearchOpen)
              
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black.withOpacity(0.7), width: 2),
                  ),
                  child:  TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          hintText: 'Search..',
                          hintStyle: const TextStyle(color: Colors.grey),
                          prefixIcon: const Icon(Icons.search, color: Colors.grey),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.close, color: Colors.grey),
                            onPressed: _toggleSearch,
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(vertical: 15),
                        ),
                      ),
                       

                   


                ),
                
              const SizedBox(height: 10),
              EventList(items: widget.items), // Event list section
              const SizedBox(height: 10),
              Material(
                elevation: 20,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.network(
                          "https://media.istockphoto.com/id/172159064/photo/silhouette-of-singer-performing-on-stage-under-spotlights.jpg?s=1024x1024&w=is&k=20&c=jrisysfzf8z-9SOxAoEdkTNYizOdDX75tfQJ_2rrR_w=",
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.3,
                        ),
                      ),
                      const Positioned(
                        bottom: 20,
                        left: 20,
                        right: 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Event Title',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Location: Kochi',
                              style: TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Date: 24 Nov, 2024',
                              style: TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Description: Join us for a night of music!',
                              style: TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Price: \$30',
                              style: TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
            
              VenueGalleryEvent(
                            images: widget.images,
                            horizontalPadding: 0.2,
                            verticalPadding: 0.6,
                            crossAxisCount: 2,
                            aspectRatio: 1.1,
                            items: const [],
                          ),
            ],
          ),
        ),
      ));
        },
      ),
    );
  }
}