import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/book.dart';

part 'your_books_event.dart';
part 'your_books_state.dart';

class YourBooksBloc extends Bloc<YourBooksEvent, YourBooksState> {
  List<Book> books;
  String query = "";
  SortingDirection sortingDirection = SortingDirection.newerToOlder;
  YourBooksBloc(this.books) : super(YourBooksInitial()) {
    on<YourBooksSortingChanged>((event, emit) {
      sortingDirection = event.newSortingDirection;
      emit(YourBooksLoaded());
    });
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    print(error);
    print(stackTrace);
  }

  @override
  void onChange(Change<YourBooksState> change) {
    super.onChange(change);
    print(change);
  }
}

enum SortingDirection {
  newerToOlder("Newer To Older"),
  olderToNewer("Older To Newer"),
  alphabetically("Alphabetically"),
  alphabeticallyReversed("Alphabetically Reversed");

  final String name;
  const SortingDirection(this.name);
}
