import 'package:book_manager/bloc/friends_page/friends_search_bloc.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FriendsPage extends StatefulWidget {
  const FriendsPage({super.key});

  @override
  State<FriendsPage> createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  late TextEditingController searchEditingController;

  @override
  void initState() {
    super.initState();
    searchEditingController = TextEditingController();
    searchEditingController.addListener(() {
      BlocProvider.of<FriendsSearchBloc>(context)
          .add(FriendsSearchQueryChanged(searchEditingController.text));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
              child: Row(
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      _showFilters(context);
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Icon(Icons.filter_list),
                    backgroundColor:
                        Theme.of(context).colorScheme.primaryContainer,
                    foregroundColor:
                        Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                      child: SearchBar(
                    hintText: "Find Your Friend!",
                    shape: WidgetStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5))),
                    controller: searchEditingController,
                    leading: const Icon(Icons.search),
                  )),
                ],
              ),
            ),
            Flexible(
              child: BlocBuilder<FriendsSearchBloc, FriendsSearchState>(
                builder: (context, state) {
                  return ListView.builder(
                    itemCount: 16,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => ListTile(
                      tileColor: index % 2 == 0
                          ? Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.2)
                          : Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.1),
                      onTap: () {
                        context.go("/friend_page");
                      },
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 16),
                      leading: const CircleAvatar(
                        child: Text("YF"),
                      ),
                      title: const Text("Your Friend's Name"),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.star_outline_rounded,
                          size: 24,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        iconSize: 24,
                      ),
                    ),
                  );
                },
              ),
            ),
          ]),
        ),
      ],
    );
  }

  _showFilters(BuildContext context) {
    return showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        context: context,
        builder: (sheetContext) {
          return BlocProvider.value(
            value: BlocProvider.of<FriendsSearchBloc>(context), // Fix here
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(width: 40, height: 40),
                        Text(
                          "Filters",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        SizedBox(
                          width: 40,
                          height: 40,
                          child: IconButton(
                            onPressed: () {
                              context.pop();
                            },
                            icon: Icon(
                              Icons.close_rounded,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  BlocBuilder<FriendsSearchBloc, FriendsSearchState>(
                    builder: (context, state) {
                      Filter selectedFilter =
                          BlocProvider.of<FriendsSearchBloc>(context).filter;
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: Filter.values.length,
                        itemBuilder: (context, index) {
                          Filter filter = Filter.values.elementAt(index);
                          return RadioMenuButton(
                            groupValue: selectedFilter,
                            value: filter,
                            onChanged: (Filter? newFilter) {
                              if (newFilter != null) {
                                BlocProvider.of<FriendsSearchBloc>(context)
                                    .add(FriendsSearchFilterChanged(newFilter));
                              }
                            },
                            child: Text(filter.name.capitalize),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  void dispose() {
    super.dispose();
    searchEditingController.dispose();
  }
}
