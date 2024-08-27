import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/friend.dart';

part 'friends_search_event.dart';
part 'friends_search_state.dart';

class FriendsSearchBloc extends Bloc<FriendsSearchEvent, FriendsSearchState> {
  List<Friend> friendsList = [];
  String query = "";
  Filter filter = Filter.all;
  FriendsSearchBloc() : super(FriendsSearchInitial()) {
    on<FriendsSearchFilterChanged>((event, emit) {
      emit(FriendsSearchFiltering());
      filter = event.newFilter;
      loadFriends();
      // TODO: FriendsSearchFilter
      emit(FriendsSearchLoaded());
    });
    on<FriendsSearchQueryChanged>((event, emit) {
      emit(FriendsSearchQueryChanging());
      query = event.query;
      loadFriends();
      // TODO: FriendsSearchQuery
      emit(FriendsSearchLoaded());
    });
    on<FriendsSearchMoreResults>((event, emit) {
      emit(FriendsSearchSearchingForMoreFriends());
      // TODO: Load More Friends Bloc Logic
      emit(FriendsSearchLoaded());
    });
  }
  void loadFriends() {
    // TODO: Load Friends Function
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    print(error.toString());
    print(stackTrace.toString());
  }

  @override
  void onChange(Change<FriendsSearchState> change) {
    print(change);
  }
}

enum Filter { all, starred }
