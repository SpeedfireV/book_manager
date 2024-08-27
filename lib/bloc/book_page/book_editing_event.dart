part of 'book_editing_bloc.dart';

@immutable
sealed class BookEditingEvent {}

class BookEditingStarted extends BookEditingEvent {
  final Book book;

  BookEditingStarted(this.book);
}

final class BookEditingFinished extends BookEditingEvent {}

final class BookEditingTitleChanged extends BookEditingEvent {
  final String newTitle;

  BookEditingTitleChanged(this.newTitle);
}

final class BookEditingRatingChanged extends BookEditingEvent {
  final int newRating;

  BookEditingRatingChanged(this.newRating);
}

final class BookEditingFinishedOnChanged extends BookEditingEvent {
  final DateTime newFinishedOn;

  BookEditingFinishedOnChanged(this.newFinishedOn);
}

final class BookEditingDescriptionChanged extends BookEditingEvent {
  final String newDescription;

  BookEditingDescriptionChanged(this.newDescription);
}
