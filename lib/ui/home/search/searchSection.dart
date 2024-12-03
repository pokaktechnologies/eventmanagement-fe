import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokakevent_management/models/allevent_m.dart';
import 'package:pokakevent_management/models/event_orgz_m.dart';
import 'package:pokakevent_management/models/photography_m.dart';
import 'package:pokakevent_management/states/search_se_cubit.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final PageController _pageController = PageController();
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
      final mediaHeight = MediaQuery.of(context).size.height;
    final mediaWidth = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (_) => SearchBloc(),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(160),
          child: Container(
            height: 200,
            width: double.infinity,
            color: const Color.fromARGB(255, 206, 203, 203),
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 60),
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: TextField(
                          controller: _searchController,
                          decoration: InputDecoration(
                            hintText: 'Search...',
                            contentPadding: const EdgeInsets.symmetric(vertical: 10),
                            border: InputBorder.none,
                            prefixIcon: const Icon(Icons.search),
                            suffixIcon: IconButton(
                              onPressed: () {
                                _searchController.clear();
                              },
                              icon: const Icon(Icons.close),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  BlocBuilder<SearchBloc, SearchState>(
                    builder: (context, state) {
                      if (state == SearchState.error) {
                        return const Text("An error occurred, please try again.");
                      }
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              context.read<SearchBloc>().changePage(SearchState.all);
                              _pageController.jumpToPage(0);
                            },
                            child: Container(
                              height: 25,
                              width: 100,
                              decoration: BoxDecoration(
                                color: state == SearchState.all ? Colors.teal : Colors.transparent,
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(child: Text("All")),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              context.read<SearchBloc>().changePage(SearchState.eventOrganisation);
                              _pageController.jumpToPage(1);
                            },
                            child: Container(
                              height: 25,
                              width: 100,
                              decoration: BoxDecoration(
                                color: state == SearchState.eventOrganisation ? Colors.teal : Colors.transparent,
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(
                                child: Text(
                                  "Event Orga",
                                  style: TextStyle(fontSize: 10),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              context.read<SearchBloc>().changePage(SearchState.photography);
                              _pageController.jumpToPage(2);
                            },
                            child: Container(
                              height: 25,
                              width: 100,
                              decoration: BoxDecoration(
                                color: state == SearchState.photography ? Colors.teal : Colors.transparent,
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(child: Text("Photography")),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        body: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            if (index == 0) {
              context.read<SearchBloc>().changePage(SearchState.all);
            } else if (index == 1) {
              context.read<SearchBloc>().changePage(SearchState.eventOrganisation);
            } else {
              context.read<SearchBloc>().changePage(SearchState.photography);
            }
          },
          children: const [
            AllEventm(),
            EventOrganazerm(),
            PhotographyM(),
          ],
        ),
      ),
    );
  }
}
