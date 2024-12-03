import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokakevent_management/ui/eventscreen.dart';
import 'package:pokakevent_management/ui/eventscreens/eventhome.dart';
import 'package:pokakevent_management/ui/home/Homesection.dart';
import 'package:pokakevent_management/ui/home/search/searchSection.dart';
import 'package:pokakevent_management/ui/profile.dart';
import 'package:pokakevent_management/ui/userprofile.dart';
import 'package:pokakevent_management/view/homepa.dart';
import 'package:pokakevent_management/repository/onboard_cubit.dart';

class Bottom extends StatefulWidget {
  const Bottom({super.key});

  @override
  _BottomState createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  final PageController _pageController = PageController();

  final List<Widget> _pages = [
    EventDiscoverScreen(),
     const SearchView(),
    const HomeView(),
    const ProfileScreen(),
   

      
    // const EventHome(),
   
   
    
    // EventHomeMain(),
  ];

  final List<String> _labels = ['Home', 'Event', 'Booking', 'Settings'];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    // Update the state in Bloc when the page changes
    context.read<OnboardingCubit>().onPageChanged(index);
  }

  void _onItemTapped(int index) {
    // Navigate to the selected page with animation
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    // Update the state in Bloc
    context.read<OnboardingCubit>().onPageChanged(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<OnboardingCubit, int>(
        builder: (context, currentPage) {
          return PageView(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            children: _pages,
          );
        },
      ),
      bottomNavigationBar: BlocBuilder<OnboardingCubit, int>(
        builder: (context, currentPage) {
          return Container(
            height: 80,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 6,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(4, (index) {
                bool isSelected = currentPage == index;
                return InkWell(
                  onTap: () => _onItemTapped(index),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        [
                          Icons.home,
                          Icons.event,
                          Icons.book,
                          Icons.settings,
                        ][index],
                        color: isSelected ? Colors.teal : Colors.grey,
                        size: 28,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        _labels[index],
                        style: TextStyle(
                          color: isSelected ? Colors.teal : Colors.grey,
                          fontSize: 12,
                          fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                        ),
                      ),
                      if (isSelected)
                        Container(
                          margin: const EdgeInsets.only(top: 4),
                          width: 5,
                          height: 5,
                          decoration: const BoxDecoration(
                            color: Colors.teal,
                            shape: BoxShape.circle,
                          ),
                        ),
                    ],
                  ),
                );
              }),
            ),
          );
        },
      ),
    );
  }
}






