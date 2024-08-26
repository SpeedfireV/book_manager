part of 'friends_search_bloc.dart';

@immutable
sealed class FriendsSearchState {}

final class FriendsSearchInitial extends FriendsSearchState {}

class FriendsSearchLoaded extends FriendsSearchState {}

class FriendsSearchFiltering extends FriendsSearchState {}

class FriendsSearchQueryChanging extends FriendsSearchState {}

class FriendsSearchSearchingForMoreFriends extends FriendsSearchState {}
