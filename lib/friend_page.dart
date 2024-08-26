import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FriendPage extends StatefulWidget {
  const FriendPage({super.key});

  @override
  State<FriendPage> createState() => _FriendPageState();
}

class _FriendPageState extends State<FriendPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      context.pop();
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    heroTag: "back",
                    child: const Icon(Icons.arrow_back_ios_rounded),
                  ),
                  SizedBox(
                    width: 72,
                    height: 72,
                    child: CircleAvatar(
                      child: Text(
                        "PN",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(
                                color: Theme.of(context).colorScheme.onPrimary),
                      ),
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    backgroundColor:
                        Theme.of(context).colorScheme.primaryContainer,
                    foregroundColor:
                        Theme.of(context).colorScheme.onPrimaryContainer,
                    heroTag: "star_friend",
                    child: const Icon(
                      Icons.star_outline_rounded,
                      size: 24,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Your Friend's Name",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "(Friend's Description) Integer lacinia mauris ut mi aliquet imperdiet. Ut suscipit interdum nisl commodo blandit. Aliquam vehicula nisl nec dolor blandit, in iaculis libero scelerisque. In auctor molestie sodales. Vivamus interdum aliquam aliquet. Cras at scelerisque mi. Proin nec gravida elit. ",
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 40),
            Text(
              "Recently Read",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 8),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 7,
                itemBuilder: (context, index) => ListTile(
                      onTap: () {
                        debugPrint("List Tile Tapped");
                        context.push("/book_page");
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
                    ))
          ],
        ),
      ),
    );
  }
}
