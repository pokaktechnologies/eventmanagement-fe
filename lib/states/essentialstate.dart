import 'package:flutter_bloc/flutter_bloc.dart';

// Bloc Event
abstract class EventHomeEvent {}

class SelectContainer extends EventHomeEvent {
  final int index;
  SelectContainer(this.index);
}

// Bloc State
class EventHomeState {
  final int selectedIndex;
  EventHomeState(this.selectedIndex);
}

// Bloc Implementation
class EventHomeBloc extends Bloc<EventHomeEvent, EventHomeState> {
  EventHomeBloc() : super(EventHomeState(-1));

  Stream<EventHomeState> mapEventToState(EventHomeEvent event) async* {
    if (event is SelectContainer) {
      yield EventHomeState(event.index);
    }
  }
}
