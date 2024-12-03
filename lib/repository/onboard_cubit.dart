import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingCubit extends Cubit<int> {
  final int totalPages = 4; 

  OnboardingCubit() : super(0); 

  
  void nextPage(Type signIn) {
    if (state < totalPages - 1) {
      emit(state + 1);
    }
  }

  
  void onPageChanged(int index) {
    emit(index);
  }
}