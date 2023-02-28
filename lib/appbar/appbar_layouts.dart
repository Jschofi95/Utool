import 'package:flutter/material.dart';

class MyAppBar {
  /*
    Method name: homeAppBarLayout
    Parameters: None
    Description: The layout of the app bar specifically for the home page.
                 This app bar does not have a back button. Instead, it contains
                 a menu IconButton on the left side of the app bar as well
                 as a search button on the left hand side.
                 The title is centered within the app bar.
  */ 
  AppBar homeAppBarLayout() {
    return AppBar(
      title: const Text("UTool"),
      centerTitle: true,
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.menu),
      ),
      actions: <Widget>[
        IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
      ],
      backgroundColor: Colors.orangeAccent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
    );
  }
}
