import 'package:flutter/material.dart';
import 'package:utool/card/my_card.dart';
import 'package:utool/appbar/appbar_layouts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar().homeAppBarLayout(),
      body: MyCard(),
    );
  }
}
