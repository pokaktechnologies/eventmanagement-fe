import 'package:flutter_bloc/flutter_bloc.dart';

enum SearchState { all, eventOrganisation, photography, error }

class SearchBloc extends Cubit<SearchState> {
  SearchBloc() : super(SearchState.all);

  void changePage(SearchState state) {
    emit(state);
  }


  // Future<void> fetchData() async {
  //   try {
    
  //     await Future.delayed(const Duration(seconds: 1));
     
  //     throw Exception('An error occurred while fetching data');
  //   } catch (e) {
  //     emit(SearchState.error);
  //   }
  // }
}

