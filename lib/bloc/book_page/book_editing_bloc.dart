import 'package:bloc/bloc.dart';
import 'package:book_manager/models/book.dart';
import 'package:meta/meta.dart';

part 'book_editing_event.dart';
part 'book_editing_state.dart';

class BookEditingBloc extends Bloc<BookEditingEvent, BookEditingState> {
  Book? book;

  BookEditingBloc() : super(BookEditingInitial()) {
    on<BookEditingStarted>((event, emit) {
      book = event.book;
      emit(BookEditingChangesApplied());
    });
    on<BookEditingFinished>((event, emit) {
      emit(BookEditingChangesApplied());
    });
    on<BookEditingTitleChanged>((event, emit) {
      book = book!.copyWith(title: event.newTitle);
      emit(BookEditingChangesApplied());
    });
    on<BookEditingRatingChanged>((event, emit) {
      book = book!.copyWith(rating: event.newRating);
      emit(BookEditingChangesApplied());
    });
    on<BookEditingFinishedOnChanged>((event, emit) {
      book = book!.copyWith(finishedOn: event.newFinishedOn);
      emit(BookEditingChangesApplied());
    });
    on<BookEditingDescriptionChanged>((event, emit) {
      book = book!.copyWith(description: event.newDescription);
      emit(BookEditingChangesApplied());
    });
  }
}
