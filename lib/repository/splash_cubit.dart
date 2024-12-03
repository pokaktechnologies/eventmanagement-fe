
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashCubit extends Cubit<void> {
  SplashCubit() : super(null);

  
  Future<void> startSplash() async {
    await Future.delayed(const Duration(seconds: 4));
    emit(null); 
  }
}