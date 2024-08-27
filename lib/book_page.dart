import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookPage extends StatefulWidget {
  const BookPage({super.key});

  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FloatingActionButton(
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  child: Icon(Icons.delete_rounded),
                  backgroundColor: Colors.red,
                  heroTag: "edit_opinion",
                ),
                SizedBox(
                  height: 56,
                  child: FloatingActionButton.extended(
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    icon: Icon(Icons.edit),
                    label: Text("Edit Opinion"),
                    heroTag: "edit_opinion",
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 16),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 56,
                        height: 56,
                        child: FloatingActionButton(
                          onPressed: () {
                            context.pop();
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          child: Icon(Icons.arrow_back_ios_rounded),
                          heroTag: "back",
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            "Book Title",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 52,
                        height: 52,
                      ),
                    ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < 5; i++)
                      Icon(
                        i < 3 ? Icons.star_rounded : Icons.star_outline_rounded,
                        size: 20,
                        color: Colors.orange,
                      )
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  "Book Finished On\n08.26.2024",
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 32),
                Text(
                  "(Book Description) Phasellus feugiat ante ex, quis bibendum augue ornare sit amet. Nulla eleifend massa ac mi hendrerit convallis. Vestibulum sit amet leo elit. Nulla et velit sed risus dignissim gravida ut ac turpis. Interdum et malesuada fames ac ante ipsum primis in faucibus. Vivamus quis mollis nisi. Pellentesque ac pharetra tortor. Phasellus congue eros leo, quis ultrices mauris ornare eget. Praesent lacinia, nulla ac pharetra volutpat, augue odio ultricies mi, quis hendrerit purus elit tincidunt elit. Mauris semper facilisis velit. Suspendisse eget ullamcorper turpis, non interdum augue. Quisque elementum metus non urna aliquam iaculis. ",
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
