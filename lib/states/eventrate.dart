import 'package:flutter_bloc/flutter_bloc.dart';


class Rate2Event {}

class Rate2Bloc extends Bloc<Rate2Event, double> {
  Rate2Bloc() : super(0.0);

  @override
  Stream<double> mapEventToState(Rate2Event event) async* {
   
    yield 0.0; 
  }
}
