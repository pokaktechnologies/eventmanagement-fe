import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokakevent_management/ui/on_board_screen.dart';
import 'package:pokakevent_management/ui/on_board_screen2.dart';
import 'package:pokakevent_management/ui/on_board_screen3.dart';
import 'package:pokakevent_management/ui/onboard_screen4.dart';
import 'package:pokakevent_management/ui/sign_in.dart';
import 'package:pokakevent_management/repository/onboard_cubit.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class ConnectionBody extends StatefulWidget {
  const ConnectionBody({super.key});

  @override
  State<ConnectionBody> createState() => _ConnectionBodyState();
}

class _ConnectionBodyState extends State<ConnectionBody> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaHeight = MediaQuery.of(context).size.height;
    final mediaWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          _buildPageView(mediaHeight, mediaWidth),
          _buildBottomContent(mediaHeight, mediaWidth),
        ],
      ),
    );
  }

  Widget _buildPageView(double mediaHeight, double mediaWidth) {
    return SizedBox(
      height: mediaHeight,
      width: mediaWidth,
      child: BlocBuilder<OnboardingCubit, int>(
        builder: (context, currentPage) {
          return PageView(
            controller: _pageController,
            onPageChanged: (index) {
              context.read<OnboardingCubit>().onPageChanged(index);
            },
            children: const [
              OnBoardScreen(),
              OnBoardScreen2(),
              OnBoardScreen3(),
              OnboardScreen4(),
            ],
          );
        },
      ),
    );
  }

  Widget _buildBottomContent(double mediaHeight, double mediaWidth) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(bottom: mediaHeight * 0.05),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildPageIndicator(mediaHeight),
            SizedBox(height: mediaHeight * 0.05),
            _buildContinueButton(mediaHeight, mediaWidth),
          ],
        ),
      ),
    );
  }

  Widget _buildPageIndicator(double mediaHeight) {
    return BlocBuilder<OnboardingCubit, int>(
      builder: (context, currentPage) {
        return SmoothPageIndicator(
          controller: _pageController,
          count: 4,
          effect: const WormEffect(
            dotHeight: 12,
            dotWidth: 12,
            activeDotColor: Color(0xFF00918C),
            dotColor: Colors.white,
          ),
        );
      },
    );
  }

  Widget _buildContinueButton(double mediaHeight, double mediaWidth) {
    return BlocBuilder<OnboardingCubit, int>(
      builder: (context, currentPage) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: mediaWidth * 0.1),
          child: GestureDetector(
            onTap: () {
              if (currentPage < 3) {
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
                context.read<OnboardingCubit>().nextPage(SignIn);
              } else {
                Navigator.push
                (context,MaterialPageRoute(builder: (context)=>const SignIn()));
              }
            },
            child: Padding(
              padding: EdgeInsets.only(bottom: mediaHeight * 0.15),
              child: Container(
                height: mediaHeight * 0.06, 
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFF00918C),
                  borderRadius: BorderRadius.circular(10),
              ),
                child: Center(
                  child: Text(
                    currentPage == 3 ? 'Get Started' : 'Continue',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: mediaHeight * 0.025,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
 




 

