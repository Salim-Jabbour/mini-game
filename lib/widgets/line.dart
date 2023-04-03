import 'package:flutter/material.dart';

import '../structure/structure.dart';
import 'block.dart';

class Line extends StatefulWidget {
  const Line(this.lineNumber, this.structure,
      {required this.update, super.key});
  //here recieving the line number(row),
  // the exact object from UI class and setState function
  final int lineNumber;
  final Structure structure;
  final Function update;
  @override
  State<Line> createState() => _LineState();
}

class _LineState extends State<Line> {
  late int row;
  @override
  void initState() {
    super.initState();
    row = widget.lineNumber;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0.2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //giving each block its amount so we can color it,
          //position as list ,the exact object from UI class
          //and the Function

          //1
          Block(widget.structure.gameArray[row][0], [widget.lineNumber, 0],
              widget.structure,
              update: widget.update),

          //2
          Block(widget.structure.gameArray[row][1], [widget.lineNumber, 1],
              widget.structure,
              update: widget.update),

          //3
          Block(widget.structure.gameArray[row][2], [widget.lineNumber, 2],
              widget.structure,
              update: widget.update),

          //4
          Block(widget.structure.gameArray[row][3], [widget.lineNumber, 3],
              widget.structure,
              update: widget.update),

          //5
          Block(widget.structure.gameArray[row][4], [widget.lineNumber, 4],
              widget.structure,
              update: widget.update),

          //6
          Block(widget.structure.gameArray[row][5], [widget.lineNumber, 5],
              widget.structure,
              update: widget.update),

          //7
          Block(widget.structure.gameArray[row][6], [widget.lineNumber, 6],
              widget.structure,
              update: widget.update),

          //8
          Block(widget.structure.gameArray[row][7], [widget.lineNumber, 7],
              widget.structure,
              update: widget.update),

          //9
          Block(widget.structure.gameArray[row][8], [widget.lineNumber, 8],
              widget.structure,
              update: widget.update),

          //10
          Block(widget.structure.gameArray[row][9], [widget.lineNumber, 9],
              widget.structure,
              update: widget.update),

          //11
          Block(widget.structure.gameArray[row][10], [widget.lineNumber, 10],
              widget.structure,
              update: widget.update),

          //12
          Block(widget.structure.gameArray[row][11], [widget.lineNumber, 11],
              widget.structure,
              update: widget.update),

          //13
          Block(widget.structure.gameArray[row][12], [widget.lineNumber, 12],
              widget.structure,
              update: widget.update),

          //14
          Block(widget.structure.gameArray[row][13], [widget.lineNumber, 13],
              widget.structure,
              update: widget.update),

          //15
          Block(widget.structure.gameArray[row][14], [widget.lineNumber, 14],
              widget.structure,
              update: widget.update),

          //16
          Block(widget.structure.gameArray[row][15], [widget.lineNumber, 15],
              widget.structure,
              update: widget.update),
        ],
      ),
    );
  }
}
