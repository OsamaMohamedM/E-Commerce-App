import '../../../../Core/Data/Model/ProductEntity.dart';

abstract class SearchState {}

final class SearchInitialState extends SearchState {}

class SearchSuccessState extends SearchState {
  final List<ProductEntity> results;
  SearchSuccessState(this.results);
}

class SearchErrorState extends SearchState {
  final String error;
  SearchErrorState(this.error);
}

class SearchRecentState extends SearchState {
  final List<String> recentSearches;
  SearchRecentState(this.recentSearches);
}

class SearchLoadingState extends SearchState {}
