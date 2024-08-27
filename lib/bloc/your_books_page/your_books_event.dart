part of 'your_books_bloc.dart';

@immutable
sealed class YourBooksEvent {}

final class YourBooksFilterChanged extends YourBooksEvent {}

final class YourBooksSortingChanged extends YourBooksEvent {
  final SortingDirection newSortingDirection;

  YourBooksSortingChanged(this.newSortingDirection);
}
