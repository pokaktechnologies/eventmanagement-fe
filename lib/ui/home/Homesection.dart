
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokakevent_management/models/completed_m.dart';
import 'package:pokakevent_management/repository/home_cubit.dart';
import 'package:pokakevent_management/ui/home/homescreen.dart';



class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBar(
          automaticallyImplyLeading: false, 
          title: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    context.read<HomeCubit>().changePage(0); 
                    _pageController.jumpToPage(0);  
                  },
                  child: Container(
                    height: 50,
                    width: 180,
                    decoration: BoxDecoration(
                      color: context.watch<HomeCubit>().state == 0 ? Colors.teal : Colors.transparent,  
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(child: Text("Upcoming")),
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    context.read<HomeCubit>().changePage(1);  
                    _pageController.jumpToPage(1); 
                  },
                  child: Container(
                    height: 50,
                    width: 180,
                    decoration: BoxDecoration(
                      color: context.watch<HomeCubit>().state == 1 ? Colors.teal : Colors.transparent,  
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(child: Text('Completed')),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          context.read<HomeCubit>().changePage(index);  
        },
        children: const [
          UpComing(),  
          Complete(),  
        ],
      ),
    );
  }
}




