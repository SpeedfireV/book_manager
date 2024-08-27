import 'package:book_manager/bloc/bottom_nav_bar/bottom_nav_bar_cubit.dart';
import 'package:book_manager/bloc/friends_page/friends_search_bloc.dart';
import 'package:book_manager/bloc/your_books_page/your_books_bloc.dart';
import 'package:book_manager/consts/router.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => BottomNavBarCubit()),
    BlocProvider(create: (context) => FriendsSearchBloc()),
    BlocProvider(create: (context) => YourBooksBloc([]))
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      theme: FlexThemeData.light(scheme: FlexScheme.amber),
    );
  }
}
