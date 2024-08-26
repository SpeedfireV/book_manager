import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FriendsPage extends StatefulWidget {
  const FriendsPage({super.key});

  @override
  State<FriendsPage> createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
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
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    child: const Icon(Icons.filter_list),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                      child: SearchBar(
                    hintText: "Find Your Friend!",
                    shape: WidgetStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5))),
                    leading: const Icon(Icons.search),
                  )),
                ],
              ),
            ),
            Flexible(
              child: ListView.builder(
                itemCount: 16,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => ListTile(
                  tileColor: index % 2 == 0
                      ? Theme.of(context).colorScheme.primary.withOpacity(0.2)
                      : Theme.of(context).colorScheme.primary.withOpacity(0.1),
                  onTap: () {
                    context.go("/friend_page");
                  },
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
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
              ),
            ),
          ]),
        ),
      ],
    );
  }
}
