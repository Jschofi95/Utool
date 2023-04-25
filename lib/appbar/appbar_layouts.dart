import 'package:flutter/material.dart';
import 'package:utool/sort_filter/filter.dart';

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
        onPressed: () {
          //Navigator.push(
          //context,
          //MaterialPageRoute(builder: (context) => const Filter()),
          //);
        },
        icon: const Icon(Icons.menu),
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            showSearch(context: context, delegate: SearchBar());
          },
        ),
        PopupMenuButton(
          itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          minimumSize: const Size.fromHeight(40)),
                      onPressed: () {},
                      child: PopupMenuButton(
                          itemBuilder: (BuildContext context) {
                            return [
                              const PopupMenuItem(
                                value: 1,
                                child: SizedBox(child: Text('\$ - \$\$\$')),
                              ),
                              const PopupMenuItem(
                                value: 2,
                                child: SizedBox(child: Text('\$\$\$ - \$')),
                              ),
                              const PopupMenuItem(
                                value: 3,
                                child:
                                    SizedBox(child: Text('Closest - Furthest')),
                              ),
                              const PopupMenuItem(
                                value: 4,
                                child: SizedBox(
                                    child: Text('Top Rated - Worst Rated')),
                              ),
                            ];
                          },
                          child: const Text('Sort By')))),
              PopupMenuItem(
                  child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    minimumSize: const Size.fromHeight(40)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Filter()),
                  );
                },
                child: const Text('Filter'),
              )),
            ];
          },
          icon: const Icon(Icons.sort_rounded),
        )
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
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
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
