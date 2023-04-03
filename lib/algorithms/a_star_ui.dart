import 'package:flutter/material.dart';

import '../structure/structure.dart';
import '../widgets/home_page_button.dart';
import 'path_ui.dart';

class AStar extends StatefulWidget {
  const AStar({super.key});

  @override
  State<AStar> createState() => _AStarState();
}

class _AStarState extends State<AStar> {
  Structure st = Structure();

  @override
  void initState() {
    super.initState();

    Stopwatch stopwatch = Stopwatch()..start();
    aStar(st);
    // print('Time: ${stopwatch.elapsed}');
    forUi.add('Time: ${stopwatch.elapsed}');
  }

  List<String> forUi = [""];
  List<String> pathUi = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('A Star'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
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
                      style: const TextStyle(wordSpacing: 3, letterSpacing: 1),
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
    );
  }

  void aStar(Structure structure) {
    int j = 1;

    // this compare to function is to sort the priority queue
    List pQueue = [];

    List<Structure> visitedNodes = [];
    pQueue.add([
      [structure, 0, 0]
    ]);

    while (pQueue.isNotEmpty) {
      pQueue.sort((a, b) {
        var first = a.length + a.last.last;
        var second = b.length + b.last.last;

        if (first != second) {
          return first.compareTo(second);
        }
        return a.last.last.compareTo(b.last.last);
      });

      List path = [];
      path = pQueue.removeAt(0);
      Structure q0 = path.last.first;
      // print(' Entry: $j');
      j++;

      // print('queue length: ${pQueue.length}');

      if (visitedNodes.contains(q0)) {
        continue;
      }

      visitedNodes.add(q0);
      // print(q0);
      //checking the final State
      if (q0.isFinalAlgos(q0.gameArray)) {
        // print('WOW \n \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ \n Results ARE:');
        forUi.add('Results ARE:');
        // print('//////////////////////////////////////');
        for (var element in path) {
          pathUi.add('//////////////////////////////////////');

          pathUi.add(
              ' ${element.first.getPositionOfRook(5, element.first.gameArray)}');
        }
        // print('path length: ${path.length}');
        forUi.add('path length: ${path.length}');

        // print('Visited Nodes length: ${visitedNodes.length}');
        forUi.add('Visited Nodes length: ${visitedNodes.length}');

        // print('How many entries in while loop:  $j');
        forUi.add('How many entries in while loop:  $j');

        // for (var element in visitedNodes) {
        //   // print(element.getPositionOfRook(5, element.gameArray));
        //   // print(element.heuristicValue);
        // }
        setState(() {});
        return;
      } else {
        List<Structure> listOfStructures = q0.getNextState(q0);
        for (var element in listOfStructures) {
          if (!path.contains(element)) {
            List newPath = [];
            newPath.addAll(path);
            newPath.add([element, 1, element.heuristicValue]);
            pQueue.add(newPath);
          }
        }
      }
    }
  }

  //
}
