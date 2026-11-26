class HomeState {
  final String searchQuery;
  final bool isSearching;

  const HomeState({
    this.searchQuery = '',
    this.isSearching = false,
  });

  HomeState copyWith({
    String? searchQuery,
    bool? isSearching,
  }) {
    return HomeState(
      searchQuery: searchQuery ?? this.searchQuery,
      isSearching: isSearching ?? this.isSearching,
    );
  }
}