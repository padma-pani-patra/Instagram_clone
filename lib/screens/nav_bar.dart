import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:instagram_clone/widgets/widgets.dart';

import 'home.dart';

class Navbar extends StatefulWidget {
  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    Home(),
    Scaffold(),
    Scaffold(),
  ];
  final List<IconData> _icons = [
    Foundation.home,
    Feather.search,
    Feather.plus_square,
    Feather.heart,
    Feather.user
  ];

  @override
  Widget build(BuildContext context) {
    Size screenSize =MediaQuery.of(context).size;
    return DefaultTabController(
      length: _icons.length,
      child: Scaffold(
        body: IndexedStack(
          children: _screens,
          index: _selectedIndex,
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: Container(
            child: PreferredSize(
              preferredSize: Size(screenSize.width, 100),
                          child: CustomNavigationBar(
                  icons: _icons,
                  selectedIndex: _selectedIndex,
                  onTap: (index) => setState(() => _selectedIndex = index)),
            ),
          ),
        ),
      ),
    );
  }
}
