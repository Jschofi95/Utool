import 'package:flutter/material.dart';

class MyBottomAppBar {
  /*
    Method name: bottomppBarLayout
    Parameters: None
    Description: The layout of the app bar specifically for the home page.
                 This app bar does not have a back button. Instead, it contains
                 a menu IconButton on the left side of the app bar as well
                 as a search button on the left hand side.
                 The title is centered within the app bar.
    Contributors:
      Aaron Schofield
        - Created homeAppBarLayout
  */

  BottomAppBar bottomAppBarLayout() {
    return BottomAppBar(
      color: const Color.fromARGB(255, 184, 167, 16),
      child: IconTheme(
        data: const IconThemeData(color: Color.fromARGB(255, 184, 167, 16)),
        child: Row(
          children: <Widget>[
            IconButton(
              color: Colors.white,
              tooltip: 'Account',
              icon: const Icon(Icons.account_circle_outlined),
              onPressed: () {},
            ),
            IconButton(
              color: Colors.white,
              tooltip: 'Lend',
              icon: const Icon(Icons.add_box_rounded),
              onPressed: () {},
            ),
            IconButton(
              color: Colors.white,
              tooltip: 'Past Orders',
              icon: const Icon(Icons.auto_stories_rounded),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
