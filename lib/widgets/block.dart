import 'package:flutter/material.dart';
import '../structure/structure.dart';

class Block extends StatefulWidget {
  const Block(this.colorNumber, this.positionList, this.structure,
      {required this.update, super.key});
  //here we got the value so we can color the block,
  //the position list,
  //same exact object
  //and the update function
  final int colorNumber;
  final List<int> positionList;
  final Structure structure;
  final Function update;
  @override
  State<Block> createState() => _BlockState();
}

class _BlockState extends State<Block> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //if u press on Rook it well trigger this function
        widget.structure.gameArray[widget.positionList[0]]
                    [widget.positionList[1]] ==
                5
            ? onPressedOnRook()
            //else if u press on empty space it well trigger this function
            : widget.structure.gameArray[widget.positionList[0]]
                        [widget.positionList[1]] ==
                    0
                ? onPressedOnPossibleMoves()
                : null;
      },
      child: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 600),
            width: MediaQuery.of(context).size.width * 0.062,
            height: MediaQuery.of(context).size.height * 0.05,
            color: widget.structure.gameArray[widget.positionList[0]]
                        [widget.positionList[1]] ==
                    0
                ? Colors.amber
                : widget.structure.gameArray[widget.positionList[0]]
                            [widget.positionList[1]] ==
                        1
                    ? Colors.green
                    : widget.structure.gameArray[widget.positionList[0]]
                                [widget.positionList[1]] ==
                            5
                        ? Colors.blue
                        : Colors.red,
          ),
          widget.structure.gameArray[widget.positionList[0]].contains(5) &&
                  widget.positionList[0] != 9
              ? Positioned(
                  left: MediaQuery.of(context).size.width * 0.017,
                  top: MediaQuery.of(context).size.height * 0.01,
                  child: Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.03,
                      height: MediaQuery.of(context).size.height * 0.03,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }

  void onPressedOnRook() {
    {
      widget.update();
      widget.structure.checkMoves(
        widget.positionList[0],
        widget.positionList[1],
        widget.structure.gameArray,
        true,
      );
    }
  }

  void onPressedOnPossibleMoves() {
    {
      if (widget.structure.move(
        widget.structure.checkMoves(
          widget.structure.getPositionOfRook(5, widget.structure.gameArray)[0],
          widget.structure.getPositionOfRook(5, widget.structure.gameArray)[1],
          widget.structure.gameArray,
          false,
        ),
        widget.positionList,
      )) {
        widget.update();

        late List<int> tempList;

        //this for loop is just to get the position of rook (get x,y) andd minimize the complexity
        for (int i = 0;
            i < widget.structure.gameArray[widget.positionList[0]].length;
            i++) {
          tempList =
              widget.structure.getPositionOfRook(5, widget.structure.gameArray);
        }

        //Changing value of rook to empty space
        widget.structure.gameArray[tempList[0]][tempList[1]] = 0;

        // this list is just to get where the Rook well go if there is no wall under it
        // List tempGravityList = widget.structure.goDown(
        //   widget.structure.gameArray,
        //   widget.positionList[0],
        //   widget.positionList[1],
        // );

        //Put rook in empty space
        // widget.structure.gameArray[tempGravityList[0]][tempGravityList[1]] = 5;

        widget.structure.goDown(
          widget.structure,
          widget.positionList[0],
          widget.positionList[1],
        );
      } else {
        widget.structure.outPut = 'you can\'t move there';
        widget.update();
      }
    }
  }
}
