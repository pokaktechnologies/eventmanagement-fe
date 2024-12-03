import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokakevent_management/ui/location.dart';
import 'package:pokakevent_management/repository/Profile_cubit.dart';


class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, 
      body: BlocProvider(
        create: (_) => ProfileCubit(),
        child: LayoutBuilder(
          builder: (context, constraints) {
            double screenHeight = constraints.maxHeight;
            double screenWidth = constraints.maxWidth;
          

            return Stack(
              children: [
                _buildBackgroundImage(),
                   Padding(
                    padding: const EdgeInsets.only(top: 180),
                    child: Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _buildHeaderText(),
                          const SizedBox(height: 16),
                          const _CustomTextField(
                            label: 'Email/Contact Number',
                          ),
                          const SizedBox(height: 30),
                          const _CustomTextField(
                            label: 'Name',
                          ),
                          const SizedBox(height: 30),
                          _GenderSelection(),
                          const SizedBox(height: 50),
                          _SaveButton(
                            screenHeight: screenHeight,
                            screenWidth: screenWidth,
                          ),
                         
                        ],
                      ),
                    ),
                  ),
                
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildBackgroundImage() {
    return Positioned.fill(
      child: ColorFiltered(
        colorFilter: ColorFilter.mode(
          Colors.black.withOpacity(0.4),
          BlendMode.darken,
        ),
        child: Image.asset(
          "assets/profilejpeg.jpeg",
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildHeaderText() {
    return const Text(
      'Complete Your Profile',
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      textAlign: TextAlign.center,
    );
  }
}

class _CustomTextField extends StatelessWidget {
  final String label;
  const _CustomTextField({required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.white),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 3),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        style: const TextStyle(color: Colors.pink),
      ),
    );
  }
}

class _GenderSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, String>(
      builder: (context, selectedGender) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildGenderOption(context, label: 'Male', selectedGender: selectedGender),
            const SizedBox(width: 20),
            _buildGenderOption(context, label: 'Female', selectedGender: selectedGender),
          ],
        );
      },
    );
  }

  Widget _buildGenderOption(BuildContext context, {required String label, required String selectedGender}) {
    return GestureDetector(
      onTap: () {
        context.read<ProfileCubit>().selectGender(label);
            Navigator.push
                (context,MaterialPageRoute(builder: (context)=>const TrackScreen()));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: selectedGender == label ? Colors.green : Colors.transparent,
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          label,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class _SaveButton extends StatelessWidget {
  final double screenHeight;
  final double screenWidth;

  const _SaveButton({required this.screenHeight, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: screenHeight * 0.06),
      child: InkWell(
        onTap: () {
          
        },
        child: Container(
          height: screenHeight * 0.06,
          width: screenWidth * 0.8,
          decoration: BoxDecoration(
            color: const Color(0xFF00918C),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              "Save",
              style: TextStyle(
                color: Colors.white,
                fontSize: screenHeight * 0.025,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
