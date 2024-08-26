import 'package:book_manager/main_pages/friends_page.dart';
import 'package:book_manager/main_pages/profile_page.dart';
import 'package:book_manager/main_pages/your_books_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/bottom_nav_bar/bottom_nav_bar_cubit.dart';

class MainPagesPage extends StatefulWidget {
  const MainPagesPage({super.key});

  @override
  State<MainPagesPage> createState() => _MainPagesPageState();
}

class _MainPagesPageState extends State<MainPagesPage> {
  late PageController _pageController;
  final List<Widget> _pages = [
    const ProfilePage(),
    const YourBooksPage(),
    const FriendsPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<BottomNavBarCubit, int>(
        listener: (context, state) {
          _pageController.animateToPage(state,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeIn);
        },
        child: PageView.builder(
          itemCount: _pages.length,
          controller: _pageController,
          onPageChanged: (page) {
            if (page.floor() ==
                BlocProvider.of<BottomNavBarCubit>(context).state) {
              BlocProvider.of<BottomNavBarCubit>(context)
                  .changePage(page.floor().toInt());
            }
          },
          itemBuilder: (context, index) => _pages[index],
        ),
      ),
      bottomNavigationBar: BlocBuilder<BottomNavBarCubit, int>(
        builder: (context, state) {
          return BottomNavigationBar(
            currentIndex: BlocProvider.of<BottomNavBarCubit>(context).state,
            onTap: (int newValue) {
              BlocProvider.of<BottomNavBarCubit>(context).changePage(newValue);
            },
            items: const [
              BottomNavigationBarItem(
                  activeIcon: Icon(Icons.person),
                  icon: Icon(Icons.person_outlined),
                  label: "Profile"),
              BottomNavigationBarItem(
                  activeIcon: Icon(Icons.bookmarks_rounded),
                  icon: Icon(Icons.bookmarks_outlined),
                  label: "Your Books"),
              BottomNavigationBarItem(
                activeIcon: Icon(Icons.people_rounded),
                icon: Icon(Icons.people_outlined),
                label: "Friends",
              )
            ],
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
        initialPage: BlocProvider.of<BottomNavBarCubit>(context).state);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }
}
