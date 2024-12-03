import 'package:flutter/material.dart';
import 'package:pokakevent_management/ui/eventsub.dart';

class EventHome extends StatefulWidget {
  const EventHome({super.key});

  @override
  _EventHomeState createState() => _EventHomeState();
}

final List<String> images = [
  'assets/Phographyev.jpeg',
  'assets/hall1.jpeg',
  'assets/hall2.jpeg',
  'assets/hall3.jpeg',
  'assets/hall5.jpeg',
];

class _EventHomeState extends State<EventHome> {
  int selectedIndex = 0;
  bool isExpanded = false;

  // Track selected container index

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    double containerHeight = height * 0.3;
    double containerWidth = width * 0.8;
    double textSize = width * 0.05;
    double iconSize = width * 0.07;
    double paddingSize = width * 0.02;

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: height * 0.1,
                  left: paddingSize,
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      color: Colors.black,
                      iconSize: 30, // You can adjust the size of the icon here
                      onPressed: () {
                        Navigator.pop(
                            context); // Go back to the previous screen
                      },
                    ),
                    SizedBox(width: paddingSize),
                    Text(
                      "Venue Detail",
                      style: TextStyle(
                        fontSize: textSize,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: containerHeight * 0.1),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Material(
                  elevation: 10,
                  borderOnForeground: false,
                  borderRadius: BorderRadius.circular(15),
                  child: Stack(
                    children: [
                      Container(
                        height: containerHeight * 0.80,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            "https://www.shutterstock.com/image-photo/wedding-hall-other-function-facility-260nw-487246921.jpg",
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            },
                            errorBuilder: (context, error, stackTrace) {
                              return const Center(
                                child: Icon(Icons.error, color: Colors.red),
                              );
                            },
                          ),
                        ),
                      ),
                      const Positioned(
                        top: 10,
                        right: 10,
                        child: Icon(
                          Icons.favorite,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: paddingSize),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Row(
                  children: [
                    Text(
                      "Le Maritime",
                      style: TextStyle(fontSize: textSize),
                    ),
                    IconButton(
                      icon: const Icon(Icons.location_on),
                      color: Colors.red,
                      iconSize: 30,
                      onPressed: () {
                        print("Location icon pressed");
                      },
                    ),
                    const Text("vypin road kochi"),
                  ],
                ),
              ),
              SizedBox(height: paddingSize),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt"),
                    SizedBox(height: paddingSize),
                    Row(
                      children: [
                        ...List.generate(6, (index) {
                          return Icon(
                            Icons.star_rate,
                            color: index < 5 ? Colors.amber : Colors.grey,
                            size: iconSize,
                          );
                        }),
                        const SizedBox(width: 10),
                        const Text("(4.5) 1k Reviews"),
                      ],
                    ),
                    SizedBox(height: paddingSize),
                    Text(
                      "Starting From",
                      style: TextStyle(fontSize: textSize),
                    ),
                    SizedBox(height: paddingSize),
                    Row(
                      children: [
                        const Icon(Icons.currency_rupee),
                        const Text(
                          "1,50,000/ day",
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(width: containerWidth * 0.3),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(Icons.share, size: iconSize),
                        ),
                        SizedBox(width: containerWidth * 0.03),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(Icons.call, size: iconSize),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: paddingSize),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Material(
                  elevation: 10,
                  borderOnForeground: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: const BorderSide(
                        color: Color.fromARGB(255, 214, 214, 214), width: 1),
                  ),
                  child: Container(
  height: containerHeight * 0.3, // You can also use MediaQuery for dynamic height
  width: double.infinity,
  decoration: BoxDecoration(
    color: Colors.grey[200],
    borderRadius: BorderRadius.circular(12),
  ),
  
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Family Icon Section
           Padding(
  padding: EdgeInsets.symmetric(
    vertical: height * 0.02,  // 3% of screen height for vertical padding
    horizontal: width * 0.02, // 5% of screen width for horizontal padding
  ),
  child: Icon(
    Icons.family_restroom,
    size: width * 0.08,  // 8% of screen width for icon size, adjust based on needs
    color: Colors.teal,
  ),
),
            // Seats Information Section
            const Flexible(
              child: Column(
                children: [
                  Text('1000+'),
                  Text("Seats"),
                ],
              ),
            ),
            // Wallet Section with Parking
            const Flexible(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.wallet,
                        color: Colors.teal,
                        size: 26,
                      ),
                      Column(
                        children: [
                          Text("Wallet"),
                          Text(
                            'parking',
                            style: TextStyle(fontSize: 13),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Rooms Information Section
            const Flexible(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.room_service,
                          color: Colors.teal, size: 26),
                      Column(
                        children: [
                          Text('100+'),
                          Text('Rooms'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  
),

                ),
              ),
              SizedBox(height: paddingSize),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "Essentials",
                  style: TextStyle(fontSize: 25),
                ),
              ),
              SizedBox(height: paddingSize),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = 0; // First container selected
                      });
                    },
                    child: 
                    
                    Container(
                      
                      height: containerHeight * 0.2,
                      width: containerWidth * 0.4,
                      decoration: BoxDecoration(
                        color:
                            selectedIndex == 0 ? Colors.teal : Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
    child: Align(
      alignment: Alignment.center,
      child: Text(
        "Event organisation",
        textAlign: TextAlign.center,  // Center text horizontally if required
        maxLines: 1,                  // Limit text to 1 line
        overflow: TextOverflow.ellipsis,  // Handle overflow by showing "..."
        style: TextStyle(
          color: selectedIndex == 0 ? Colors.white : Colors.black,
        ),
      ),
    ),
  ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = 1; // Second container selected
                      });
                    },
                    child: Container(
                      height: containerHeight * 0.2,
                      width: containerWidth * 0.4,
                      decoration: BoxDecoration(
                        color:
                            selectedIndex == 1 ? Colors.teal : Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text("Catering",
                            style: TextStyle(
                              color: selectedIndex == 1
                                  ? Colors.white
                                  : Colors.black,
                            )),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: containerHeight * 0.1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = 2; // Third container selected
                      });
                    },
                    child: Container(
                      height: containerHeight * 0.2,
                      width: containerWidth * 0.4,
                      decoration: BoxDecoration(
                        color:
                            selectedIndex == 2 ? Colors.teal : Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          "Decoration",
                          style: TextStyle(
                            color: selectedIndex == 2
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = 3; // Fourth container selected
                      });
                    },
                    child: Container(
                      height: containerHeight * 0.2,
                      width: containerWidth * 0.4,
                      decoration: BoxDecoration(
                        color:
                            selectedIndex == 3 ? Colors.teal : Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          "Photography",
                          style: TextStyle(
                            color: selectedIndex == 3
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: containerHeight * 0.1),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Container(
                  height: containerHeight * 0.2,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Center(
                      child: Text(
                    "Procced",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  )),
                ),
              ),
              const SizedBox(height: 60),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Previous Event Photos",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          width: 100,
                        ),
                        Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                                onPressed: () {},
                                child: const Text(
                                  "See all",
                                  style: TextStyle(
                                      fontSize: 17, color: Colors.black),
                                )))
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                height: containerHeight * 0.5, // Adjust the height as needed
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: images
                      .length, // Replace with the number of images you have
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Container(
                        width: containerWidth * 0.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey[200],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            images[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text(
                      "About US",
                      style: TextStyle(fontSize: textSize, color: Colors.black),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      isExpanded
                          ? "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt."
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt."
                          : "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt...",
                      style: const TextStyle(fontSize: 16),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          isExpanded = !isExpanded;
                        });
                      },
                      child: Text(
                        isExpanded ? "Read less" : "Read more",
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: containerHeight * 0.1,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    Text(
                      "Review & Rating",
                      style: TextStyle(
                        fontSize: textSize,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: containerHeight * 0.05,
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                          "https://s3-alpha-sig.figma.com/img/a9e4/4a5e/69ec69281030b671fccd41cc617fbefc?Expires=1730678400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=JL8tRUriCvGI6hOHvIpmpcYnUhtLYkA2SDqqGcZLDqKB9dV8MPuI4UeW8kXxWC437rc~kAuzkkXb4lKtAl8I~Bpx5WdQQUiyxKAGJWLD8I4jtCDmJ5EluC2CZQc~BBpYpopPfpNK8fgmjlVNieFjbqkWy3j1aG2ZYlACZ9dFqjvDDoB9oXxk~M1U65pQNeyNrJbd2usAzOk0TEBqQGwI~GWbMbLBSdSntn3Dgsr1aO4Yz258WnNu6whxoOK~rXzBG~eGehIZwcc9Oufqp9-WDF0HmGd4fYwD-zFbW-x-kOLtzKVLwC8ct1kGlRdZ7gvQAnV9wiR5LGlvQpI4hXDfcQ__"),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Rahul',
                        style:
                            TextStyle(fontSize: textSize, color: Colors.black),
                      ),
                      const Text(
                        '31/02/2024',
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      )
                    ],
                  ),
                  SizedBox(width: width * 0.3),
                  Column(
                    children: [
                      Row(
                        children: [
                          ...List.generate(5, (index) {
                            return Icon(
                              Icons.star_rate,
                              color: index < 4 ? Colors.amber : Colors.grey,
                              size: 20,
                            );
                          }),
                        ],
                      ),
                      SizedBox(
                        height: height*0.01,
                      ),
                      const Text('4.05/Rating')
                    ],
                    
                  ),
                  SizedBox(width: width*0.01,)
                ],
              ),
           
              
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt."),
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                          "https://s3-alpha-sig.figma.com/img/a9e4/4a5e/69ec69281030b671fccd41cc617fbefc?Expires=1730678400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=JL8tRUriCvGI6hOHvIpmpcYnUhtLYkA2SDqqGcZLDqKB9dV8MPuI4UeW8kXxWC437rc~kAuzkkXb4lKtAl8I~Bpx5WdQQUiyxKAGJWLD8I4jtCDmJ5EluC2CZQc~BBpYpopPfpNK8fgmjlVNieFjbqkWy3j1aG2ZYlACZ9dFqjvDDoB9oXxk~M1U65pQNeyNrJbd2usAzOk0TEBqQGwI~GWbMbLBSdSntn3Dgsr1aO4Yz258WnNu6whxoOK~rXzBG~eGehIZwcc9Oufqp9-WDF0HmGd4fYwD-zFbW-x-kOLtzKVLwC8ct1kGlRdZ7gvQAnV9wiR5LGlvQpI4hXDfcQ__"),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Rahul',
                        style:
                            TextStyle(fontSize: textSize, color: Colors.black),
                      ),
                      const Text(
                        '31/02/2024',
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      )
                    ],
                  ),
                  SizedBox(width: width * 0.3),
                  Column(
                    children: [
                      Row(
                        children: [
                          ...List.generate(5, (index) {
                            return Icon(
                              Icons.star_rate,
                              color: index < 4 ? Colors.amber : Colors.grey,
                              size: 20,
                            );
                          }),
                        ],
                      ),
                      
                          SizedBox( height: height * 0.01,),
                      
                      const Text('4.05/Rating'),
                    ],
                  ),
                ],
              ),
               SizedBox(width: width*0.01,),
             
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt."),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "More reviews",
                    style: TextStyle(
                      fontSize: textSize,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: paddingSize),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.black,
                    size: iconSize,
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Browse Similar Venues",
                  style: TextStyle(fontSize: textSize),
                ),
              ),
              SizedBox(
                // height: MediaQuery.of(context).size.height * 0.8, // Adjust height as needed
                child: Column(
                  children: [
                    VenueGallery(
                      images: images,
                      horizontalPadding: 20,
                      verticalPadding: 0.01,
                      crossAxisCount: 2,
                      aspectRatio: 1.2,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
