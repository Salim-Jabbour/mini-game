import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:isa_hw/ui/ui.dart';

import '../algorithms/a_star_ui.dart';
import '../algorithms/bfs_ui.dart';
import '../algorithms/dfs_ui.dart';
import '../algorithms/ucs_ui.dart';
import '../widgets/home_page_button.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home Screen'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                HomePageButton(
                  text: 'User Play',
                  routeFunction: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const UIPage()),
                    );
                  },
                ),
                HomePageButton(
                  text: 'BFS',
                  routeFunction: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const BfsUI()),
                    );
                  },
                ),
                HomePageButton(
                  text: 'DFS',
                  routeFunction: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const DfsUI()),
                    );
                  },
                ),
                HomePageButton(
                  text: 'UCS',
                  routeFunction: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const UcsUI()),
                    );
                  },
                ),
                HomePageButton(
                  text: 'A Star',
                  routeFunction: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AStar()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
