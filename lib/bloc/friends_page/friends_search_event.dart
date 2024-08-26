part of 'friends_search_bloc.dart';

@immutable
sealed class FriendsSearchEvent {}

class FriendsSearchFilterChanged extends FriendsSearchEvent {}

class FriendsSearchQueryChanged extends FriendsSearchEvent {}

class FriendsSearchMoreResults extends FriendsSearchEvent {}
