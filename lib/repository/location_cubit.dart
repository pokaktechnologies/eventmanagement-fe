import 'package:flutter_bloc/flutter_bloc.dart';

class TrackCubit extends Cubit<String> {
  TrackCubit() : super('');

  void selectLocation(String location) {
    emit(location); 
  }
}