import 'package:flutter_bloc/flutter_bloc.dart';

class RateEvent {}

class RateBloc extends Bloc<RateEvent, double> {
  RateBloc() : super(0.0);

  @override
  Stream<double> mapEventToState(RateEvent event) async* {
   
    yield 0.0;
  }
}
