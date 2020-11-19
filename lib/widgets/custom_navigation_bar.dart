import 'package:flutter/material.dart';

class CustomNavigationBar extends StatefulWidget {


  final List<IconData> icons;
  final int selectedIndex;
  final Function onTap;

  const CustomNavigationBar({
    Key key,
    @required this.icons,
    @required this.selectedIndex,
    @required this.onTap,
  }) : super(key: key);

  @override
  _CustomNavigationBarState createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicator: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.black, width: 3.0))
      ),
      tabs: widget.icons
          .asMap()
          .map((i, e) => MapEntry(
              i,
              Tab(
                  icon: Icon(e,
                      color: i == widget.selectedIndex ? Colors.black : Colors.black38,
                      size: 25))))
          .values
          .toList(),
      onTap: widget.onTap,
    );
  }
}
