import 'package:flutter/material.dart';

class AppBarLayouts {
  /*
    Method name: homeAppBarLayout
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
  static AppBar homeAppBarLayout(BuildContext context) {
    return AppBar(
      title: const Text("UTool"),
      centerTitle: true,
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.menu),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            showSearch(context: context, delegate: SearchBar());
          },
        ),
        PopupMenuButton(
          itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(
                child: Text('Placeholder Item 1'),
                value: 1,
              ),
              PopupMenuItem(
                child: Text('Placeholder Item 2'),
                value: 2,
              ),
              PopupMenuItem(
                child: Text('Placeholder Item 3'),
                value: 3,
              ),
            ];
          },
          icon: Icon(Icons.sort),
        ),
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

class SearchBar extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isNotEmpty) {
      close(context, '');
    }
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
