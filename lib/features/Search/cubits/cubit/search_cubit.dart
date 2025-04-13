
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Core/Data/Model/ProductEntity.dart';
import 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.allProducts) : super(SearchInitialState());
  List<ProductEntity> allProducts;
  List<String> recentSearches = [];
  void search(String query) {
    if (query.isEmpty) {
      emit(SearchInitialState());
      return;
    }

    emit(SearchLoadingState());

    Future.delayed(Duration(milliseconds: 500), () {
      List<ProductEntity> results =
          allProducts.where((product) => product.name.contains(query)).toList();
     
      if (results.isNotEmpty) {
        if (!recentSearches.contains(query)) {
          recentSearches.add(query);
        }
        emit(SearchSuccessState(results));
      } else {
        emit(SearchErrorState("لا توجد نتائج بحث"));
      }
    });
  }

  void clearRecentSearches() {
    recentSearches.clear();
    emit(SearchRecentState(recentSearches));
  }

  void removeRecentSearch(String query) {
    recentSearches.remove(query);
    emit(SearchRecentState(recentSearches));
  }
}
