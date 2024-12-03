import 'package:flutter/material.dart';


class EventDiscoverScreen extends StatelessWidget {
  final List<Venue> popularVenues = [
    Venue('Grand Hyatt', 'Kochi', '₹ 1,50,000/day', 4.5, 'assets/hall1.jpeg','en'),
    Venue('Durbar Hall', 'Kochi', '₹ 2,00,000/day', 4.7, 'assets/hall2.jpeg','en'),
  ];

  final List<Venue> eventOrganizers = [
    Venue('RK Event', 'Kochi', '₹ 1,80,000/day', 4.6, 'assets/rkhalljpeg.jpeg','en'),
    Venue('360 Events', 'Kochi', '₹ 1,20,000/day', 4.4, 'assets/hall3.jpeg','en'),
  ];

  final List<Venue> Photography = [
    Venue('30 MM Photography', 'Kochi', '₹ 1,80,000/day', 4.6, 'assets/hall5.jpeg','en'),
    Venue('Lightroom Photography', 'Photography', '₹ 1,20,000/day', 4.4, 'assets/Phographyev.jpeg','en'),
  ];


final List<Venue> BestDeals = [
    Venue('30 MM Photography', 'Kochi', '₹ 1,80,000/day', 4.6, 'assets/xywhall.jpeg','en'),
    Venue('Lightroom Photography', 'kochi', '₹ 1,20,000/day', 4.4, 'assets/abchall.jpeg','en'), 


  ];
  
String locale = 'en';

  EventDiscoverScreen({super.key}); 



  @override
  Widget build(BuildContext context) {
       final mediaHeight = MediaQuery.of(context).size.height;
    final mediaWidth = MediaQuery.of(context).size.width;
 
  return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            
           
            Container(
              height: mediaHeight * 0.3, 
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/background.jpg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.3), 
                    BlendMode.darken,
                  ),
                ),
                gradient: LinearGradient(
                  colors: [Colors.brown, Colors.black.withOpacity(0.5)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 60),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.location_on, color: Colors.white),
                            const SizedBox(width: 8),
                            GestureDetector(
                              onTap: () {
                               
                              },
                              child: const Text(
                                'Find Location',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Icon(Icons.favorite, color: Colors.white),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Discover Events',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Explore new venues near you',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage('assets/profile.jpeg'),
                          backgroundColor: Colors.white,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            
           
            Padding(
              padding: const EdgeInsets.only(top: 220.0), 
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: _buildSearchBar(),
                  ),
                  const SizedBox(height: 10),
                  _buildContainerScreen(),
                  _buildCategorySection(),
                  _buildSectionTitle('Popular Venues'),
                  _buildVenueGrid(popularVenues),
                  _buildSectionTitle('Event Organizers'),
                  _buildVenueGrid(eventOrganizers),
                    _buildSectionTitle('Photography'),
                  _buildVenueGrid(Photography),
                  _buildSectionTitle('Best deal'),
                  _buildVenueGrid(BestDeals),
                  const SizedBox(height:30,),
                   _buildVenueGrid(BestDeals),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search',
          prefixIcon:const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }

Widget _buildContainerScreen() {
  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20.0),
      child: Column(
        children: [
         Container(
  height: 200,
  width: double.infinity,
  decoration: BoxDecoration(
    color: Colors.blue, 
    borderRadius: BorderRadius.circular(30), 
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.5), 
        spreadRadius: 2,
        blurRadius: 10, 
        offset: const Offset(0, 4), 
      ),
    ],
    border: Border.all(
      color: Colors.black, 
      width: 1,
    ),
  ),
  child: ClipRRect(
    borderRadius: BorderRadius.circular(30),
    child: Image.asset("assets/homescreen.png",fit: BoxFit.cover,
    
    ),
  ),
  
)

          
         
        ],
      ),
    ),
  );
}


  Widget _buildCategorySection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Categories',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Material(
            elevation: 3,
            borderOnForeground: true,
            borderRadius: BorderRadius.circular(12),
            child: Container(
              height: 80,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.white)),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildCategoryItem('Wedding', Colors.red),
                  _buildCategoryItem('Haldi', Colors.orange),
                  _buildCategoryItem('Engagement', Colors.purple),
                  _buildCategoryItem('Baby Shower', Colors.lightBlue),
                   _buildCategoryItem('make up', Colors.blue),
                  _buildCategoryItem('Events shoot', Colors.lightGreen,),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(String title, Color color) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white,width: 1)
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          TextButton(
            onPressed: () {},
            child: const Text('See all'),
          ),
        ],
      ),
    );
  }

  Widget _buildVenueGrid(List<Venue> venues) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: venues.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 16,
          childAspectRatio: 5 / 4.8,
        ),
        itemBuilder: (context, index) {
          return _buildVenueCard(venues[index], locale);
        },
      ),
    );
  }

  Widget _buildVenueCard(Venue venue, String locale) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
  borderRadius: const BorderRadius.vertical(top: Radius.circular(15), bottom: Radius.circular(15)),
  child: Stack(
    children: [
      Image.asset(
        venue.image,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      ),
      const Positioned(
        top: 8, // Adjust the position as needed
        right: 8, // Adjust the position as needed
        child: Icon(
          Icons.favorite,
          color: Colors.white,size: 20, // Add color if needed
        ),
      ),
    ],
  ),
),

          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(venue.name, style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 4,),
         Row(
          children: [
            const Icon(Icons.location_on_outlined, color: Colors.black),
            const SizedBox(width: 4), 
            Text(
              ' ${venue.location}',
              style: const TextStyle(fontWeight: FontWeight.normal),
            ),
          ],
        ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(venue.price),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 16),
                    Text(venue.rating.toString()),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Venue {
  final String name;
  final String location;
  final String price;
  final double rating;
  final String image;
  final String en;

  Venue(this.name, this.location, this.price, this.rating, this.image,this.en);
}


















