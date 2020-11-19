import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:instagram_clone/models/posts.dart';
import 'package:instagram_clone/widgets/widgets.dart';

class PostContainer extends StatelessWidget {
  final Post post;

  const PostContainer({
    Key key,
    @required this.post,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _PostHeader(post: post),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 6.0, 0.0, 0.0),
            child: CachedNetworkImage(imageUrl: post.postImage),
          ),
          _PostButton(),
          _PostStats(
            name: post.username,
            caption: post.caption,
          )
        ],
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  final Post post;

  const _PostHeader({
    Key key,
    @required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ProfileAvatar(
            imageUrl: post.userImage,
            isPostHeader: true,
          ),
          SizedBox(width: 5.0),
          Expanded(child: Text(post.username, style: TextStyle(fontSize: 15))),
          IconButton(
            icon: Icon(Icons.more_horiz),
            onPressed: () => print('More Pressed'),
          )
        ],
      ),
    );
  }
}

class _PostButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              InkWell(
                child: IconButton(
                    icon: Icon(FontAwesome.heart_o),
                    onPressed: () => print('Like')),
              ),
              InkWell(
                child: IconButton(
                  icon: Icon(FontAwesome.comment_o),
                  onPressed: () => print('comment'),
                ),
              ),
              InkWell(
                child: IconButton(
                  icon: Icon(FontAwesome.send_o),
                  onPressed: () => print('Share'),
                ),
              )
            ],
          ),
        ),
        InkWell(
            child: IconButton(
          icon: Icon(Feather.bookmark),
          onPressed: () => print('Saved'),
        ))
      ],
    );
  }
}

class _PostStats extends StatelessWidget {
  final String name;
  final String caption;

  const _PostStats({
    Key key,
    @required this.name,
    @required this.caption,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          RichText(
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              text: TextSpan(children: [
                TextSpan(
                    text: 'Liked BY ', style: TextStyle(color: Colors.black54)),
                TextSpan(
                    text: 'Sigmund, ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black)),
                TextSpan(
                    text: 'yessenia, ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black)),
                TextSpan(
                    text: 'Dayana, ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black)),
                TextSpan(text: 'and ', style: TextStyle(color: Colors.black54)),
                TextSpan(
                    text: '1263 Others, ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black)),
              ])),
          const SizedBox(height:3),
          RichText(
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              text: TextSpan(children: [
                TextSpan(
                    text: '$name ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black)),
                TextSpan(
                    text: '$caption. \n',
                    style: TextStyle(color: Colors.black54)),
                TextSpan(
                    text: 'Feb 2020', style: TextStyle(color: Colors.black54)),
              ])),
        ],
      ),
    );
  }
}
