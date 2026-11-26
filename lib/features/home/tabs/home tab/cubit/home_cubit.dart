import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());

  // Update Search Query
  void updateSearchQuery(String query) {
    emit(
      state.copyWith(
        searchQuery: query,
        isSearching: query.trim().isNotEmpty,
      ),
    );
  }

  // Clear Search
  void clearSearch() {
    emit(
      state.copyWith(
        searchQuery: '',
        isSearching: false,
      ),
    );
  }
}