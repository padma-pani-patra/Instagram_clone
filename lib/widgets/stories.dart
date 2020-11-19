import 'package:flutter/material.dart';
import 'package:instagram_clone/models/stories.dart';
import 'package:instagram_clone/widgets/widgets.dart';

class Stories extends StatelessWidget {
  final List<Story> stories;

  const Stories({
    Key key,
    @required this.stories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 120,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Stories',
                      style: TextStyle(
                        fontSize: 14,
                      )),
                  Text('Watch all',
                      style: TextStyle(
                        fontSize: 14,
                      )),
                ],
              ),
            ),
            Container(
              height: 80,
              child: ListView.builder(
              itemCount: stories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                Story story = stories[index];
                return Padding (
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    children: [
                      ProfileAvatar(
                        imageUrl: story.image,
                        isViewed: story.isViewed,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                        child: Text(story.name),
                      ),
                    ],
                  ),
                );
              },
            ),
            )
          ],
        ));
  }
}
