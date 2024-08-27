import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';

class AddBookPage extends StatefulWidget {
  const AddBookPage({super.key});

  @override
  State<AddBookPage> createState() => _AddBookPageState();
}

class _AddBookPageState extends State<AddBookPage> {
  late TextEditingController nameEditingController;
  late FocusNode nameNode;
  late TextEditingController descriptionEditingController;
  late FocusNode descriptionNode;

  @override
  void initState() {
    super.initState();
    nameEditingController = TextEditingController();
    descriptionEditingController = TextEditingController();
    nameNode = FocusNode();
    descriptionNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: FloatingActionButton.extended(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                onPressed: () {
                  context.pop();
                },
                icon: const Icon(Icons.add_rounded),
                label: const Text("Add Book"),
                heroTag: "add_book",
              ),
            ),
            body: SizedBox(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 12),
                    Row(children: [
                      FloatingActionButton(
                        onPressed: () {
                          context.pop();
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        heroTag: "back",
                        child: const Icon(Icons.arrow_back_ios_rounded),
                      ),
                      const SizedBox(width: 16),
                      Text(
                        "Add Your New Book!",
                        style: Theme.of(context).textTheme.headlineSmall,
                      )
                    ]),
                    const SizedBox(height: 16),
                    TextFormField(
                      focusNode: nameNode,
                      controller: nameEditingController,
                      onEditingComplete: () {
                        nameNode.nextFocus();
                      },
                      onTapOutside: (pointer) {
                        nameNode.unfocus();
                      },
                      decoration: const InputDecoration(
                          hintText: "Book Name", border: OutlineInputBorder()),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      focusNode: descriptionNode,
                      controller: descriptionEditingController,
                      onEditingComplete: () {
                        descriptionNode.nextFocus();
                      },
                      onTapOutside: (pointer) {
                        descriptionNode.unfocus();
                      },
                      decoration: const InputDecoration(
                          hintText: "Book Description",
                          border: OutlineInputBorder()),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return Dialog(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 16.0, horizontal: 16),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              "Your Rating",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleLarge,
                                            ),
                                            SizedBox(height: 16),
                                            Center(
                                              child: RatingBar.builder(
                                                  itemBuilder: (context, _) =>
                                                      Icon(
                                                        Icons.star,
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .primary,
                                                      ),
                                                  onRatingUpdate: (rating) {
                                                    debugPrint(
                                                        rating.toString());
                                                  }),
                                            ),
                                            SizedBox(height: 24),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 16.0),
                                              child: SizedBox(
                                                width: double.infinity,
                                                height: 54,
                                                child: ElevatedButton(
                                                    onPressed: () {
                                                      context.pop();
                                                    },
                                                    child:
                                                        Text("Change Rating")),
                                              ),
                                            ),
                                            SizedBox(height: 8),
                                            TextButton(
                                                style: TextButton.styleFrom(
                                                    foregroundColor: Colors.red,
                                                    textStyle: Theme.of(context)
                                                        .textTheme
                                                        .labelLarge),
                                                onPressed: () {
                                                  context.pop();
                                                },
                                                child: Text(
                                                  "Cancel",
                                                ))
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            },
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size(double.infinity, 72),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 4, vertical: 8),
                                backgroundColor: Theme.of(context)
                                    .colorScheme
                                    .primaryContainer,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5))),
                            child: SizedBox(
                              height: 56,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Your Rating",
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      for (int i = 0; i < 5; i++)
                                        Icon(
                                          Icons.star,
                                          color: Theme.of(context).primaryColor,
                                        )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: ElevatedButton(
                              onPressed: () {
                                showDatePicker(
                                    context: context,
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime.now(),
                                    initialDate: DateTime.now());
                              },
                              style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 4, vertical: 8),
                                  backgroundColor: Theme.of(context)
                                      .colorScheme
                                      .primaryContainer,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5))),
                              child: SizedBox(
                                height: 56,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Finished On",
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                    Text("08.26.2024",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                fontWeight: FontWeight.w700))
                                  ],
                                ),
                              )),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )));
  }

  @override
  void dispose() {
    super.dispose();
    nameEditingController.dispose();
    descriptionEditingController.dispose();
    nameNode.dispose();
    descriptionNode.dispose();
  }
}
