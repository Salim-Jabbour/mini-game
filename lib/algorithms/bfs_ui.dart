import 'dart:collection';

import 'package:flutter/material.dart';

import '../structure/structure.dart';
import '../widgets/home_page_button.dart';
import 'path_ui.dart';

class BfsUI extends StatefulWidget {
  const BfsUI({super.key});

  @override
  State<BfsUI> createState() => _BfsUIState();
}

class _BfsUIState extends State<BfsUI> {
  Structure st = Structure();

  @override
  void initState() {
    super.initState();
    // queue.add(st);
    // listOfVisitedNodes.add(st);
    Stopwatch stopwatch = Stopwatch()..start();
    bfs(st);
    // print('Time: ${stopwatch.elapsed}');
    forUi.add('Time: ${stopwatch.elapsed}');
  }

  List<String> forUi = [""];
  List<String> pathUi = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BFS'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'OutPut:',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xff00ADB5),
                        ),
                      ),
                    ),
                    const Divider(
                      thickness: 2,
                      color: Colors.black38,
                    ),
                    for (int i = 0; i < forUi.length; i++)
                      Text(
                        forUi[i],
                        style:
                            const TextStyle(wordSpacing: 3, letterSpacing: 1),
                      ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              SizedBox(
                width: 300,
                child: HomePageButton(
                  routeFunction: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PathUi(path: pathUi),
                      ),
                    );
                  },
                  text: "press here to see the full Path",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void bfs(Structure structure) {
    //counter
    int j = 1;

    Queue<List<Structure>> queue = Queue();
    List<Structure> visitedNodes = [];
    queue.add([structure]);

    while (queue.isNotEmpty) {
      List<Structure> path = [];
      path = queue.removeFirst();
      Structure q0 = path.last;

      // print(' Entry: $j');
      j++;

      if (visitedNodes.contains(q0)) {
        continue;
      }

      visitedNodes.add(q0);

      //checking the final State
      //this function check if I reach the goal or not
      // so every print or forui.add or pathui.add its only for ui
      if (q0.isFinalAlgos(q0.gameArray)) {
        // print('WOW \n \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ \n Results ARE:');
        forUi.add('Results ARE:');
        // print('path is:');
        // forUi.add('path is:');
        for (var element in path) {
          // print('//////////////////////////////////////');
          pathUi.add('//////////////////////////////////////');
          // for (int i = 0; i < element.gameArray.length; i++) {
          //    print('$i: ${element.gameArray[i]}');
          // }
          pathUi.add(' ${element.getPositionOfRook(5, element.gameArray)}');
        }
        // print('path length: ${path.length}');
        forUi.add('path length: ${path.length}');

        // print('Visited Nodes length: ${visitedNodes.length}');
        forUi.add('Visited Nodes length: ${visitedNodes.length}');

        // print('How many entries in while loop:  $j');
        forUi.add('How many entries in while loop:  $j');

        // for (var element in visitedNodes) {
        //    print(element.getPositionOfRook(5, element.gameArray));
        //    print('////////////////////');
        // }

        setState(() {});
        break;
      } else {
        List<Structure> listOfStructures = q0.getNextState(q0);
        for (var element in listOfStructures) {
          if (!path.contains(element)) {
            List<Structure> newPath = [];
            newPath.addAll(path);
            newPath.add(element);
            queue.add(newPath);
          }
        }
      }
    }
  }
}
