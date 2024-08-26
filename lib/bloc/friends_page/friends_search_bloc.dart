import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'friends_search_event.dart';
part 'friends_search_state.dart';

class FriendsSearchBloc extends Bloc<FriendsSearchEvent, FriendsSearchState> {
  FriendsSearchBloc() : super(FriendsSearchInitial()) {
    on<FriendsSearchFilterChanged>((event, emit) {
      emit(FriendsSearchFiltering());
      // TODO:
      emit(FriendsSearchLoaded());
    });
    on<FriendsSearchQueryChanged>((event, emit) {
      emit(FriendsSearchQueryChanging());
      // TODO:
      emit(FriendsSearchLoaded());
    });
    on<FriendsSearchMoreResults>((event, emit) {
      emit(FriendsSearchSearchingForMoreFriends());
      // TODO:
      emit(FriendsSearchLoaded());
    });
  }
}
