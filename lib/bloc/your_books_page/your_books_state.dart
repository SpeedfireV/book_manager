part of 'your_books_bloc.dart';

@immutable
sealed class YourBooksState {}

final class YourBooksInitial extends YourBooksState {}

final class YourBooksLoaded extends YourBooksState {}
