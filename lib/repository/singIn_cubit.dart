import 'package:bloc/bloc.dart';

class SignInCubit extends Cubit<bool> {
  SignInCubit() : super(false); 

  void toggleRememberMe(bool value) {
    emit(value);
  }
}
