part of 'friends_search_bloc.dart';

@immutable
sealed class FriendsSearchEvent {}

class FriendsSearchFilterChanged extends FriendsSearchEvent {
  final Filter newFilter;

  FriendsSearchFilterChanged(this.newFilter);
}

class FriendsSearchQueryChanged extends FriendsSearchEvent {
  final String query;

  FriendsSearchQueryChanged(this.query);
}

class FriendsSearchMoreResults extends FriendsSearchEvent {}
