import 'package:flutter/material.dart';

class PathUi extends StatefulWidget {
  const PathUi({super.key, required this.path});
  final List<String> path;

  @override
  State<PathUi> createState() => _PathUiState();
}

class _PathUiState extends State<PathUi> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Path'),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          body: SingleChildScrollView(
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.49,
                  child: Column(
                    children: [
                      const Text('1:'),
                      for (int i = 0; i < widget.path.length / 2; i++)
                        Text(
                          widget.path[i],
                          style: TextStyle(
                            color: widget.path[i] ==
                                    '//////////////////////////////////////'
                                ? const Color(0xff00ADB5)
                                : Colors.white,
                            wordSpacing: 2,
                          ),
                        ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.49,
                  child: Column(
                    children: [
                      const Text('2:'),
                      for (int j = widget.path.length ~/ 2;
                          j < widget.path.length;
                          j++)
                        Text(
                          widget.path[j],
                          style: TextStyle(
                            color: widget.path[j] ==
                                    '//////////////////////////////////////'
                                ? const Color(0xff00ADB5)
                                : Colors.white,
                          ),
                        ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
