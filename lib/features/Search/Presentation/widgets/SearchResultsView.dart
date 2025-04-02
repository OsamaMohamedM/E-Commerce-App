import 'package:e_commerce/Core/utils/widgets/FruitItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/cubit/search_cubit.dart';
import '../../cubits/cubit/search_state.dart';
import 'RecentSearches.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchLoadingState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is SearchSuccessState) {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 132 / 214,
              crossAxisSpacing: 8,
            ),
            itemCount: state.results.length,
            itemBuilder: (context, index) => FruitGridViewItem(
              product: state.results[index],
            ),
          );
        } else if (state is SearchErrorState) {
          return Center(child: Text(state.error, style: TextStyle(fontSize: 18)));
        } else if (state is SearchInitialState) {
          return RecentSearches();
        }
        return Container();
      },
    );
  }
}
