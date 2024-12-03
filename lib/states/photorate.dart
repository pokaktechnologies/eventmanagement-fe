import 'package:flutter_bloc/flutter_bloc.dart';


class Rate3Event {}

class Rate3Bloc extends Bloc<Rate3Event, double> {
  Rate3Bloc() : super(0.0);

  @override
  Stream<double> mapEventToState(Rate3Event event) async* {
   
    yield 0.0; 
  }
}