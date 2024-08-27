import 'package:book_manager/bloc/your_books_page/your_books_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class YourBooksPage extends StatefulWidget {
  const YourBooksPage({super.key});

  @override
  State<YourBooksPage> createState() => _YourBooksPageState();
}

class _YourBooksPageState extends State<YourBooksPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: ListView.builder(
                    itemCount: 44,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => ListTile(
                          onTap: () {
                            debugPrint("List Tile Tapped");
                            context.go("/book_page");
                          },
                          tileColor: index % 2 == 0
                              ? Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(0.2)
                              : Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(0.1),
                          title: const Text("Book Title"),
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 16),
                          subtitle: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.star_rounded,
                                  color: Theme.of(context).colorScheme.primary,
                                  size: 20),
                              const SizedBox(width: 4),
                              const Text("3/5")
                            ],
                          ),
                          trailing: const Text("08.26.2024"),
                        )),
              ),
              const SizedBox(height: 80)
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    FloatingActionButton(
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      backgroundColor:
                          Theme.of(context).colorScheme.primaryContainer,
                      foregroundColor:
                          Theme.of(context).colorScheme.onPrimaryContainer,
                      heroTag: "filtering",
                      child: const Icon(Icons.filter_list_rounded),
                    ),
                    const SizedBox(width: 16),
                    FloatingActionButton(
                      onPressed: () {
                        _showSorting(context);
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      backgroundColor:
                          Theme.of(context).colorScheme.primaryContainer,
                      foregroundColor:
                          Theme.of(context).colorScheme.onPrimaryContainer,
                      heroTag: "sorting",
                      child: const Icon(Icons.sort),
                    ),
                  ],
                ),
                SizedBox(
                  height: 54,
                  child: FloatingActionButton.extended(
                    onPressed: () {
                      context.go("/add_book");
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    tooltip: 'Increment',
                    label: const Text("Add Book"),
                    icon: const Icon(Icons.add),
                    heroTag: "add_book",
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }

  _showSorting(BuildContext context) {
    return showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        context: context,
        builder: (sheetContext) {
          return BlocProvider.value(
            value: BlocProvider.of<YourBooksBloc>(context), // Fix here
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
                          "Sorting",
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
                  BlocBuilder<YourBooksBloc, YourBooksState>(
                    builder: (context, state) {
                      SortingDirection selectedSorting =
                          BlocProvider.of<YourBooksBloc>(context)
                              .sortingDirection;
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: SortingDirection.values.length,
                        itemBuilder: (context, index) {
                          SortingDirection sorting =
                              SortingDirection.values.elementAt(index);
                          return RadioMenuButton(
                            groupValue: selectedSorting,
                            value: sorting,
                            onChanged: (SortingDirection? newSorting) {
                              if (newSorting != null) {
                                BlocProvider.of<YourBooksBloc>(context)
                                    .add(YourBooksSortingChanged(newSorting));
                              }
                            },
                            child: Text(sorting.name),
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
}
