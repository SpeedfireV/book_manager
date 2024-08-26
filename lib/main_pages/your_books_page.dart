import 'package:flutter/material.dart';
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
                      onPressed: () {},
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
                FloatingActionButton.extended(
                  onPressed: () {
                    context.go("/add_book");
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  tooltip: 'Increment',
                  label: const Text("Add Book"),
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
