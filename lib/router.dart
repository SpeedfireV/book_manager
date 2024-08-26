import 'package:book_manager/add_book_page.dart';
import 'package:book_manager/book_page.dart';
import 'package:book_manager/friend_page.dart';
import 'package:book_manager/main_pages_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final router = GoRouter(navigatorKey: _rootNavigatorKey, routes: [
  GoRoute(
      path: '/',
      builder: (context, state) => const MainPagesPage(),
      routes: [
        GoRoute(
            path: "book_page",
            name: "book_page",
            builder: (context, state) => const BookPage()),
        GoRoute(
            path: "add_book",
            name: "add_book",
            builder: (context, state) => const AddBookPage()),
        GoRoute(
            path: "friend_page",
            name: "friend_page",
            builder: (context, state) => const FriendPage())
      ])
]);
