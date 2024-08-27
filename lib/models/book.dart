import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'book.freezed.dart';

@freezed
class Book with _$Book {
  const factory Book(
      {required String title,
      required String description,
      required DateTime finishedOn,
      required int rating,
      List<AssetImage>? images}) = _Book;
}
