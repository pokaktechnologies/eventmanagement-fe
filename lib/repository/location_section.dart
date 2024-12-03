import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokakevent_management/repository/location_cubit.dart';
import 'package:pokakevent_management/ui/bottomnav/bottomnavigationbar.dart';


class LocationSelection extends StatelessWidget {
  const LocationSelection({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    
    return BlocBuilder<TrackCubit, String>(
      builder: (context, selectedLocation) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildLocationOption(
              context,
              label: 'Use current location',
              selectedLocation: selectedLocation,
              height: height * 0.06, 
              width: width * 0.8, 
              decoration: BoxDecoration(
                color: selectedLocation == 'Use current location' ? const Color(0xFF00918C) : Colors.transparent,
                border: Border.all(color: Colors.grey, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            SizedBox(height: height * 0.05), 
            _buildLocationOption(
              context,
              label: 'Manual location',
              selectedLocation: selectedLocation,
              height: height * 0.06, 
              width: width * 0.8, 
              decoration: BoxDecoration(
                color: selectedLocation == 'Manual location' ? const Color(0xFF00918C) : Colors.transparent,
                border: Border.all(color: Colors.grey, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildLocationOption(BuildContext context, {
    required String label,
    required String selectedLocation,
    required double height,
    required double width,
    required BoxDecoration decoration,
  }) {
    return GestureDetector(
      onTap: () {
        context.read<TrackCubit>().selectLocation(label);
            Navigator.push
                (context,MaterialPageRoute(builder: (context)=> const Bottom()));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05), 
        height: height,
        width: width,
        decoration: decoration,
        alignment: Alignment.center,
        child: Text(
          label,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

