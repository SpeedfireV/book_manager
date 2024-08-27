import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        height: 54,
        child: FloatingActionButton.extended(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          onPressed: () {},
          label: const Text("Edit Profile"),
          icon: const Icon(Icons.edit),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(height: 16),
            SizedBox(
              width: 72,
              height: 72,
              child: CircleAvatar(
                child: Text(
                  "PN",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(color: Theme.of(context).colorScheme.onPrimary),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "Profile Name",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 24),
            Text(
              "(Profile Description) Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam convallis elementum eros a semper. Maecenas tortor nibh, tempor in augue vel, aliquam laoreet ante. Sed quis pharetra est. Sed dapibus scelerisque dui, nec interdum sapien consequat vitae. Donec porta ex ut nulla facilisis mattis. Aenean auctor id diam sed interdum. Curabitur urna libero, vehicula a fermentum non, venenatis non velit. Cras consectetur neque vitae suscipit viverra. Aliquam vitae tortor in mi tincidunt volutpat. In semper dapibus risus sit amet pulvinar. In ut mi arcu. Suspendisse pellentesque lacus diam, a posuere nisi hendrerit a. Fusce iaculis a orci at consequat. Morbi dictum pellentesque luctus. Maecenas augue leo, auctor id sem at, convallis lacinia purus. Sed vitae rhoncus tellus, vel pharetra orci. ",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        ),
      ),
    );
  }
}
