part of 'book_editing_bloc.dart';

@immutable
sealed class BookEditingState {}

final class BookEditingInitial extends BookEditingState {}

final class BookEditingChangesApplied extends BookEditingState {}
