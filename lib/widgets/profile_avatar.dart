import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {


  final String imageUrl;
  final bool isViewed;
  final bool isPostHeader;

  const ProfileAvatar({
    Key key,
    @required this.imageUrl,
    this.isViewed = true,
    this.isPostHeader = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double radius = isPostHeader ? 20 : 30;

    return CircleAvatar(
      backgroundColor: Colors.purple,
      radius: radius,
      child: CircleAvatar(
        radius: isViewed ? radius : radius-3,
        backgroundImage: NetworkImage(imageUrl),
      ),
    );
  }
}
