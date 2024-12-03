
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<String> {
  ProfileCubit() : super('');

  void selectGender(String gender) {
    emit(gender);
  }
}