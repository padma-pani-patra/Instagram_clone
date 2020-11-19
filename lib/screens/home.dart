import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import '../widgets/widgets.dart';

import '../data.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            brightness: Brightness.light,
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: Icon(
                Feather.camera,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
            title: Text('Instagram',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w500)),
            centerTitle: true,
            actions: [
              IconButton(
                icon: Icon(
                  Feather.tv,
                  color: Colors.black,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  FontAwesome.send_o,
                  color: Colors.black,
                ),
                onPressed: () {},
              ),
            ],
          ),
          SliverToBoxAdapter(
              child: Stories(
            stories: stories,
          )),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                print(posts.length);
                final post = posts[index];
                return PostContainer(post: post);
              },
              childCount: posts.length,
            ),
          )
        ],
      ),
    );
  }
}
